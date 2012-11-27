<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>

<%--<jcr:nodeProperty node="${currentNode}" name="maxNews" var="maxNews"/>--%>
<%--<jcr:nodeProperty node="${currentNode}" name="filter" var="filter"/>--%>
<%--<c:set var="query" value="select * from [jnt:content] as content where ISDESCENDANTNODE(content,'${currentNode.path}')"/>--%>
<c:set var="query" value="select * from [${currentNode.properties['j:type'].string}] as content where ISDESCENDANTNODE(content,'${currentNode.path}')"/>

<c:set var="requestParam" value="${param.request}"/>
<c:set var="field" value="${currentNode.properties.field}"/>
<c:if test="${!empty requestParam and !empty field}">
    <c:set var="query" value="${query} and LOWER(content.['${field.string}']) like '%${requestParam}%'" />
</c:if>

<query:definition var="listQuery" statement="${query}" />

<c:set target="${moduleMap}" property="editable" value="true" />
<c:set target="${moduleMap}" property="emptyListMessage"><fmt:message key="label.noItemFound"/></c:set>
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}" />
<c:set target="${moduleMap}" property="subNodesView" value="${currentNode.properties['j:subNodesView'].string}" />
