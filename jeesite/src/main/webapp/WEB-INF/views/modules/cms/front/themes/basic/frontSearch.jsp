<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>搜索</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
</head>
<body>

	<div class="row" id="content-container">
		<div class="span12">

			<div class="panel panel-default">
				<div class="panel-heading">
					<ol class="breadcrumb">
						<li><strong>当前位置：</strong><a href="${ctx} ">首页</a><span
							class="divider">/</span></li>
						<li>搜索</li>
					</ol>
					<form class="form-search" action="${fns:getFrontPath()}/search">
						<div class="input-append">
							<input class="span8" placeholder="全站搜索" id="appendedInputButton"
								type="text" name="q"> <input type="hidden" name="t"
								value="article" />
							<button class="btn" type="submit">Go</button>
						</div>
					</form>
					<div class="link-dark">搜索"${condition}"，找到相关内容${page.count}篇</div>
				</div>
				<div class="panel-body article-list-mian">
					<c:forEach items="${page.list }" var="contentBean">
						<div class="article-item">
							<div class="article-metas clearfix">

								<div class="content">
									<h2 class="title">
										<a class="link-dark" href="${contentBean.url }">${contentBean.title }</a><span
											class="pull-right">${contentBean.category.name}</span>
									</h2>
									<div class="link-dark">标签：${contentBean.keywords }</div>
								</div>
							</div>
							<div class="content">
								<span class="link-dark">摘要：</span>${contentBean.description}
							</div>
							<div class="content">
								<div class="link-dark">
									浏览 ${contentBean.hits}次 <span class="pull-right">创建时间 <fmt:formatDate
											value="${ contentBean.create_date}" type="both" /></span>
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