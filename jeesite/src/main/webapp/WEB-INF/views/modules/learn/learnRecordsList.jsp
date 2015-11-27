<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>学习记录管理</title>
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
		<li class="active"><a href="${ctx}/learn/learnRecords/">学习记录列表</a></li>
		<shiro:hasPermission name="learn:learnRecords:edit"><li><a href="${ctx}/learn/learnRecords/form">学习记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="learnRecords" action="${ctx}/learn/learnRecords/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<sys:treeselect id="user" name="user.id" value="${learnRecords.user.id}" labelName="user.name" labelValue="${learnRecords.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>文章标题：</label>
				<form:input path="article.title" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="beginUpdateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${learnRecords.beginUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endUpdateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${learnRecords.endUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>困难度</th>
				<th>帮助度</th>
				<th>学习时长</th>
				<th>备注</th>
				<shiro:hasPermission name="learn:learnRecords:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="learnRecords">
			<tr>
				<td><a href="${ctx}/learn/learnRecords/form?id=${learnRecords.id}">
					${learnRecords.user.name}
				</a></td>
				<td>
					${learnRecords.article.title}
				</td>
				<td>
					${learnRecords.difficultyDegree}
				</td>
				<td>
					${learnRecords.helpDegree}
				</td>
				<td>
					${learnRecords.learnMinutes}
				</td>
				<td>
					${learnRecords.remarks}
				</td>
				<shiro:hasPermission name="learn:learnRecords:edit"><td>
    				<a href="${ctx}/learn/learnRecords/form?id=${learnRecords.id}">修改</a>
					<a href="${ctx}/learn/learnRecords/delete?id=${learnRecords.id}" onclick="return confirmx('确认要删除该学习记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>