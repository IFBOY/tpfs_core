<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收藏夹管理</title>
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
		<li class="active"><a href="${ctx}/learn/favorite/">收藏夹列表</a></li>
		<shiro:hasPermission name="learn:favorite:edit"><li><a href="${ctx}/learn/favorite/form">收藏夹添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="favorite" action="${ctx}/learn/favorite/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="user.name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>文章标题：</label>
				<form:input path="article.title" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="beginUpdateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${favorite.beginUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endUpdateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${favorite.endUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>文章标题</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注</th>
				<shiro:hasPermission name="learn:favorite:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="favorite">
			<tr>
				<td><a href="${ctx}/learn/favorite/form?id=${favorite.id}">
					${favorite.user.name}
				</a></td>
				<td>
					${favorite.article.title}
				</td>
				<td>
					${favorite.createBy.name}
				</td>
				<td>
					<fmt:formatDate value="${favorite.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${favorite.updateBy.name}
				</td>
				<td>
					<fmt:formatDate value="${favorite.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${favorite.remarks}
				</td>
				<shiro:hasPermission name="learn:favorite:edit"><td>
    				<a href="${ctx}/learn/favorite/form?id=${favorite.id}">修改</a>
					<a href="${ctx}/learn/favorite/delete?id=${favorite.id}" onclick="return confirmx('确认要删除该收藏夹吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>