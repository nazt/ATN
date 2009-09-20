

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'news.label', default:'News')}" />
        <title>Show ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Show ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="news.id.label" default="Id" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:newsInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="news.corrected.label" default="Corrected" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:newsInstance, field:'corrected')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="news.dateCreated.label" default="Date Created" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:newsInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="news.lastUpdated.label" default="Last Updated" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:newsInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="news.lexnews.label" default="Lexnews" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:newsInstance, field:'lexnews')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="news.news.label" default="News" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:newsInstance, field:'news')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${newsInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
