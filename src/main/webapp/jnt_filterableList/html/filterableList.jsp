<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="javascript" resources="jquery.min.js"/>
<script type="text/javascript">
    function requestFilteredList(param) {
        var response = $.ajax({url: "${url.base}${currentNode.path}.hidden.list.html.ajax?request="+param,
                dataType: "html",
                success: function(data){
                    $("#list_${currentNode.identifier}").html(data);
                }
        });
    }
    $(document).ready(function() {
        $("#filter_${currentNode.identifier}").keyup(function() {
            requestFilteredList($("input#filter_${currentNode.identifier}").val().toLowerCase());
        });
    });
</script>

<form action="#">
    <fieldset>
        <input id="filter_${currentNode.identifier}" type="text"/>
    </fieldset>
</form>
<div id="list_${currentNode.identifier}">
    <template:include view="hidden.list"/>
</div>