<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>住客注册页面</title>
 <link type="text/css" rel="stylesheet" href="css/login.css">
    <script >
    var flag1=false,flag2=false;
    function chang2(obj){
    	var id=obj.value;
    	 var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
    	   if(reg.test(id) === false)  
    	   {  
    	       alert("身份证输入不合法");  
    	       flag2=false;  
    	   }  
    	else
    		flag2=true;
    }
    function chang1(obj)
    {
            var reg = /^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$/;
            var name=obj.value;
                       if (reg.test(name)===false) {
                            alert("姓名格式不正确,请重新输入");		
                     	flag1=false;
    					  }else
    			flag1=true;
    } 
    function sub(){
    	if(flag1&&flag2){
    		alert("即将提交注册信息");
       		document.checkin.submit();
    	}
    	else{
    		alert("请填写注册信息");
    	}
 
    }
    </script>

    <style>
    .bj_right{ float:left;width:199px; height:408px;}
    </style>

</head>
<body class="login_bj" >

<div class="zhuce_body">
    <div class="zhuce_kong">
    	<div class="zc">
        	<div class="bj_bai">
            <h3>欢迎注册</h3>
       	  	 <form method="post" name="checkin" action="Checkin">
       	  	  <input type="text" id="ID"
						name="ID" value=""class="kuang_txt possword"
						onChange="chang2(this)"placeholder="请输入身份证号"  >
                <input  id="name"
						type="text" name="name" value="" class="kuang_txt phone" 
						onChange="chang1(this)"placeholder="请输入名字"  >
                <input    id="time"
						type="text" name="time" class="kuang_txt email"  placeholder="请输入住房时间" value="" 
						onchange="chang0(this)">
						
						<input id="number" name="number" type="hidden" value="<%=request.getParameter("roomnumber")%>">
                <div>
               		<input name="" type="checkbox" value=""><span>已阅读并同意<a href="#" target="_blank"><span class="lan">《酒店入住协议》</span></a></span>
                </div>
                <button  type="button"  onClick="sub()";>提交</button>
                </form>
            </div>
        	<div class="bj_right">
            	<img src="images/21.jpg" width =185px height =408px>
            
            </div>
        </div>
    </div>
</div>
</body>
</html>