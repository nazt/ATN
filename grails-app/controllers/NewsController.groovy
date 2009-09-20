

class NewsController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ newsInstanceList: News.findAllByCorrectedNotEqual(true), newsInstanceTotal: News.count() ]
    }
	def nat = {  def results = News.findAllByCorrectedEqual(false); println results.size()}
    def show = {
        def newsInstance = News.get( params.id )

        if(!newsInstance) {
            flash.message = "News not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ newsInstance : newsInstance ]
        }
    }

    def delete = {
        def newsInstance = News.get( params.id )
        if(newsInstance) {
            try {
                newsInstance.delete(flush:true)
                flash.message = "News ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "News ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "News not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def newsInstance = News.get( params.id )

        if(!newsInstance) {
            flash.message = "News not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ newsInstance : newsInstance ]
        }
    }

    def update = {
        def newsInstance = News.get( params.id )
        if(newsInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(newsInstance.version > version) {
                    
                    newsInstance.errors.rejectValue("version", "news.optimistic.locking.failure", "Another user has updated this News while you were editing.")

                    render view:'edit', model:[newsInstance:newsInstance]
                    return
                }
            }
            newsInstance.properties = params
            if(!newsInstance.hasErrors() && newsInstance.save()) {
                flash.message = "News ${params.id} updated"

                redirect action:'show', id:newsInstance.id
            }
            else {
                render view:'edit', model:[newsInstance:newsInstance]
            }
        }
        else {
            flash.message = "News not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def newsInstance = new News()
        newsInstance.properties = params
        return ['newsInstance':newsInstance]
    }

    def save = {
        def newsInstance = new News(params)
        if(newsInstance.save(flush:true)) {
            flash.message = "News ${newsInstance.id} created"

            redirect action:"show", id:newsInstance.id
        }
        else {
            render view:'create', model:[newsInstance:newsInstance]
        }
    }
}
