<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
<link href="${ctxStatic}/star/star.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctxStatic}/star/star.js"></script>
<style type="text/css">
body {
	background: #EEE none repeat scroll 0% 0%;
	word-wrap: break-word;
	text-rendering: optimizelegibility;
}

.panel-default {
	padding: 0px 15px;
	box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
}

.panel {
	border: medium none;
	margin-bottom: 20px;
	background-color: #FFF;
	border-radius: 2px;
}

.panel-default {
	padding: 0 15px;
	-webkit-box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
}

.panel-default>.panel-heading {
	position: relative;
	font-size: 16px;
	padding: 5px 0;
	background: #fff;
	border-bottom: 1px solid #f5f5f5;
}

.panel-default>.panel-heading .panel-title {
	color: #313131;
}

.panel-default>.panel-heading .panel-title>i {
	display: none;
}

.panel-default>.panel-heading .more {
	position: absolute;
	top: 13px;
	right: 0;
	display: block;
	color: #919191;
	-webkit-transition: all 0.3s ease;
	-moz-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
}

.panel-default>.panel-heading .more:hover {
	color: #616161;
	-webkit-transition: all 0.3s ease;
	-moz-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
}

.panel-default>.panel-heading .panel-bar {
	position: absolute;
	top: 7px;
	right: 0;
	display: block;
}

.panel-default>.panel-footer {
	padding: 15px 0;
	background: none;
}

.panel-default>.panel-body {
	position: relative;
	padding: 15px 0;
}

.panel-primary>.panel-heading {
	background-color: #46c37b;
	color: #fff;
}

.panel-primary>.panel-body {
	background: #fafafa;
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
}

.panel-default>.panel-heading .panel-title {
	color: #313131;
}

.panel-title {
	margin-top: 0px;
	margin-bottom: 0px;
	font-size: 16px;
	color: inherit;
}

.media-left,.media-right,.media-body {
	display: table-cell;
	vertical-align: top;
}

.media-left,.media>.pull-left {
	padding-right: 10px;
}

.media-default .media-body>.title {
	margin-bottom: 10px;
}
#content-container {
    margin-top: 10px;
}

.article-list-mian .article-item {
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #EFEFEF;
}
.article-metas {
    overflow: hidden;
}
.pull-left {
    float: left !important;
}
.article-metas .date .day {
    margin-top: 2px;
    font-size: 16px;
    line-height: 1.2;
}
.article-metas .date .month {
    font-size: 12px;
}
.article-metas .metas-body {
    padding-left: 60px;
}
.article-metas .metas-body .title {
    margin: 0px;
    line-height: 36px;
}
.article-metas .metas-body .title a {
    color: #616161;
    transition: all 0.3s ease 0s;
}
.link-dark {
    color: #313131 !important;
    transition: all 0.3s ease 0s;
}
.article-list-mian .article-item .content {
    margin-top: 15px;
    color: #919191;
}
.article-metas .date {
    height: 45px;
    width: 45px;
    margin-top: 10px;
    text-align: center;
    color: #E1E1E1;
    border: 1px solid #E1E1E1;
    border-radius: 50%;
}
h2, .h2 {
    font-size: 18px;
}
.media.media-number, .media.media-number-o {
    border-bottom: 1px solid #F5F5F5;
    padding-bottom: 15px;
}
.mbl {
    margin-bottom: 20px;
}
.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
}
.media.media-number .media-left .num, .media.media-number-o .media-left .num {
    display: block;
    width: 20px;
    height: 20px;
    line-height: 18px;
    text-align: center;
    border: 1px solid #919191;
    border-radius: 50%;
}
.avatar-square-sm, .group-avatar-sm {
    width: 50px;
    height: 50px;
    border-radius: 4px;
    border: 1px solid #FFF;
}
.fsn {
    font-size: 12px;
}
.text-success {
    color: #70D445 !important;
}
.course-list .course-item .metas {
    padding: 10px;
    color: #C1C1C1;
}
.course-list .course-item .metas .num {
    margin-right: 10px;
}
.course-list .course-item .metas .price {
    float: right;
    color: #E83D2C;
    font-size: 14px;
    margin-right: 0px;
}
.course-list .course-item .metas .red {
    color: #E83D2C;
    font-size: 14px;
    margin-right: 0px;
}
.course-list .course-item .title {

    margin-top: 10px;
    padding: 0px 10px;
    display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;

}
.course-list .course-item {
    transition: all 0.3s ease 0s;
}
.course-list .course-item {
    position: relative;
    z-index: 1;
    margin-bottom: 30px;
    border-radius: 2px;
    box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
    background-color: #FFF;
}
.breadcrumb {
    padding: 8px 15px;
    margin-bottom: 20px;
    list-style: outside none none;
    border-radius: 2px;
}
.breadcrumb a {
    color: #919191;
    transition: all 0.3s ease 0s;
}
.breadcrumb > li + li::before {
    content: "/ ";
    padding: 0px 5px;
    color: #CCC;
}
.es-section {
    background: #FFF none repeat scroll 0% 0%;
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 2px;
    box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
}
.article-metas .metas-body .sns {
    color: #919191;
    margin: 10px auto;
}
.article-metas .metas-body .sns span {
    margin-right: 10px;
}
.article-metas .metas-body .sns span i {
    margin-right: 5px;
}
.es-icon {
    line-height: 1;
}
.es-icon {
    font-family: "es-icon" !important;
    font-size: 16px;
    font-style: normal;
}
.x-top {
    border-top: 1px solid #D8E4E6;
    padding-top: 10px;
    margin-top: 30px;
}
.zhs {
    color: #CDCDCD;
    font-weight: bold;
    font-family: Arial,Helvetica,sans-serif;
}
.fy {
    width: 50%;
    overflow: hidden;
    height: 25px;
    font-size: 14px;
}
.f {
    float: left;
}
.jg35 {
    padding-left: 35px;
}

.txtRight {
    text-align: right;
}

.PREVIOUS {
    height: 25px;
    padding-left: 35px;
    background-image: url("${ctxStatic}/front/PREVIOUS.png");
    background-repeat: no-repeat;
    line-height: 25px;
    background-position: left center;
}
.NEXT {
    height: 25px;
    background-image: url("${ctxStatic}/front/NEXT.png");
    background-repeat: no-repeat;
    line-height: 25px;
    background-position: right center;
    padding-right: 35px;
}
.jg352 {
    padding-right: 35px;
}
.df {
    clear: left;
}
.dr {
    clear: right;
}
.fy a {
    color: #337AB7;
    text-decoration: none;
}
</style>
</head>
<body>

	<div class="row" id="content-container">
		<div class="span9">
			
			<div class="panel panel-default">
			<div class="panel-heading">
				<ol class="breadcrumb">
				  <li><a href="/article">首页</a></li>
				      <li><a href="/article/category/edusoho">银行</a></li>
				    <li class="active">正文</li>
				</ol>
			</div>
			
			<div class="panel-body article-detail-main" >
				<div>
        <div class="article-metas">
  <div class="pull-left">
    <div class="date">
      <div class="day">13</div>
      <div class="month">01月</div>
    </div>
  </div>
  <div class="metas-body">
    <h2 class="title">
      2014年教育信息化十大新闻评出
    </h2>
    <div class="sns">
      <span class="views-num">
        阅读次数：945
      </span>
     <span class="views-num">
        收藏次数：945
      </span>
      <span class="pull-right">
        收藏 分享
      </span>
    </div>
  </div>
</div>        
        <div class="article-text">
  <table style="color:#000000;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;">
	<tbody>
		<tr>
			<td>
				<div class="TRS_Editor" style="margin:0px;padding:0px;">
					<div class="Custom_UnionStyle" style="margin:0px;padding:0px;">
						<div style="margin:0px;padding:0px;">
							<div style="margin:0px;padding:0px;">
								<div style="margin:0px;padding:0px;">
									<p>
										在深化教育领域综合改革开局之年的2014年，着眼于2020年基本实现教育现代化、基本形成学习型社会，我国对教育信息化进行了全面部署，在技术变革教育教学、信息技术促进学习型社会建设等方面集中发力，使信息技术对教与学的双重影响更加凸显。在广泛征求业内专家意见和系统梳理教育信息化重大进展、典型经验的基础上，《中国教育报》信息化专刊、中国教育技术协会、《中国电化教育》杂志社、教育技术学科网、江苏省教育信息化工程技术研究中心联合评选推出2014年度“教育信息化十大新闻”：
									</p>
									<p>
										<strong>一、百项教育信息化成果获国家级教学成果奖</strong>
									</p>
									<p>
										2014年是教育信息化成果的展示之年，有百项教育信息化成果获评国家级教学成果奖。这充分体现了信息技术对我国教育教学改革的巨大推动作用。
									</p>
									<p>
										<strong>二、信息惠民工程推出优质教育信息惠民行动计划</strong>
									</p>
									<p>
										教育部等十二部门联合发出《关于加快实施信息惠民工程有关工作的通知》，启动信息惠民工程，以重点解决社保、医疗、教育、养老、就业、公共安全、食品药品安全、社区服务、家庭服务等九大领域的突出问题。
									</p>
									<p>
										<strong>三、构建利用信息化扩大优质资源覆盖面新机制</strong>
									</p>
									<p>
										教育部、财政部、国家发展改革委、工业和信息化部、中国人民银行五部门于2014年11月16日联合推出《构建利用信息化手段扩大优质教育资源覆盖面有效机制的实施方案》，未来6年我国教育信息化之路有了“施工路线图”和“时间表”。
									</p>
									<p>
										<strong>四、开展“一师一优课 一课一名师”活动</strong>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
				</div>
				
			<ul class="x-top" style="padding-left:0px">
                            <div class="fy f zhs"><span class="jg35">PREVIOUS</span></div>
                            <div class="fy f txtRight zhs"><span class="jg352">NEXT</span></div>
                            <div class="fy f"><a class="PREVIOUS" href="http://www.jq22.com/jquery-info461"> jQuery布局插件GridManager </a> </div>
                            <div class="fy f txtRight"><a class="NEXT" href="http://www.jq22.com/jquery-info459"> jQuery滚动鼠标图像淡入淡出插件crossfade.js </a> </div>
                            <div class="dr"></div>
                            <div class="df"></div>
                        </ul>				
			</div>
			
			</div>
			<div class="panel panel-default">
				<div class="panel-body" >
				<div class="media media-number" >
		            <div class="media-body" >
		              <input id="helpfull" name="helpfull" value="3" type="hidden">
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
						<input id="difficulty" name="difficulty" value="3" type="hidden">
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
		          </div>
				</div>
			</div>
		</div>

		<div class="span3">
		   <form class="form-search">
		        <div class="input-append">
		      <input class="span2" style="width: 160px;" placeholder="全站搜索"  id="appendedInputButton" type="text">
		      <button class="btn" type="button">Go</button>
		    </div>
		    </form>
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="media media-default">
						<div class="media-left">
							<img class="avatar-md"
								src=" ${ctxStatic}/front/091008008a96767512.jpg">
						</div>
						<div class="media-body">
							<div class="title">张三 20071302938</div>
							<div class="content">西南财经大学</div>
							<div class="content" style="padding-top:10px;"><button class="btn btn-success pull-right">注销</button></div>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="panel panel-default">
			<div class="panel-heading">
					<h3 class="panel-title">银行</h3>
				</div>
				<div class="panel-body" >
				<div class="media media-number" >
					<div class="media-title" >
		               <a class="link-light" href="#" title="给提建议">给提建议</a> 
		            </div>
		            <div class="media-body" >
		               累计学习知识点累计知识点... 
		            </div>
		            
		          </div>
		         <div class="media media-number">
		         <div class="media-title" >
		               累计学习知识点 
		            </div>
		            <div class="media-body" >
		              学习完成比例
		            </div>
		          </div>
		          <div class="media media-number" style="padding-bottom: 0px;border-bottom: 1px solid #FFF;">
		          <div class="media-title" >
		               累计学习知识点 
		            </div>
		            <div class="media-body" >
		              56分钟 / 学习总时长
		            </div>
		          </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>