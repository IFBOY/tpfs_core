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
</style>
</head>
<body>

	<div class="row" id="content-container">
		<div class="span9">
			
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
										<a href="http://demo.edusoho.com/course/420" target="_blank">
											<img
											src="${ctxStatic}/front/1444077f35ca060283.jpg"
											alt="课程管理" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> 24/345 </span>
											 <span class="course-price-widget"> <span class="price">
													<span class="text-success">继续学习</span></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="http://demo.edusoho.com/course/283" target="_blank">
											<span class="tags"> <span class="tag-live"></span>
										</span> <img
											src="${ctxStatic}/front/16101134ee27345254.jpg"
											alt="EduSoho直播教室演示" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red">
													24/345
											</span>
											 <span class="course-price-widget"> <span class="price">
													<span class="text-success">继续学习</span></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="http://demo.edusoho.com/course/225" target="_blank">
											<img
											src="${ctxStatic}/front/0929040703b5013404.jpg"
											alt="考试系统（题库）体验" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red">
													24/345
											</span>
											 <span class="course-price-widget"> <span class="price">
													<span class="text-success">继续学习</span></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="http://demo.edusoho.com/course/225" target="_blank">
											<img src="${ctxStatic}/front/0929040703b5013404.jpg" alt="考试系统（题库）体验" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red">
													24/345
											</span>
											 <span class="course-price-widget"> <span class="price">
													<span class="text-success">继续学习</span></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="http://demo.edusoho.com/course/225" target="_blank">
											<img src="${ctxStatic}/front/0929040703b5013404.jpg" alt="考试系统（题库）体验" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red">
													24/345
											</span>
											 <span class="course-price-widget"> <span class="price">
													<span class="text-success">继续学习</span></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="http://demo.edusoho.com/course/420" target="_blank">
											<img
											src="${ctxStatic}/front/1444077f35ca060283.jpg"
											alt="课程管理" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> 24/345 </span>
											 <span class="course-price-widget"> <span class="price">
													<span class="text-success">继续学习</span></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="http://demo.edusoho.com/course/420" target="_blank">
											<img
											src="${ctxStatic}/front/1444077f35ca060283.jpg"
											alt="课程管理" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> 24/345 </span>
											 <span class="course-price-widget"> <span class="price">
													<span class="text-success">继续学习</span></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="span2">
								<div class="course-item">
									<div class="course-img">
										<a href="http://demo.edusoho.com/course/420" target="_blank">
											<img
											src="${ctxStatic}/front/1444077f35ca060283.jpg"
											alt="课程管理" class="img-responsive">
										</a>
									</div>
									<div class="course-info">
										<div class="metas clearfix">
											<span class="red"> 24/345 </span>
											 <span class="course-price-widget"> <span class="price">
													<span class="text-success">继续学习</span></span>
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
				<div class="panel-body article-list-mian" >
				
				
          <div class="article-item">
  <div class="article-metas clearfix">
    <div class="pull-left">
      <div class="date">
        <div class="day">03</div>
        <div class="month">06月</div>
      </div>
    </div>
    <div class="metas-body">
      <p><a href="${ctx}/list-2${urlSuffix}" >银行</a></p>
      <h2 class="title"><a class="link-dark" href="/article/150">翻转课堂：科学实验课也可以很酷</a></h2>
    </div>
  </div>
      <div class="content">
      有这样一个课堂，这里的初中生学习科学的方式不是习题考点教科书，而是动手编程实现飞行器的自平衡、用探空气球把三万米高空的景象记录下来。是的，即使是在中国，也可以这么酷。今天有幸来到了清华附中的创客课堂，参加科学实验课的是初二的中学生。课程的前十分钟，胡天硕老师拿出了一个炫酷的飞行器，学生们围过来，好奇...
    </div>
    
</div><div class="article-item">
  <div class="article-metas clearfix">
    <div class="pull-left">
      <div class="date">
        <div class="day">21</div>
        <div class="month">05月</div>
      </div>
    </div>
    <div class="metas-body">
      <p>信托 </p>
      <h2 class="title"><a class="link-dark" href="/article/56">想成为独立名师？先了解这几点</a></h2>
    </div>
  </div>
      <div class="content">
      摘要： 当线上直播模式培训出现之后，在教育培训行业逐渐分化出现了一个新的群体——独立教师，未来还会出现一个群体职业——名师经纪人。今天我们重点讨论的是独立教师的成长之路。当线上直播模式培训出现之后，在教育培训行业逐渐分化出现了一个新的群体——独立教师，未来还会出现一个群体职业——名师经纪人。今天我们...
    </div>
    
</div>          <div class="article-item">
  <div class="article-metas clearfix">
    <div class="pull-left">
      <div class="date">
        <div class="day">19</div>
        <div class="month">05月</div>
      </div>
    </div>
    <div class="metas-body">
      <p>更新 </p>
      <h2 class="title"><a class="link-dark" href="/article/17">一线教师：我们到底想要什么样的在线教育？</a></h2>
    </div>
  </div>
      <div class="media">
      <div class="media-body">
        笔者是北京市朝阳区某所重点小学从教多年的一线教师。近几年来，各方社会力量在互联网教育行业中投入越来越多，各类教育网站层出不穷。笔者作为教育行业的从业者，有些想法如鲠在喉，不吐不快。互联网教育，错位的盛宴判断一家教育类网站是否真的算是有用？是否真的对我们的教学有帮助，对孩子的成长有益处，笔者认为应该首...
      </div>
    </div>
    <c:forEach items="${fnc:getArticleList(site.id, 6, 8, '')}" var="article">
			<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
		</c:forEach>
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
					<h3 class="panel-title">学习进度</h3>
				</div>
				<div class="panel-body" >
					
				<div class="media media-number" >
		            <div class="media-body" >
		              623 / 累计学习知识点
		            </div>
		          </div>
		         <div class="media media-number">
		            <div class="media-body" >
		              45% / 学习完成比例
		            </div>
		          </div>
		          <div class="media media-number" style="padding-bottom: 0px;border-bottom: 1px solid #FFF;">
		            <div class="media-body" >
		              56分钟 / 学习总时长
		            </div>
		          </div>
				</div>
			</div>
			
			<div class="panel panel-default">
			<div class="panel-heading">
					<h3 class="panel-title">我的收藏</h3>
				</div>
				<div class="panel-body" >
				<div class="media media-number" >
					<div class="media-title" >
		               <a class="link-light" href="#" title="给提建议">给提建议</a> 
		            </div>
		            <div class="media-body" >
		               累计学习知识点累计知识点... 
		            </div>
		            
		            <span class="text-success pull-right">2015/12/17</span>
		          </div>
		         <div class="media media-number">
		         <div class="media-title" >
		               累计学习知识点 
		            </div>
		            <div class="media-body" >
		              学习完成比例
		            </div>
		            <span class="text-success pull-right">2015/12/17</span>
		          </div>
		          <div class="media media-number" style="padding-bottom: 0px;border-bottom: 1px solid #FFF;">
		          <div class="media-title" >
		               累计学习知识点 
		            </div>
		            <div class="media-body" >
		              56分钟 / 学习总时长
		            </div>
		            <span class="text-success pull-right">2015/12/17</span>
		          </div>
				</div>
			</div>
			
			
		</div>
	</div>
</body>
</html>