

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'news.label', default:'News')}" />
        <title>Edit ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${newsInstance}">
            <div class="errors">
                <g:renderErrors bean="${newsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${newsInstance?.id}" />
                <input type="hidden" name="version" value="${newsInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="corrected">
                                    <g:message code="news.corrected.label" default="Corrected" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'corrected','errors')}">
                                    <g:checkBox name="corrected" value="${newsInstance?.corrected}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateCreated">
                                    <g:message code="news.dateCreated.label" default="Date Created" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${newsInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastUpdated">
                                    <g:message code="news.lastUpdated.label" default="Last Updated" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${newsInstance?.lastUpdated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lexnews">
                                    <g:message code="news.lexnews.label" default="Lexnews" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'lexnews','errors')}">
                                    <input type="text" id="lexnews" name="lexnews" value="${fieldValue(bean:newsInstance,field:'lexnews')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="news">
                                    <g:message code="news.news.label" default="News" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'news','errors')}">
                                    <input type="text" id="news" name="news" value="${fieldValue(bean:newsInstance,field:'news')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
