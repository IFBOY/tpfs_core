<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>学习统计管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/learn/learnStatistics/">学习统计列表</a></li>
		<shiro:hasPermission name="learn:learnStatistics:edit"><li><a href="${ctx}/learn/learnStatistics/form">学习统计添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="learnStatistics" action="${ctx}/learn/learnStatistics/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<sys:treeselect id="user" name="user.id" value="${learnStatistics.user.id}" labelName="user.name" labelValue="${learnStatistics.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>范畴名称：</label>
		    <form:input path="knocate.name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="beginUpdateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${learnStatistics.beginUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endUpdateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${learnStatistics.endUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>范畴名称</th>
				<th>学习文章数</th>
				<th>学书总时长</th>
				<th>最近学习文章</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注</th>
				<shiro:hasPermission name="learn:learnStatistics:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="learnStatistics">
			<tr>
				<td><a href="${ctx}/learn/learnStatistics/form?id=${learnStatistics.id}">
					${learnStatistics.user.name}
				</a></td>
				<td>
					${learnStatistics.knocate.name}
				</td>
				<td>
					${learnStatistics.leaningCount}
				</td>
				<td>
					${learnStatistics.learnTotalHours}
				</td>
				<td>
					${learnStatistics.article.title}
				</td>
				<td>
					${learnStatistics.createBy.name}
				</td>
				<td>
					<fmt:formatDate value="${learnStatistics.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${learnStatistics.updateBy.name}
				</td>
				<td>
					<fmt:formatDate value="${learnStatistics.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${learnStatistics.remarks}
				</td>
				<shiro:hasPermission name="learn:learnStatistics:edit"><td>
    				<a href="${ctx}/learn/learnStatistics/form?id=${learnStatistics.id}">修改</a>
					<a href="${ctx}/learn/learnStatistics/delete?id=${learnStatistics.id}" onclick="return confirmx('确认要删除该学习统计吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>