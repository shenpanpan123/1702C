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
	 $.post("<%= request.getContextPath()%>/peilist.do",function(arr){
		 for (var i = 0; i < arr.length; i++) {
			$("#ss").append("<input type='checkbox' name='pid' value='"+arr[i].pid+"' />"+arr[i].pname)
		 }
		 
	 },"json")

	 
	 $("input[value='添加']").click(function(){
			var param=$("form").serialize();
			 $.post("<%= request.getContextPath()%>/add.do",param,function(a){
				 if(a>0){
					 alert("添加成功");
					 location="<%= request.getContextPath()%>/list.do";
				 }else{
					 alert("添加失败")
				 }
				 
			 },"json")
     })
		


})





</script>
</head>
<body>
  <form action="">
    <table>
      <tr>
        <td>名称</td>
        <td>
          <input type="text" name="fname"/>
        </td>
      
      </tr>
    
      <tr>
        <td>价格</td>
        <td>
          <input type="text" name="price"/>
        </td>
      
      </tr>
    
      <tr>
        <td>主料</td>
        <td id="ss">
          
        </td>
      
      </tr>
    
      <tr>
        
        <td colspan="2">
            <input type="button" value="添加"/>
            <input type="button" value="返回"/>
        </td>
      
      </tr>
    
    </table>
  
  
  
  </form>


</body>
</html>