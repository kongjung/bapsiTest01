<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.8.1, mobirise.com">
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon"
   href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png"
   type="image/x-icon">
<meta name="description" content="">
<title>topMenu</title>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/socicon/css/styles.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/style.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/theme/css/style.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/assets/mobirise/css/mbr-additional.css"
   type="text/css">
<!-- 드롭박스 추가 -->   
<link rel="stylesheet" 
   href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/ddmenu.css"
   type="text/css">
   

<script
   src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/assets/parallax/jarallax.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/assets/viewportchecker/jquery.viewportchecker.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
<!-- 드롭박스 추가  -->
<script
   src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/ddmenu.js"></script>



</head>
<body>
   <section class="menu cid-r4OiAWAZRu" once="menu" id="menu2-0">



      <nav
         class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
         <button class="navbar-toggler navbar-toggler-right" type="button"
            data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <div class="hamburger">
               <span></span> <span></span> <span></span> <span></span>
            </div>
         </button>
         <div class="menu-logo">
            <div class="navbar-brand">
               <span class="navbar-logo"> <a
                  href="${pageContext.request.contextPath}"> <img
                     src="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png"
                     alt="Mobirise" title="" style="height: 5.9rem;">
               </a>
               </span> <span class="navbar-caption-wrap"><a
                  class="navbar-caption text-secondary display-4"
                  href="${pageContext.request.contextPath}">Bapsi</a></span>
            </div>
         </div>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <c:if test="${not empty userVO}">
               <b style="color: red">${userVO.nickname}(${userVO.email})</b>님 환영합니다.
                 </c:if>

            <ul class="navbar-nav nav-dropdown nav-right"
               data-app-modern-menu="true">
               <li class="nav-item"><a
                  class="nav-link link text-black display-5"
                  href="https://mobirise.com"><span
                     class="mbrib-smile-face mbr-iconfont mbr-iconfont-btn"></span></a></li>
               <li class="nav-item"><a
                  class="nav-link link text-black display-5" href="${pageContext.request.contextPath}/recipe/new"><span
                     class="mbri-plus mbr-iconfont mbr-iconfont-btn"></span></a></li>
               <li class="nav-item dropdown open"><a
                  class="nav-link link text-black dropdown-toggle display-5" href=""
                  data-toggle="dropdown-submenu" aria-expanded="true"><span
                     class="mbri-users mbr-iconfont mbr-iconfont-btn"></span></a>
                  <div class="dropdown-menu">
                     <c:choose>
                        <c:when test="${empty userVO}">
                           <a class="text-black dropdown-item display-5"
                              href="${pageContext.request.contextPath}/login">로그인</a>
                        </c:when>
                        <c:otherwise>
                           <a class="text-black dropdown-item display-5"
                              href="${pageContext.request.contextPath}/logout">로그아웃</a>
                           <a class="text-black dropdown-item display-5"
                              href="${pageContext.request.contextPath}/${no}/mypage"
                              aria-expanded="false">마이페이지</a>
                        </c:otherwise>
                     </c:choose>
                     <c:if test="${userVO.type == 'S'}">
                        <a class="text-black dropdown-item display-5"
                           href="${pageContext.request.contextPath}/list"
                           aria-expanded="false">회원목록</a>
                     </c:if>
                  </div></li>
            </ul>

         </div>
      </nav>
   </section>

   <section class="engine">
      <a href="https://mobiri.se/q">responsive website templates</a>
   </section>
   
   <section class="mbr-section content8 cid-r4OiCHvuLI" id="content8-2">
   <div class="container">
         <div class="media-container-row title">
            <div class="col-12 col-xl-10">
               <div class="mbr-section-btn align-center">
               
            <nav id="ddmenu">
             <div class="menu-icon"></div>
             <ul>
                 <li class="full-width">
                     <span class="top-heading">&nbsp;&nbsp;&nbsp;카테고리&nbsp;&nbsp;&nbsp;</span>
                     <i class="caret"></i>&nbsp;&nbsp;&nbsp;
                     <div class="dropdown">
                         <div class="dd-inner">
                             <ul class="column">
                                 <li><h3>상황별 요리</h3></li>
                                 <li><a href="#">간식/야식</a></li>
                                 <li><a href="#">술안주</a></li>
                                 <li><a href="#">해장요리</a></li>
                                 <li><a href="#">손님 접대 요리</a></li>
                                 <li><a href="#">나들이 요리</a></li>
                                 <li><a href="#">파티/명절요리</a></li>
                                 <li><a href="#">실생활 요리</a></li>
                             </ul>
                             <ul class="column">
                                 <li><h3>나라별 요리</h3></li>
                                 <li><a href="#">한식 요리</a></li>
                                 <li><a href="#">중식 요리</a></li>
                                 <li><a href="#">일식 요리</a></li>
                                 <li><a href="#">동남아/인도 요리</a></li>
                                 <li><a href="#">멕시칸 요리</a></li>
                                 <li><a href="#">양식 요리</a></li>
                                 <li><a href="#">퓨전 요리</a></li>
                             </ul>
                             <ul class="column">
                                 <li><h3>재료별 요리</h3></li>
                                 <li><a href="#">육류 요리</a></li>
                                 <li><a href="#">채소류 요리</a></li>
                                 <li><a href="#">해산물 요리</a></li>
                                 <li><a href="#">콩/두부 요리</a></li>
                                 <li><a href="#">과일 요리</a></li>
                                 <li><a href="#">달걀/유제품 요리</a></li>
                                 <li><a href="#">면/만두 요리</a></li>
                                 <li><a href="#">김치 요리</a></li>
                                 <li><a href="#">제철재료 요리</a></li>
                                 <li><a href="#">가공식품 요리</a></li>
                             </ul>
                             <ul class="column">
                                 <li><h3>조리법별 요리</h3></li>
                                 <li><a href="#">밥 요리</a></li>
                                 <li><a href="#">면 요리</a></li>
                                 <li><a href="#">국물 요리</a></li>
                                 <li><a href="#">찜/조리/구이 요리</a></li>
                                 <li><a href="#">볶음/튀김/부침 요리</a></li>
                                 <li><a href="#">나물/샐러드 요리</a></li>
                                 <li><a href="#">김장/절임 요리</a></li>
                                 <li><a href="#">베이킹/디저트 요리</a></li>
                                 <li><a href="#">양념/소스/잼</a></li>
                                 <li><a href="#">음료/차/커피</a></li>
                             </ul>
                             <!-- <ul class="column mayHide">
                                 <li><br /><img src="ddmenu/img1.jpg" /></li>
                             </ul> -->
                         </div>
                     </div>
                 </li>
               <li class="no-sub"><a class="top-heading" href="${pageContext.request.contextPath}/recipe/nightmeal">&nbsp;&nbsp;야식&nbsp;&nbsp;</a></li>
                 <li class="no-sub"><a class="top-heading" href="${pageContext.request.contextPath}/recipe/ranking/user">&nbsp;&nbsp;랭킹&nbsp;&nbsp;</a></li>
                 <li class="no-sub"><a class="top-heading" href="${pageContext.request.contextPath}/recipe/recipeList">&nbsp;&nbsp;전체 레시피&nbsp;&nbsp;</a></li>
                 <li class="no-sub"><a class="top-heading" href="${pageContext.request.contextPath}/youtuber">&nbsp;&nbsp;유투버 먹방&nbsp;&nbsp;</a></li>
             </ul>
         </nav>
         
         </div>
      </div>
   </div>
</div>
</section>   
   
   
   </body>
</html>