

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'news.label', default:'News')}" />
        <title>${entityName} List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>${entityName} List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="${message(code:'news.id.label', default:'Id')}" />
                        
                   	        <g:sortableColumn property="corrected" title="${message(code:'news.corrected.label', default:'Corrected')}" />
                        
                   	        <g:sortableColumn property="dateCreated" title="${message(code:'news.dateCreated.label', default:'Date Created')}" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="${message(code:'news.lastUpdated.label', default:'Last Updated')}" />
                        
                   	        <g:sortableColumn property="lexnews" title="${message(code:'news.lexnews.label', default:'Lexnews')}" />
                        
                   	        <g:sortableColumn property="news" title="${message(code:'news.news.label', default:'News')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${newsInstanceList}" status="i" var="newsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${newsInstance.id}">${fieldValue(bean:newsInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:newsInstance, field:'corrected')}</td>
                        
                            <td>${fieldValue(bean:newsInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:newsInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:newsInstance, field:'lexnews')}</td>
                        
                            <td>${fieldValue(bean:newsInstance, field:'news')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${newsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
