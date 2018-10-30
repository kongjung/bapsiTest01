<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
   alert('당신이 오늘 당신이 먹어야 할 음식은 ${menu} 입니다!');
   location.href = "${pageContext.request.contextPath}/WhatToEat";
</script>