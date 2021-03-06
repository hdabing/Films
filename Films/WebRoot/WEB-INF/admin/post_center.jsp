<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String filePath=getServletContext().getRealPath("/");
%>
<jsp:include page="top.jsp"></jsp:include>
<table width="100%" height="85%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="147" valign="top"><jsp:include page="left.jsp"></jsp:include></td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
    <td valign="top" width="1092">
    <div class="content">
    <div class="main">
        <div class="eidtor">
            <div class="box_t over">
                <div class="box_l"></div>
                <div class="box_r"></div>
            </div>
            <div class="bk">
                <div class="cap">
                    <div class="cap_l"></div>
                    <i class="ico">&nbsp;</i>
        			<span class="h3">发布电影</span>                  
                    <div class="cap_r"></div>
                </div>
				
                <div class="input_form reg_form">
				<form name="movieform" id="reg_form" method="post" enctype="multipart/form-data" action="/Films/filmCenter.do?flag=postMovie" >
                   <input id="validator" name="validator" value="1" type="hidden">
                    <fieldset class="clearfix">
                    
                        <label for=""><em>*</em>电影名称</label>
                        <input name="FFilmName" id="FFilmName" class="ipt" type="text">
                        <span class="err_red"></span> 
                        
                    </fieldset>
                    <br/>
                    <fieldset class="clearfix">
                    
                        <label for=""><em>*</em>&nbsp;导&nbsp;&nbsp;演&nbsp;</label>
                        <input name="FDirector" id="FDirector" class="ipt" type="text">
                        <span class="err_red"></span> 
                        
                    </fieldset>
                    <br/>
                    <fieldset class="clearfix">
                    
                        <label for=""><em>*</em>&nbsp;演&nbsp;&nbsp;员&nbsp;</label>
                        <input name="FPlay" id="FPlay" class="ipt" type="text">
                        <span class="err_red">为了美观，字数最好保持在12-23。</span> 
                        
                    </fieldset>
                    <br/>
                    <fieldset class="clearfix">
                        <label for="" class="no"><em>*</em>&nbsp;语&nbsp;&nbsp;言&nbsp;</label>
                        <input name="FLanguage" value="国语" checked="checked" type="radio"> 国语&nbsp;&nbsp;
                        <input name="FLanguage" value="外语" type="radio"> 外语
                    </fieldset>
                    <br/>
                    <fieldset class="clearfix">
                        <label for=""><em>*</em>&nbsp;片&nbsp;&nbsp;长&nbsp;</label>
                        <input id="FLong" name="FLong" maxlength="4" size="4" class="ipt" type="text">
                       <span class="err_red"></span>
                    </fieldset>
                    <br/>
                    <fieldset class="clearfix">
                        <label for=""><em>*</em>上映日期</label>
                        <input id="FDate" name="FDate" maxlength="20" size="30" class="ipt" type="text" readonly="readonly" onclick="Calendar('FDate');">
                        <span class="err_red"></span>
                    </fieldset>
                   
                    <br/>
                  
                     <fieldset class="clearfix">
                        <label for="" class="no"><em>*</em>&nbsp;版&nbsp;&nbsp;本&nbsp;</label>
                        <input name="FType" value="2D" checked="checked" type="radio"> 2D&nbsp;&nbsp;
                        <input name="FType" value="3D" type="radio"> 3D
                    </fieldset>
                    <br/>
                    <fieldset class="clearfix">
                        <label for=""><em>*</em>电影类型</label>
                        <select name="sortID">
                        <c:forEach var="sorts" items="${sort }">
                        <option value="${sorts.sid }">${sorts.ssort}</option>
                        </c:forEach>
                        </select>
                        <span class="err_red"></span>
                    </fieldset>
                    <span id="preview"></span>
                    <br/>
                    <fieldset class="clearfix">
                        <label for=""><em>*</em>国家地区</label>
                        <select name="FAid">
                        <c:forEach var="areas" items="${area }">                       
                        <option value="${areas.aid }">${areas.azone }</option>                    
                        </c:forEach>                    
                        </select>
                        <span class="err_red"></span>
                    </fieldset>
                    <br/>
                    <fieldset class="clearfix">
                        <label for=""><em>*</em>电影简介</label>
                        <textarea rows="4" cols="26" name="FIntro" id="FIntro"></textarea> 
                        <span class="err_red"></span>
                    </fieldset>
                   
                    <br/>
                    <fieldset class="clearfix">
                        <label for=""><em>*</em>电影海报</label>
                        <input type="file" name="filmPhoto" title="请上传大小为196*279的图片" class="ipt" onchange="previewImage(this)"/>
                    </fieldset>
                    
                   
                    <br/>
              		<div class="btns clearfix">
                        <a title="立即发布" id="reg_sumit" class="btn big" href="javascript:void(0);">立即发布</a>
                   </div>
				  </form>
				 
                </div>
            </div>       
        </div>
    </div>
</div>  
    </td>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
  </tr>
</table>
<script type="text/javascript">
//回车登陆
document.onkeydown=function(event){ 
	e = event ? event :(window.event ? window.event : null); 
	if(e.keyCode==13){ 
		$("#reg_sumit").click(); 
	} 
};

	$("#reg_sumit").click(function(){
		if($("#FFilmName").val()==''){
			alert("请填写影片名！");
		}else if($("#FDirector").val()==''){
			alert("请填写影片导演！");
		}else if($("#FPlay").val()==''){
			alert("请填写影片主演！");
		}else if($("#FLong").val()==''){
			alert("请填写影片时长！");
		}else if($("#FDate").val()==''){
			alert("请填写影片上映日期！");
		}else if($("#FIntro").val()==''){
			alert("请填写影片介绍！");
		}else{
			$("#reg_form").submit();
		}
	});

</script>
<script type="text/javascript" src="<%=path %>/js/Imgpreview.js"></script>
<jsp:include page="down.jsp"></jsp:include>