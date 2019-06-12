<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/index3.css" type="text/css">
<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(function(){
	
	$("input[value='添加']").click(function(){
		
		location="<%= request.getContextPath()%>/views/add.jsp";
	})
	$("input[value='编辑']").click(function(){
		var fid=$(this).next().val()
		location="<%= request.getContextPath()%>/views/update.jsp?fid="+fid;
	})
	$("input[value='查看']").click(function(){
		var fid=$(this).next().next().val()
		location="<%= request.getContextPath()%>/views/show.jsp?fid="+fid;
	})
	$("input[value='批量删除']").click(function(){
		var fids=$("input[name='id']:checked").map(function(){
			return $(this).val();
		}).get().join(",");
		
		if(confirm("确定删除么")){
			 
					
					 $.post("<%= request.getContextPath()%>/delall.do",{fids:fids},function(a){
						 if(a>0){
							 alert("批量删除成功");
							 location="<%= request.getContextPath()%>/list.do";
						 }else{
							 alert("批量删除失败")
						 }
						 
					 },"json")
		    
			
			
		}else{
			alert("取消删除成功")
		}
	})
	
	$("input[name='ii']").click(function(){
		$("input[name='id']").prop("checked",$(this).prop("checked"))
		
	})
	
	
		$("input[value='删除']").click(function(){
		var fids=$(this).prev().val()
		
		if(confirm("确定删除么")){
			 
					
					 $.post("<%= request.getContextPath()%>/delall.do",{fids:fids},function(a){
						 if(a>0){
							 alert("删除成功");
							 location="<%= request.getContextPath()%>/list.do";
						 }else{
							 alert("删除失败")
						 }
						 
					 },"json")
		    
			
			
		}else{
			alert("取消删除成功")
		}
	})
	
	
	
})







function fenye(page){
	$("input[name='page']").val(page)
	$("form").submit();
}




</script>
</head>
<body>
<input type="button" value="添加"/>
 <form action="<%= request.getContextPath()%>/list.do" method="post">
 
 菜名:<input type="text" name="fname" value="${fname }"/>
   <input type="hidden" name="page"/>
 <input type="submit" value="搜索"/>
 
 </form>



  <table>
     <tr>
        <td>
          <input type="checkbox" name="ii"/>全选
        </td>
        <td>ID</td>
        <td>名称</td>
        <td>主料</td>
        <td>价格（元）</td>
        <td>操作</td>
        
     </tr>
     <c:forEach items="${list }" var="s">
        <tr>
          <td>
             <input type="checkbox" name="id" value="${s.fid }"/>
          </td>
          <td>${s.fid }</td>
          <td>${s.fname }</td>
          <td>${s.pname }</td>
          <td>${s.price }</td>
          <td>
            <input type="button" value="查看"/>
            <input type="button" value="编辑"/>
            <input type="hidden" value="${s.fid }"/>
            <input type="button" value="删除"/>
           
          </td>
        
        </tr>
      
     
     </c:forEach>
     <tr>
        <td colspan="10">
           <input type="button" value="首页" onclick="fenye(1)"/>
           <input type="button" value="上一页" onclick="fenye(${pi.isIsFirstPage()?1:pi.getPrePage()})"/>
           <input type="button" value="下一页" onclick="fenye(${ pi.isIsLastPage()?pi.getPages():pi.getNextPage()})"/>
           <input type="button" value="尾页" onclick="fenye(${pi.getPages()})"/>
          当前${pi.getPageNum() }页共${pi.getPages()}   页
        </td>
     
     </tr>
     <tr>
       <td colspan="10">
       <input type="button" value="批量删除"/>
       </td>
       
     </tr>
     
  </table>

</body>
</html>