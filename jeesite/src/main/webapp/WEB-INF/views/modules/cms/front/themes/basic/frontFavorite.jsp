<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>我的收藏</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
<script type="text/javascript">
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		$(document).ready(function() {
			var queryInput = $('#appendedInputButton');
			queryInput.change(function(v){
				if(queryInput.val()=='${condition}'){
					$('#pageNo').val(${page.pageNo});
				}else{
					$('#pageNo').val(1);
				}
			});
		});
	</script>
</head>
<body>

	<div class="row" id="content-container">
		<div class="span12">

			<div class="panel panel-default">
				<div class="panel-heading">
					<ol class="breadcrumb">
						<li><span>当前位置：</span><a href="${ctx} ">首页</a><span
							class="divider">/</span></li>
						<li>我的收藏</li>
					</ol>
					<form class="form-search" action="${ctxAdmin}/learn/favorite/listByUser" id="searchForm">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="userId" name="user.id" type="hidden" value="${fns:getUser().id}">
					</form>
				</div>
				<div class="panel-body article-list-mian">
					<c:forEach items="${page.list }" var="favorite">
						<div class="article-item">
							<div class="article-metas clearfix">

								<div class="content">
									<h2 class="title">
										<a class="link-dark" href="${favorite.article.url }">${favorite.article.title }</a><span
											class="pull-right">${favorite.article.category.name}</span>
									</h2>
									<div class="link-dark">标签：${favorite.article.keywords }</div>
								</div>
							</div>
							<div class="content">
								<span class="link-dark">摘要：</span>${favorite.article.description}
							</div>
							<div class="content">
								<div class="link-dark">
									浏览 ${favorite.article.hits}次 <span class="pull-right">收藏时间 <fmt:formatDate
											value="${ favorite.updateDate}" type="both" /></span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="pagination" style="padding-bottom: 20px;">${page}</div>
			</div>
		</div>
	</div>
</body>
</html>