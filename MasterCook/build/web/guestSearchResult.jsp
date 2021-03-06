<%-- 
    Document   : guestSearchResult
    Created on : Sep 30, 2017, 5:46:29 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MasterCook</title>
    </head>
    <body>
        <s:set var="action" value="guestSearch"/>
        <% String name = "txtSearch";%>
        <% pageContext.setAttribute("name", name); %>
        <s:set var="nameComponent" value="%{#attr.name}"/>
        <s:set var="value" value="%{txtSearch}"/>
        
        <s:include value="header.jsp"/>
        
        <div class="container">
            <font class="col-md-12 categoryTitle">
                Your Search Value: <s:property value="%{txtSearch}"/>
            </font>
            <s:if test="%{searchResult == null}">
                <div>
                    <font color="red"><h3>No Result Found</h3></font>
                </div>
            </s:if>
            <s:if test="%{searchResult != null}">
                <s:iterator var="art" value="%{searchResult}" status="counter">
                    <div class="col-md-3">
                        <s:a value="viewDetails">
                            <s:param name="articleID" value="%{#art.id}"/>
                            <div class="homeMainArticleImg" style="background-image: 
                                 url('<s:property value="%{#art.imgLink}"/>')"></div>
                            <div class="homeMainArticle">
                                <div class="small-grid"><s:property value="%{#art.title}"/></div>
                                <i><s:property value="%{#art.createdDate}"/></i>
                            </div>
                        </s:a>
                    </div>
                    <s:if test="%{#counter.count % 4 == 0}">
                        <div class="col-md-12"><br/></div>
                    </s:if>
                </s:iterator>
                <s:if test="%{pageChooser != null}"> 
                    <div class="col-md-12"><br/></div>
                    <s:include value="pageChooser.jsp"/>
                </s:if>
            </s:if>
        </div>
        <div>
            <s:include value="footer.html"/>
        </div>
    </body>
</html>
