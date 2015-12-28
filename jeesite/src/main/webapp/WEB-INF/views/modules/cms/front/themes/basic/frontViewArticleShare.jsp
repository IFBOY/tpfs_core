<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="default" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
<link href="${ctxStatic}/star/star.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container" style="position:static;margin-bottom:10px;margin-top:10px;">
		<div class="content">
	<div class="row" id="content-container">

		<div class="span12">

			<div class="panel panel-default">

				<div class="panel-body article-detail-main">
					<div>
						<div class="article-metas">
							<div class="metas-body">
								<h2 class="title" style="text-align: center;">${article.title}</h2>
								<div class="sns">
									<span class="views-num"> 阅读次数： ${article.hits} </span>
									<span style="float:right;"> 发布时间：<fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd" /></span>
								</div>
								
							</div>
						</div>
						<div class="article-text">${article.articleData.content}</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>