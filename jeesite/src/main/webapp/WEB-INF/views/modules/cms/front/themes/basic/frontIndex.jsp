<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
<style type="text/css">
.btn-success a {
	color: #FFF;
}
.progess{
	font-size: 18px;
	font-weight: bold;
}
.hotSearch{
	font-size: 13px;
	color: #555;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var hotSearchA = $('.hotSearchA');
	hotSearchA.click(function(){
		$('#appendedInputButton').val($(this).text());
		$("#searchForm").submit();
	});
});
</script>
</head>
<body>

	<div class="row" id="content-container">
		<div class="span9">
			<form class="form-search" action="${ctx}/search" id="searchForm">
				<div class="input-append">
					<input class="span8" style="width:644px;"  placeholder="全站搜索" id="appendedInputButton" type="text" name="q">
					 <input name="t" value="article" type="hidden" />
					<button class="btn" type="submit">Go</button>
				</div>
			<div class="hotSearch">热门搜索：<c:forEach items="${searchHisPage.list}" var="searchHistory">
				<a href="javascript:void(0);"  class="hotSearchA">${searchHistory.name}</a> 
			</c:forEach></div>
			</form>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">金融栏目</h3>
				</div>
				<div class="panel-body">
					<div class="course-list no-shadow no-margin">
						<div class="row">
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="${staticDataList[6].article.url}"> <img
											src="${ctxStaticTheme}/img/bank.png" title="银行"
											class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> ${staticDataList[6].learnCount }/${staticDataList[6].articleCount }
											</span> <span class="course-price-widget"> <span
												class="price"> <span class="text-success">继续学习</span>
											</span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="${staticDataList[2].article.url}"> <span
											class="tags"> <span class="tag-live"></span>
										</span> <img src="${ctxStaticTheme}/img/xintuo.png" title="信托" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> ${staticDataList[2].learnCount }/${staticDataList[2].articleCount }</span>
											<span class="course-price-widget"> <span class="price">
													<span class="text-success">继续学习</span>
											</span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="${staticDataList[5].article.url}"> <img
											src="${ctxStaticTheme}/img/zhenquan.png" title="证券"
											class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> ${staticDataList[5].learnCount }/${staticDataList[5].articleCount }
											</span> <span class="course-price-widget"> <span
												class="price"> <span class="text-success">继续学习</span>
											</span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="${staticDataList[1].article.url}"> <img
											src="${ctxStaticTheme}/img/baoxian.png" title="保险"
											class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> ${staticDataList[1].learnCount }/${staticDataList[1].articleCount }
											</span> <span class="course-price-widget"> <span
												class="price"> <span class="text-success">继续学习</span>
											</span>
											</span>
										</div>
									</div>
								</div>
							</div>

							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="${staticDataList[4].article.url}"> <img
											src="${ctxStaticTheme}/img/guquantouzhijigou.png"
											title="股权投资机构" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> ${staticDataList[4].learnCount }/${staticDataList[4].articleCount }
											</span> <span class="course-price-widget"> <span
												class="price"> <span class="text-success">继续学习</span>
											</span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="${staticDataList[3].article.url}"> <img
											src="${ctxStaticTheme}/img/jianguan.png" title="监管机构"
											class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> ${staticDataList[3].learnCount }/${staticDataList[3].articleCount }
											</span> <span class="course-price-widget"> <span
												class="price"> <span class="text-success">继续学习</span>
											</span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="${staticDataList[0].article.url}"> <img
											src="${ctxStaticTheme}/img/jiaoyisuo.png" title="交易所"
											class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> ${staticDataList[0].learnCount }/${staticDataList[0].articleCount }
											</span> <span class="course-price-widget"> <span
												class="price"> <span class="text-success">继续学习</span>
											</span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="${staticDataList[7].article.url}"> <img
											src="${ctxStaticTheme}/img/feiyhjr.png" title="非银行金融"
											class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> ${staticDataList[7].learnCount }/${staticDataList[7].articleCount }
											</span> <span class="course-price-widget"> <span
												class="price"> <span class="text-success">继续学习</span>
											</span>
											</span>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">最近学习</h3>
				</div>
				<div class="panel-body article-list-mian">
					<c:forEach items="${learnList}" var="learnRecords">
						<div class="article-item">
							<div class="article-metas clearfix">
								<div class="pull-left">
									<div class="date" title="<fmt:formatDate value="${learnRecords.updateDate}" pattern="yyyy-MM-dd"/>">
										<div class="day">
											<fmt:formatDate value="${learnRecords.updateDate}"
												pattern="dd" />
										</div>
										<div class="month">
											<fmt:formatDate value="${learnRecords.updateDate}"
												pattern="MMMM" />
										</div>
									</div>
								</div>
								<div class="metas-body">
									<p>${learnRecords.article.category.name}</p>
									<h2 class="title">
										<a class="link-dark" href="${learnRecords.article.url }">${learnRecords.article.title }</a>
									</h2>
								</div>
							</div>
							<div class="media">
								<div class="media-body">
									${learnRecords.article.description }</div>

							</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>

		<div class="span3">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="media media-default">
						<div class="media-left">
							<img class="avatar-md"
								src=" ${ctxStatic}/front/091008008a96767512.jpg">
						</div>
						<div class="media-body">
							<div class="title">${user.name} ${user.loginName}</div>
							<div class="content">${user.company.name }</div>
							<div class="content" style="padding-top: 10px;">
								<button class="btn btn-success pull-right">
									<a href="${ctxAdmin}/logout">注销</a>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">学习进度</h3>
				</div>
				<div class="panel-body">

					<div class="media media-number">
						<div class="media-body"><span class="progess">${userLearnArticls}</span> / 累计学习知识点</div>
					</div>
					<div class="media media-number">
						<div class="media-body"><span class="progess">${learnedPercent}</span> / 学习完成比例</div>
					</div>
					<div class="media media-number"
						style="padding-bottom: 0px; border-bottom: 1px solid #FFF;">
						<div class="media-body"><span class="progess">${userLearnTotalTime}</span> 分钟 / 学习总时长</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">我的收藏</h3>
				</div>
				<div class="panel-body">
					<c:forEach items="${favoriteList}" var="favorite">
						<div class="media media-number">
							<div class="media-title">
								<a class="link-light" href="${favorite.article.url}"
									title=${favorite.article.title }>${favorite.article.title }</a>
							</div>
							<div class="media-body">${favorite.article.description }</div>

							<span class="text-success pull-right"><fmt:formatDate
									value="${favorite.updateDate }" type="both" /></span>
						</div>
					</c:forEach>
					<div style="float: right">
						<a class="link-light"
							href="${ctxAdmin}/learn/favorite/listByUser?user.id=${user.id}">更多</a>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>
</html>