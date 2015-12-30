<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
<link href="${ctxStatic}/star/star.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	var startTime = new Date().getTime();
		$(document).ready(function() {
			$("#learnRecordBtn").click(function(){
				var difficulty = $('#difficulty').val();
				var helpfull = $('#helpfull').val();
				if(difficulty<1 || helpfull<1){
					showTip("请选择难易度和帮助度。");
					return;
				}
				var learnMinutes =Math.ceil((new Date().getTime()-startTime )/1000/60);
				$.ajax({
				    type: 'POST',
				    url: '${ctxAdmin}/learn/learnRecords/saveLearnRecords' ,
				    data: {
				    	"id":'${learnRecords.id}',
				    	'difficultyDegree' : difficulty,
				    	'helpDegree' : helpfull,
				    	'learnMinutes' : learnMinutes,
				    	'article.id' : '${article.id}'
				    },
				    dataType: 'json',
				    success: function(data){
				    	if(data){
				    		showTip("保存成功！");
				    	}
				    }
				});
			});
				$("#addFavoriteA").click(function(){
					var favoriteId = $('#favoriteIdInput').val();
					if(favoriteId){
						$.ajax({
						    type: 'POST',
						    url: '${ctxAdmin}/learn/favorite/delFavorite' ,
						    data: {'favoriteId' : favoriteId },
						    dataType: 'json',
						    success: function(data){
						    	if(data){
						    		$('#favoriteIdInput').val('');
						    		$("#addFavoriteA").text('收藏');
						    	}
						    }
						});
					}else{
						$.ajax({
						    type: 'POST',
						    url: '${ctxAdmin}/learn/favorite/addFavorite' ,
						    data: { 'articleId' : '${article.id}'},
						    dataType: 'json',
						    success: function(data){
						    	if(data && data.id){
						    		$('#favoriteIdInput').val(data.id)
						    		$("#addFavoriteA").text('取消收藏');
						    	}
						    },
						    error : function() {  
						    	           alert("异常！");  
						    	} 
						});
					}
			});
		});
	</script>
</head>
<body>

	<div class="row" id="content-container">
	
	<div class="span3">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="media media-default">
						<div class="media-left">
							<img class="avatar-md"
								src=" ${ctxStatic}/front/091008008a96767512.jpg">
						</div>
						<div class="media-body">
							<div class="title">${fns:getUser().name} ${fns:getUser().no}</div>
							<div class="content">${fns:getUser().company.name}</div>
							<div class="content" style="padding-top:10px;"><a href="${ctxAdmin}/logout" class="btn btn-success pull-right">注销</a></div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
			<div class="panel-heading">
					<h3 class="panel-title">${category.name}</h3>
				</div>
				<div class="panel-body" >
				
				<c:forEach items="${page.list}" var="article">
					<div class="media media-number" >
						<div class="media-title" >
			               <a class="link-light" href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}">${article.sort} ${article.title}</a> 
			            </div>
			         </div>
				</c:forEach>
				</div>
			</div>
		</div>
	
		<div class="span9">
			
			<div class="panel panel-default">
			<div class="panel-heading">
				<ol class="breadcrumb">
				<cms:frontCurrentPosition category="${category}"/>
				</ol>
			</div>
			
			<div class="panel-body article-detail-main" >
				<div>
        <div class="article-metas">
  <div class="pull-left">
    <div class="date" title="<fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/>">
      <div class="day"><fmt:formatDate value="${article.createDate}" pattern="dd"/></div>
      <div class="month"><fmt:formatDate value="${article.createDate}" pattern="MM"/>月</div>
    </div>
  </div>
  <div class="metas-body">
    <h2 class="title">
     ${article.title}
    </h2>
    <div class="sns">
      <span class="views-num">
        阅读次数： ${article.hits}
      </span>
    <%--  <span class="views-num">
        分享次数：${article.shareNumber}
      </span> --%>
      <span class="pull-right">
        <a href="javascript:void(0);"  id="addFavoriteA">${not empty favorite.id?'取消':''}收藏</a> 
      </span>
    </div>
    <div class="bdsharebuttonbox pull-right" >
			<a title="分享到QQ空间" class="bds_qzone" href="#" data-cmd="qzone"></a>
			<a title="分享到腾讯微博" class="bds_tqq" href="#" data-cmd="tqq"></a>
			<a title="分享到新浪微博" class="bds_tsina" href="#" data-cmd="tsina"></a>
			<a title="分享到微信" class="bds_weixin" href="#" data-cmd="weixin"></a>
		</div>
		<script>
		window._bd_share_config={"common":{"bdSnsKey":{},"bdUrl":"<%=basePath%>${ctx}/shareView-${article.id}.html","bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tqq","renren","tsina","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
  </div>
</div>
        <div class="article-text">
  ${article.articleData.content}
</div>
				</div>
				
			<ul class="x-top" style="padding-left:0px">
                        <div class="fy f zhs"><span class="jg35">上一篇</span></div>
                        <div class="fy f txtRight zhs"><span class="jg352">下一篇</span></div>
                        <div class="fy f"><a class="PREVIOUS"  href="${articlePre.url}" style="color:${articlePre.color}">${fns:abbr(articlePre.title,28)}</a></div>
                        <div class="fy f txtRight"><a class="NEXT"  href="${articleNext.url}" style="color:${articleNext.color}">${fns:abbr(articleNext.title,28)}</a></div>
                        <div class="dr"></div>
                        <div class="df"></div>
                        </ul>				
			</div>
			
			</div>
			<div class="panel panel-default">
				<div class="panel-body" >
				<div class="media media-number" >
		            <div class="media-body" >
		              <input id="helpfull" name="helpfull" value="${learnRecords.helpDegree}" type="hidden">
						帮助： <span class="Select"> 
						<a onMouseOver="javascript:setProfix('helpfull_');showStars(1,'helpfull');"
						onMouseOut="javascript:setProfix('helpfull_');clearStars('helpfull');" 
						href="javascript:setProfix('helpfull_');setStars(1,'helpfull');">
						<img id="helpfull_1" title="小(1)" src="${ctxStatic}/star/img/icon_star_1.gif"></a>
						<a onMouseOver="javascript:setProfix('helpfull_');showStars(2,'helpfull');"
						onMouseOut="javascript:setProfix('helpfull_');clearStars('helpfull');"
						href="javascript:setProfix('helpfull_');setStars(2,'helpfull');">
						<img id="helpfull_2" title="一般(2)" src="${ctxStatic}/star/img/icon_star_1.gif"></a>
						<a onMouseOver="javascript:setProfix('helpfull_');showStars(3,'helpfull');" 
						onMouseOut="javascript:setProfix('helpfull_');clearStars('helpfull');"
						href="javascript:setProfix('helpfull_');setStars(3,'helpfull');">
						<img id="helpfull_3" title="大(3)" src="${ctxStatic}/star/img/icon_star_1.gif"></a>
						<a onMouseOver="javascript:setProfix('helpfull_');showStars(4,'helpfull');" 
						onMouseOut="javascript:setProfix('helpfull_');clearStars('helpfull');" 
						href="javascript:setProfix('helpfull_');setStars(4,'helpfull');">
						<img id="helpfull_4" title="很大(4)" src="${ctxStatic}/star/img/icon_star_1.gif"></a>
						<a onMouseOver="javascript:setProfix('helpfull_');showStars(5,'helpfull');"
						onMouseOut="javascript:setProfix('helpfull_');clearStars('helpfull');" 
						href="javascript:setProfix('helpfull_');setStars(5,'helpfull');">
						<img id="helpfull_5" title="非常大(5)" src="${ctxStatic}/star/img/icon_star_1.gif"></a></span>
						<br/>
						<input id="difficulty" name="difficulty" value="${learnRecords.difficultyDegree}"" type="hidden">
						难度： <span class="Select"> 
						<a onMouseOver="javascript:setProfix('difficulty_');showStars(1,'difficulty');"
						onMouseOut="javascript:setProfix('difficulty_');clearStars('difficulty');" 
						href="javascript:setProfix('difficulty_');setStars(1,'difficulty');">
						<img id="difficulty_1" title="很容易(1)" src="${ctxStatic}/star/img/icon_star_1.gif"></a>
						<a onMouseOver="javascript:setProfix('difficulty_');showStars(2,'difficulty');"
						onMouseOut="javascript:setProfix('difficulty_');clearStars('difficulty');"
						href="javascript:setProfix('difficulty_');setStars(2,'difficulty');">
						<img id="difficulty_2" title="一般(2)" src="${ctxStatic}/star/img/icon_star_1.gif"></a>
						<a onMouseOver="javascript:setProfix('difficulty_');showStars(3,'difficulty');" 
						onMouseOut="javascript:setProfix('difficulty_');clearStars('difficulty');"
						href="javascript:setProfix('difficulty_');setStars(3,'difficulty');">
						<img id="difficulty_3" title="难(3)" src="${ctxStatic}/star/img/icon_star_1.gif"></a>
						<a onMouseOver="javascript:setProfix('difficulty_');showStars(4,'difficulty');" 
						onMouseOut="javascript:setProfix('difficulty_');clearStars('difficulty');" 
						href="javascript:setProfix('difficulty_');setStars(4,'difficulty');">
						<img id="difficulty_4" title="很难(4)" src="${ctxStatic}/star/img/icon_star_1.gif"></a>
						<a onMouseOver="javascript:setProfix('difficulty_');showStars(5,'difficulty');"
						onMouseOut="javascript:setProfix('difficulty_');clearStars('difficulty');" 
						href="javascript:setProfix('difficulty_');setStars(5,'difficulty');">
						<img id="difficulty_5" title="非常难(5)" src="${ctxStatic}/star/img/icon_star_1.gif"></a></span>
						
		            </div>
		          <div class="pull-right"><input id="learnRecordBtn" class="btn btn-primary" type="button" value="提 交"/></div>
		          </div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctxStatic}/star/star.js"></script>
	<script type="text/javascript">
	setProfix('helpfull_');setStars(${learnRecords.helpDegree},'helpfull');
	setProfix('difficulty_');setStars(${learnRecords.helpDegree},'difficulty');
	</script>
	<input type="hidden" id="favoriteIdInput" value="${favorite.id}">
	
</body>
</html>