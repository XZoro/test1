<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>CheckTree</title>
    <%--<script src="../js/jquery-1.2.6.min.js" type="text/javascript"></script>--%>
    <%--<script src="../js/jquery.checktree.js" type="text/javascript"></script>--%>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function(){
           /*$("ul.tree").checkTree({

            });*/


            var cb = document.getElementsByName("checkname");

            for (var i=0;i<cb.length;i++){

                if (cb[i].value==1){
                    document.getElementById(cb[i].id).checked=true;
                }
                /*else{
                    document.getElementById(cb[i].id).checked=false;
                }*/
            }

            //子菜单选中，父菜单也选中
            /*$('input').click(function () {
                if ($(this).attr('checked')==true){
                    $(this).parents('li').children('div').children('input').attr('checked',true);
                    /!*$(this).closest('li').find('input').attr('checked',true);*!/
                }else{
                    // $(this).closest('li').find('input').attr('checked',false);
                    $(this).parents('li').children('div').children('input').removeAttr("checked",false);
                }
            });*/

            //父菜单选中，子菜单选中
            /*$('input[id="0"]').click(function () {
                if ($(this).is(':checked')){
                    $('input[name="checkname"]').each(function () {
                        $(this).attr("checked",true);
                    });
                }else{
                    $('input[name="checkname"]').each(function () {
                        $(this).removeAttr("checked",false);
                    });
                }
            });*/

            $('input[type="checkbox"]').change(function(e) {

                var checked = $(this).prop("checked"),
                    container = $(this).parent(),
                    siblings = container.siblings();

                container.find('input[type="checkbox"]').prop({
                    indeterminate: false,
                    checked: checked
                });

                checkSiblings(container);


                function checkSiblings(el) {

                    var parent = el.parent().parent(),
                        all = true;

                    el.siblings().each(function() {
                        return all = ($(this).children('input[type="checkbox"]').prop("checked") === checked);
                    });

                    if (all && checked) {

                        parent.children('input[type="checkbox"]').prop({
                            indeterminate: false,
                            checked: checked
                        });

                        checkSiblings(parent);

                    } else if (all && !checked) {

                        parent.children('input[type="checkbox"]').prop("checked", checked);
                        parent.children('input[type="checkbox"]').prop("indeterminate", (parent.find('input[type="checkbox"]:checked').length > 0));
                        checkSiblings(parent);

                    } else {

                        el.parents("li").children('input[type="checkbox"]').prop({
                            indeterminate: true,
                            checked: false
                        });

                    }

                }


                var cs = document.getElementsByName("checkname");
                for (var i=0;i<cb.length;i++){

                    if (cb[i].checked==1){
                        document.getElementById(cb[i].id).value=1;
                    }
                    else{
                        document.getElementById(cb[i].id).value=0;
                    }
                }
            });




            $('#sureClick').click(function () {
                var $inputArr = $('input');
                var result = [];
                $inputArr.each(function () {
                    result.push($(this).val());
                });
                alert(result);

            });

            
        });

        function checkboxOnclick(checkbox){
            if (checkbox.checked == true){
                checkbox.value=1;
            }
            else{
                checkbox.value=0;
            }
        }


    </script>


    <link type="text/css" rel="stylesheet" href="../css/checktree.css" />

</head>
<body>

<h2>Demo</h2>
<form action="" method="get">
<ul class="tree" style="margin-left: 15px;">
    <c:forEach items="${ls}" var="l">
        <c:if test="${l.id==0}">
        <li>
            <input type="checkbox" name="checkname" id="${l.id}" value="${l.check}" onchange="checkboxOnclick(this)">
            <label>${l.name}</label>
            <button onclick="window.location.href ='addGetLevel?id=${l.id}'">
                添加
            </button>
            <button onclick="window.location.href ='editLevel?id=${l.id}'">
                编辑
            </button>
            <%--<td><a  href="editLevel?id=${l.id}">编辑</a></td>--%>
            <button onclick="window.location.href ='deleteLevel?id=${l.id}'">
                删除
            </button>
            <ul>
                <c:forEach items="${ls}" var="m">
                    <c:if test="${m.cid==l.id}">
                        <li>
                            <input type="checkbox" name="checkname" id="${m.id}" value="${m.check}" onchange="checkboxOnclick(this)">
                            <label>${m.name}</label>
                            <button onclick="window.location.href ='addGetLevel?id=${m.id}'">
                                添加
                            </button>
                            <button onclick="window.location.href ='editLevel?id=${m.id}'">
                                编辑
                            </button>
                                <%--<td><a  href="editLevel?id=${l.id}">编辑</a></td>--%>
                            <button onclick="window.location.href ='deleteLevel?id=${m.id}'">
                                删除
                            </button>
                            <ul>
                                <c:forEach items="${ls}" var="t">
                                    <c:if test="${t.cid==m.id}">
                                        <li>
                                            <input type="checkbox" name="checkname" id="${t.id}" value="${t.check}" onchange="checkboxOnclick(this)">
                                            <label>${t.name}</label>
                                            <button onclick="window.location.href ='addGetLevel?id=${t.id}'">
                                                添加
                                            </button>
                                            <button onclick="window.location.href ='editLevel?id=${t.id}'">
                                                编辑
                                            </button>
                                                <%--<td><a  href="editLevel?id=${l.id}">编辑</a></td>--%>
                                            <button onclick="window.location.href ='deleteLevel?id=${t.id}'">
                                                删除
                                            </button>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </li>
        </c:if>
    </c:forEach>
</ul>
<button type="submit" id="sureClick">提交</button>
</form>
<br>
<br>

<%--<div>
    <form action="addLevel" method="post" id="level">
        <table>
            <tr><td>name:<input name="name"></td></tr>
            <tr><td>父菜单:<select name="cid" form="level">
                <c:forEach items="${ls}" var="o">
                    <c:if test="${o.cid==0||o.cid==99}">
                    <option value="${o.id}">${o.name}</option>
                    &lt;%&ndash;<option value="1">二级菜单1</option>
                    <option value="2">二级菜单2</option>
                    <option value="3">二级菜单3</option>
                    <option value="4">二级菜单4</option>&ndash;%&gt;
                    </c:if>
                </c:forEach>
                </select></td>
            </tr>
            <tr><td><button type="submit">提交</button></td></tr>
        </table>
    </form>
</div>--%>

</body>
</html>
