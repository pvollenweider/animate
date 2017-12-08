<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<template:addResources type="css" resources="animate.min.css"/>
<template:addResources type="javascript" resources="jquery.min.js,jquery.appear.min.js"/>
<c:set var="animation" value=" ${currentNode.properties['j:animation'].string}"/>
<c:set var="animationDelay" value="${currentNode.properties['j:animationDelay'].double}"/>
<c:set var="animationDuration" value="${currentNode.properties['j:animationDuration'].double}"/>
<c:set var="animationIterationCount" value="${currentNode.properties['j:animationIterationCount'].string}"/>
<c:set var="identifier" value="${currentNode.identifier}"/>

<div id="${identifier}">
    ${wrappedContent}
</div>
<c:if test="${! renderContext.editMode}">
<template:addResources type="inline">
    <script>
        $(document).ready(function () {
            $('#${identifier}').appear(function () {
                <c:if test="${! empty animationDuration}">
                $("#${identifier}").css("animation-duration", "${animationDuration}s");
                </c:if>
                <c:if test="${! empty animationDelay && animationDelay > 0}">
                $("#${identifier}").css("animation-delay", "${animationDelay}s");
                </c:if>
                <c:if test="${! empty animationIterationCount && animationIterationCount ne '1'}">
                $("#${identifier}").css("animation-iteration-count", "${animationIterationCount}");
                </c:if>
                $("#${identifier}").addClass("animated ${animation}");
            });
        })
    </script>
</template:addResources>
</c:if>