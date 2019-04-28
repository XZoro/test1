<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<div style="margin: 0px auto; width: 500px" >

    <form action="addLevel" method="post">
        name:<input name="name" value=""/><br>
        父菜单:${level.name}
        <input name="cid" value="${level.id}" type="hidden"/><br>

        <%--<input name="id" type="hidden" value="${level.id}">--%>
        <button type="submit">提交</button>
    </form>
</div>