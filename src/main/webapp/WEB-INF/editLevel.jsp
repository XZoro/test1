<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<div style="margin: 0px auto; width: 500px" >

    <form action="updateLevel" method="post">
        name:<input name="name" value="${level.name}"/><br>
        cid:<input name="cid" value="${level.cid}"/><br>

        <input name="id" type="hidden" value="${level.id}">
        <button type="submit">提交</button>
    </form>
</div>