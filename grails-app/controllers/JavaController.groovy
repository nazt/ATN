import helloworld.*
import org.nazt.lexto.*
import groovy.util.*
import java.*
import groovy.util.*

class JavaController {
 
	def myTypeList,myIndexList=[]
    def index = { 
		def lexdict=new File("lexitron.txt")
		LongLexTo tokenizer=new LongLexTo("SELFED DICT")
		lexdict.eachLine{ tokenizer.addDict(it.trim()) }
		def news=new File("news.txt")
		news.eachLine{ line ->
			tokenizer.wordInstance(line.trim())
			myTypeList = tokenizer.getTypeList()
			myIndexList=tokenizer.getIndexList()
		
			def indexer=0
			def longlexnews=""
			myIndexList.eachWithIndex{ val, idx ->
				longlexnews+= line[indexer..val-1] + "|" 
				indexer=val
			}
			new News(news:line,lexnews:longlexnews,corrected:false).save()
 
			render longlexnews + "nat2<br>\n"
		
		
				
		}
	


	println myIndexList
	println myTypeList
 

	 } 
}
/*/	

	println System.getProperty("user.dir");
	
	System.setProperty( "file.encoding", "UTF-8" );*/
/*System.out.println("Encoding: " + System.getProperty("file.encoding"));
System.out.println("Charset: " + java.nio.charset.Charset.defaultCharset());

 System.out.println("Encoding: " + System.getProperty("file.encoding"));
System.out.println("Charset: " + java.nio.charset.Charset.defaultCharset());
*/