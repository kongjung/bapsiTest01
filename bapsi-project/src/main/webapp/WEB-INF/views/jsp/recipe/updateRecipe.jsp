
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png" type="image/x-icon">

    <title>배꼽시계</title>

   <!---Font Icon-->
    <link href="${pageContext.request.contextPath}/resources/writeRecipe/css/font-awesome.min.css" rel="stylesheet">

    <!-- CSS -->
    <link href="${pageContext.request.contextPath}/resources/writeRecipe/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/writeRecipe/css/styles.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/writeRecipe/css/select2.min.css" rel="stylesheet">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico" />
    <link rel="icon" href="favicon.ico" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
       
    
</head>
<body>
   <!-- topMenu -->
   <header class="navbar-fixed-top"><jsp:include page = "/WEB-INF/views/jsp/include/topMenu.jsp" /></header>


    <!-- 레시피 작성 -->
    <div class="submit">
        <div class="title">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>나만의 레시피 수정하기</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
<form:form method="post" commandName="recipeVO">


                        <div class="form-group">
                            <label>제목</label>
                            <form:input type="text" path="title" value="${recipeVO.title}" class="form-control" />
                           <form:errors path="title" />
                        </div>
                        
                        <div class="form-group">
                            <label>한줄 설명</label>
                            <form:input type="text" path="subTitle" value="${recipeVO.subTitle}" class="form-control" />
                           <form:errors path="subTitle" />
                        </div>
                        
                        <div class="form-group">
                            <label>음식이름</label>
                            <form:input type="text" path="recipeName" value="${recipeVO.recipeName}" class="form-control" />
                           <form:errors path="recipeName" />
                        </div>

                        <div class="form-group">
                            <label>레시피 정보</label>
                            <form:textarea path="content" value="${recipeVO.content}" class="form-control" rows="7" required="required" />
                            <form:errors path="content" />
                        </div>
                        
                        <div class="form-group">
                            <label>Upload your photos</label>
                            <input type="file" class="form-control-file">
                        </div>

                        <div class="form-group">
                            <label>추가 정보</label>
                            <hr>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">조리분량</label>
                            <div class="col-sm-10">
                                <form:input type="number" path="servings" value="${recipeVO.servings}"  min="0" class="form-control" />인분
                                <form:errors path="servings" />
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">조리시간</label>
                            <div class="col-sm-10">
                        조리시간 총 <form:input type="number" path="time" value="${recipeVO.time}" min="0" class="form-control" />분 소요
                                <form:errors path="time" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">금액</label>
                            <div class="col-sm-10">
                                <form:input type="number" path="cost" value="${recipeVO.cost}" min="0" pattern="[0-9]+([,\.][0-9]+)?" class="form-control" />원 소요
                                <form:errors path="cost" />
                            </div>
                        </div>
 

                        <div class="form-group">
                            <label>재료정보</label>
                            
                            <div id="sortable">
                            
                            <div aria-hidden="true">
                             <div class="box ui-sortable-handle" id="append">
                                    <div class="row">
                                        <div class="col-lg-1 col-sm-1">
                                            <i class="mbri-up-down mbr-iconfont mbr-iconfont-btn" aria-hidden="true"></i>
                                        </div>
                                        <div class="col-lg-5 col-sm-5">
                                 <form:select path="rIngList" class="js-search-category form-control select2-hidden-accessible" name="category" aria-hidden="true">
                                    <c:forEach items="${ ingList }" var="ing" varStatus="loop">
                                       <form:option path="rIngList" value="${loop.count}" label="${ing.ingName}" />
                                       <form:errors path="rIngList"/>   
                                    </c:forEach>
                                 </form:select>
                                        </div>
                              <div class="col-lg-5 col-sm-5">
                                 <form:input type="text" path="amountList" class="form-control" placeholder="분량(예. 1포기)" />
                                 <form:errors path="amountList" />
                              </div>
                               <div class="col-lg-1 col-sm-1">
                                            <i class="fa fa-times-circle-o minusbtn socicon socicon-macos mbr-iconfont mbr-iconfont-btn" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            
                            <c:forEach items="${rIngList}" var="rIng">
                                <div class="box ui-sortable-handle">
                                    <div class="row">
                                        <div class="col-lg-1 col-sm-1">
                                            <i class="mbri-up-down mbr-iconfont mbr-iconfont-btn" aria-hidden="true"></i>
                                        </div>
                                        <div class="col-lg-5 col-sm-5">
                                 <form:select path="rIngList" class="js-search-category form-control select2-hidden-accessible" name="category" aria-hidden="true">
                                    <c:forEach items="${ ingList }" var="ing" varStatus="loop">
                                       <c:choose>
                                       <c:when test="${rIng.ingNo == loop.count}">
                                       <form:option path="rIngList" value="${loop.count}" label="${ing.ingName}" selected="true"/>
                                       </c:when>
                                       <c:otherwise>
                                       <form:option path="rIngList" value="${loop.count}" label="${ing.ingName}" />
                                       </c:otherwise>
                                       </c:choose>
                                       <form:errors path="rIngList"/>   
                                    </c:forEach>
                                 </form:select>
                                        </div>
                              <div class="col-lg-5 col-sm-5">
                                 <form:input type="text" path="amountList" class="form-control" value="${rIng.amount}" />
                                 <form:errors path="amountList" />
                              </div>
                               <div class="col-lg-1 col-sm-1">
                                            <i class="fa fa-times-circle-o minusbtn socicon socicon-macos mbr-iconfont mbr-iconfont-btn" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                     </c:forEach>
                            </div>
                            
                            <a href="#" class="btn btn-light">재료 추가하기</a>
                        </div>


                        
                        <div class="form-group">
                            <label>레시피 태그 정보</label>
                            <hr>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-sm-2 col-form-label">태그카테고리</label>
                            <div  class="col-sm-10">
                        <c:forEach items="${ tagList }" var="tag" varStatus="loop">
                        <c:set var="doneLoop" value="false" />
                        <c:forEach items="${rTagList}" var="rTag">
                        <c:if test="${not doneLoop}">
                        <c:choose>
                        <c:when test="${loop.count <= rTag.tagNo}">
                        <c:if test="${rTag.tagNo == loop.count}">
                        <form:checkbox path="rTagList" value="${loop.count}" label="${tag.tagName}" checked="true"/>
                        <c:set var="doneLoop" value="true" />
                        </c:if>
                        <c:if test="${rTag.tagNo != loop.count}">
                         <form:checkbox path="rTagList" value="${loop.count}" label="${tag.tagName}" />
                         <c:set var="doneLoop" value="true" />
                        </c:if>
                        <form:errors path="rTagList" />   
                        </c:when>
                        <c:when test="${rTag.tagNo >= max.tagNo && max.tagNo < loop.count}">
                         <form:checkbox path="rTagList" value="${loop.count}" label="${tag.tagName}" />
                        
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                        </c:choose>
                        </c:if>
                        </c:forEach>
                        
                        </c:forEach>
                        
                        <input type="hidden" name="page"
                        id="page" value="${page}" />
                     <input type="hidden" name="numPerPage"
                        id="numPerPage" value="${numPerPage}" />
                  <input type="hidden" name="no"
                        id="no" value="${recipeVO.no}" />
                        
                            </div>
                        </div>
                        
                       <input type="submit" value="수정하기" class="btn btn-submit">
</form:form>

 
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
   <jsp:include page = "/WEB-INF/views/jsp/include/footer.jsp" />

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/jquery-ui.js"></script>

    <script src="${pageContext.request.contextPath}/resources/writeRecipe/js/scripts.js"></script>


</body>
<script>
$(document).ready(function(){
   //Select2
   $(".js-search-category").select2({
      maximumSelectionLength: 1,
       placeholder: "재료를 선택하세요"
   })
   
   $("#append").hide();
});

</script>
</html>




