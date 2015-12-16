<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
  <meta name="renderer" content="webkit">
  <title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="JeeSite ${site.description}" />
	<meta name="keywords" content="JeeSite ${site.keywords}" />
  <meta content="5300d534b1ccb009dba3cd06b99dfdad41dc8597" name="csrf-token">
  <meta content="1" name="is-login">
  <meta content="0" name="is-open">
  <meta property="qc:admins" content="242073150776545370763757">
  <link href="${ctxStatic}/favicon_1427251704.ico?6.11.1" rel="shortcut icon" type="image/x-icon" media="screen">
  <link href="${ctxStatic}/front/bootstrap.css" rel="stylesheet">

<link rel="stylesheet" media="screen" href="${ctxStatic}/front/common.css">
<link rel="stylesheet" media="screen" href="${ctxStatic}/front/font-awesome.css">
<link rel="stylesheet" media="screen" href="${ctxStatic}/front/es-icon.css">
  <link href="${ctxStatic}/front/main.css" rel="stylesheet">
  <!--[if lt IE 9]>
    <script src="/assets/libs/html5shiv.js?6.11.1"></script>
    <script src="/assets/libs/respond.min.js?6.11.1"></script>
  <![endif]-->
</head>
<body class="course-dashboard-page">

  <div class="es-wrap">

  <section class="course-detail-header after">
  <div class="container">
    
      <ol class="breadcrumb">
    <li><a href="http://demo.edusoho.com/">首页</a></li>
          <li><a href="http://demo.edusoho.com/course/explore/app">官方应用</a></li>
          <li><a href="http://demo.edusoho.com/course/explore/jx">教学增强</a></li>
        <li class="active">作业练习</li>
  </ol>

    <div class="es-section clearfix">
        

  <div class="course-header-top clearfix">

      <div class="course-img">
    
    <img class="img-responsive" src="${ctxStatic}/front/1658582a8913169845.jpg" alt="作业练习">
    <div class="tags">
                </div>
  </div>


        <div class="course-info">
    <h2 class="title">
      作业练习
    </h2>
    <div class="subtitle"></div>
    <div class="metas">
      <div class="score">
            
            <i class="es-icon es-icon-star"></i>
          <i class="es-icon es-icon-star"></i>
          <i class="es-icon es-icon-star"></i>
          <i class="es-icon es-icon-star"></i>
      
          <i class="es-icon es-icon-starhalf"></i>
  
  

        <span>(4人)</span>
      </div>

                        <p class="expiry-date hidden-sm">
            <label for="">有效期</label><span>还有10天</span>
          </p>
              

          </div>

    
  </div>


    <div class="course-operation">
        <div class="student-num hidden-xs">
          <i class="es-icon es-icon-people"></i>540人
            </div>

      <ul class="course-data clearfix ">
          <li id="unfavorite-btn" data-url="/course/299/unfavorite">
    <a href="javascript:;" class="color-primary">
      <p><i class="es-icon es-icon-bookmark"></i></p>
      <p>已收藏</p>
    </a>
  </li>

  <li id="favorite-btn" data-url="/course/299/favorite" style="display:none;">
    <a href="javascript:;">
      <p><i class="es-icon es-icon-bookmarkoutline"></i></p>
      <p>收藏</p>
    </a>
  </li>

          <li>
    <span class="es-share top">
      <a class="dropdown-toggle" href="" data-toggle="dropdown">
        <p><i class="es-icon es-icon-share"></i></p>
        <p>分享</p>
      </a>
                
<div class="dropdown-menu  js-social-share-params" data-title="作业练习" data-summary="&nbsp; &nbsp; 优惠码是EduSoho官方推出的第二个应用，秉承着EduSoho一贯的简单实用。在优惠码管理..." data-message="我正在学习《作业练习》，收获巨大哦，一起来学习吧！" data-url="http://demo.edusoho.com/course/299" data-picture="/files/default/2015/07-17/1658582a8913169845.jpg?6.11.1">

  <a href="javascript:;" class="js-social-share" data-cmd="weixin" title="分享到微信" data-share="weixin" data-qrcode-url="/common/qrcode?text=http%3A%2F%2Fdemo.edusoho.com%2Fcourse%2F299"><i class="es-icon es-icon-weixin"></i></a>
  <a href="javascript:;" class="js-social-share" data-cmd="tsina" title="分享到新浪微博" data-share="weibo"><i class="es-icon es-icon-weibo"></i></a>
  <a href="javascript:;" class="js-social-share" data-cmd="qq" title="分享到QQ好友" data-share="qq"><i class="es-icon es-icon-qq"></i></a>
  <a href="javascript:;" class="js-social-share" data-cmd="qzone" title="分享到QQ空间" data-share="qzone"><i class="es-icon es-icon-qzone"></i></a>

</div>


    </span>
  </li>

                  <li>
                          <a href="#modal" data-toggle="modal" data-url="/target/299/order/refund?targetType=course">
                <p><i class="es-icon es-icon-exit"></i></p><p>
                </p><p>退出</p>
              </a>
                      </li>
              </ul>
    </div>
  </div>

  <div class="progress progress-sm">
    <div data-original-title="0%" class="progress-bar" role="progressbar" style="width: 0%" data-toggle="tooltip" data-placement="right" title="">
    </div>
  </div>

  <div class="course-header-bottom clearfix">
    <span class="pull-left">完成课时： 0/2</span>
          <a class="btn btn-lg btn-primary" href="http://demo.edusoho.com/course/299/learn#lesson/1963">继续学习</a>
      <span class="next-class hidden-xs">下一课时：<a href="http://demo.edusoho.com/course/299/learn#lesson/1963">作业练习体验</a></span>
      </div>


          </div>
  </div>
</section>









      
      <div id="content-container" class="container">
          <div class="course-detail row">
    <div class="col-lg-9 col-md-8  course-detail-main">

      



  




      <section class="es-section">
        <div class="nav-btn-tab">
  <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="http://demo.edusoho.com/course/299">课时</a></li>
      <li role="presentation"><a href="http://demo.edusoho.com/course/299/thread">讨论区</a></li>
      <li role="presentation"><a href="http://demo.edusoho.com/course/299/material/">资料区</a></li>
      <li role="presentation"><a href="http://demo.edusoho.com/course/299/reviews/">评价 <small class="text-muted">( 4 )</small></a> 
      </li>
      <li role="presentation"><a href="http://demo.edusoho.com/course/299/notes">笔记 <small class="text-muted">( 4 )</small></a>
      </li>
      <li role="presentation"><a href="http://demo.edusoho.com/course/299/info">概览</a></li>
    
  </ul>

  </div>        
  <div data-widget-cid="widget-1" class="course-detail-content">

    
    <div class="es-piece">
      <div class="piece-header">课时列表</div>
      <div class="piece-body">
          <ul class="period-list" id="course-item-list">
              <li class="period lesson-item lesson-item-1963" data-id="1963" data-num="1">
            <a href="http://demo.edusoho.com/course/299/learn#lesson/1963" title="作业练习体验">
            <i class="es-icon es-icon-doing color-primary status-icon"></i>
  
      <span class="title">   课时1：作业练习体验</span>
      <!-- 紧跟标题 -->

  <i class="es-icon es-icon-mylibrarybooks mls" title="作业、练习"></i>



<!-- 右边图标 -->
  
  
      <span class="course-type">
      <i class="es-icon es-icon-graphicclass" data-toggle="tooltip" data-placement="top" title="" data-original-title="图文课程"></i>
    </span>
      
  
  
  
  
  
      </a>
    
  </li>                      <li class="period lesson-item lesson-item-2234" data-id="2234" data-num="2">
            <a href="http://demo.edusoho.com/course/299/learn#lesson/2234" title="考试体验">
            <i class="es-icon es-icon-doing color-primary status-icon"></i>
  
      <span class="title">   课时2：考试体验</span>
      <!-- 紧跟标题 -->




<!-- 右边图标 -->
  
  
      
                <span class="course-type">
        <i class="es-icon es-icon-check" data-toggle="tooltip" data-placement="top" title="" data-original-title="试卷"></i>
      </span>
      
  
  
  
  
      </a>
    
  </li>          
        
      </ul></div>
    </div>
    
  </div>

      </section>
                        <div class="panel panel-default hidden-xs">
  <div class="panel-heading">
    <h3 class="panel-title"><i class="es-icon es-icon-explore"></i>相关课程</h3>
  </div>
  <div class="panel-body">
    <div class="course-list no-shadow no-margin">
      <div class="row">
                                              <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="course-item">
  <div class="course-img">
    <a href="http://demo.edusoho.com/course/420" target="_blank">
                        <img src="${ctxStatic}/front/1444077f35ca060283.jpg" alt="课程管理" class="img-responsive">
    </a>
  </div>
  <div class="course-info">
    <div class="title">
      <a class="link-dark" href="http://demo.edusoho.com/course/420" target="_blank">
        课程管理
      </a>
    </div>
    <div class="metas clearfix">
            <span class="num"><i class="es-icon es-icon-people"></i>644</span>
            <span class="comment"><i class="es-icon es-icon-textsms"></i>9</span>
      

<span class="course-price-widget">
  
          <span class="price">
                   <span class="text-success">免费</span>               </span>
    
    
  </span>    </div>
  </div>
</div>          </div>
                                                                  <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="course-item">
  <div class="course-img">
    <a href="http://demo.edusoho.com/course/283" target="_blank">
                          <span class="tags">
          <span class="tag-live"></span>
        </span>
            <img src="${ctxStatic}/front/16101134ee27345254.jpg" alt="EduSoho直播教室演示" class="img-responsive">
    </a>
  </div>
  <div class="course-info">
    <div class="title">
      <a class="link-dark" href="http://demo.edusoho.com/course/283" target="_blank">
        EduSoho直播教室演示
      </a>
    </div>
    <div class="metas clearfix">
            <span class="num"><i class="es-icon es-icon-people"></i>2947</span>
            <span class="comment"><i class="es-icon es-icon-textsms"></i>11</span>
      

<span class="course-price-widget">
  
          <span class="price">
                   <span class="text-success">免费</span>               </span>
    
    
  </span>    </div>
  </div>
</div>          </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="course-item">
  <div class="course-img">
    <a href="http://demo.edusoho.com/course/225" target="_blank">
                        <img src="${ctxStatic}/front/0929040703b5013404.jpg" alt="考试系统（题库）体验" class="img-responsive">
    </a>
  </div>
  <div class="course-info">
    <div class="title">
      <a class="link-dark" href="http://demo.edusoho.com/course/225" target="_blank">
        考试系统（题库）体验
      </a>
    </div>
    <div class="metas clearfix">
            <span class="num"><i class="es-icon es-icon-people"></i>2505</span>
            <span class="comment"><i class="es-icon es-icon-textsms"></i>13</span>
      

<span class="course-price-widget">
  
          <span class="price">
                   <span class="text-success">免费</span>               </span>
    
    
  </span>    </div>
  </div>
</div>          </div>
                        </div>
    </div>
  </div>
</div>

                  </div>

    <div class="col-lg-3 col-md-4  course-sidebar">
                        
                            <div class="panel panel-default panel-class hidden-sm" id="panel-class">
    <div class="panel-heading">
      <a href="http://demo.edusoho.com/classroom/explore" class="more"><i class="es-icon es-icon-morehoriz"></i></a>
      <h3 class="panel-title">
        <i class="es-icon es-icon-locallibrary"></i>
        推荐班级
      </h3>
    </div>
    <div class="panel-body">
      <div class="swiper-container">
        <div style="width: 1440px; height: 185px; transform: translate3d(-240px, 0px, 0px); transition-duration: 0s;" class="swiper-wrapper"><div style="width: 240px; height: 185px;" class="swiper-slide swiper-slide-duplicate">
              <a class="class-img" href="http://demo.edusoho.com/classroom/4">
                <img class="img-responsive" src="${ctxStatic}/front/17101027ba11191624.jpg" alt="网校高级班">
              </a>
              <h5 style="margin-bottom:0"><a class="link-dark text-overflow" href="http://demo.edusoho.com/classroom/4">网校高级班</a></h5>
            </div>
                      <div style="width: 240px; height: 185px;" class="swiper-slide swiper-slide-visible swiper-slide-active">
              <a class="class-img" href="http://demo.edusoho.com/classroom/1">
                <img class="img-responsive" src="${ctxStatic}/front/170828cbb8d5165449.jpg" alt="ES学习圈">
              </a>
              <h5 style="margin-bottom:0"><a class="link-dark text-overflow" href="http://demo.edusoho.com/classroom/1">ES学习圈</a></h5>
            </div>
                      <div style="width: 240px; height: 185px;" class="swiper-slide">
              <a class="class-img" href="http://demo.edusoho.com/classroom/2">
                <img class="img-responsive" src="${ctxStatic}/front/1709051eaa15525927.jpg" alt="课程套餐">
              </a>
              <h5 style="margin-bottom:0"><a class="link-dark text-overflow" href="http://demo.edusoho.com/classroom/2">课程套餐</a></h5>
            </div>
                      <div style="width: 240px; height: 185px;" class="swiper-slide">
              <a class="class-img" href="http://demo.edusoho.com/classroom/3">
                <img class="img-responsive" src="${ctxStatic}/front/170948cc33f0923601.jpg" alt="网校基础班">
              </a>
              <h5 style="margin-bottom:0"><a class="link-dark text-overflow" href="http://demo.edusoho.com/classroom/3">网校基础班</a></h5>
            </div>
                      <div style="width: 240px; height: 185px;" class="swiper-slide">
              <a class="class-img" href="http://demo.edusoho.com/classroom/4">
                <img class="img-responsive" src="${ctxStatic}/front/17101027ba11191624.jpg" alt="网校高级班">
              </a>
              <h5 style="margin-bottom:0"><a class="link-dark text-overflow" href="http://demo.edusoho.com/classroom/4">网校高级班</a></h5>
            </div>
                  <div style="width: 240px; height: 185px;" class="swiper-slide swiper-slide-duplicate">
              <a class="class-img" href="http://demo.edusoho.com/classroom/1">
                <img class="img-responsive" src="${ctxStatic}/front/170828cbb8d5165449.jpg" alt="ES学习圈">
              </a>
              <h5 style="margin-bottom:0"><a class="link-dark text-overflow" href="http://demo.edusoho.com/classroom/1">ES学习圈</a></h5>
            </div></div>
                  <a href="javascipt:;" class="arrow-prev">
            <i class="es-icon es-icon-chevronleft"></i>
          </a>
          <a href="javascipt:;" class="arrow-next">
            <i class="es-icon es-icon-chevronright"></i>
          </a>
              </div>
    </div>
  </div>
  
                <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"> <i class="es-icon es-icon-assignmentind"></i>
      授课教师
    </h3>
  </div>
  <div class="panel-body">
                  <div class="media media-default">
          <div class="media-left">
              <a class=" js-user-card" href="http://demo.edusoho.com/user/2487" data-card-url="/user/2487/card/show" data-user-id="2487">
    <img class="avatar-md" src="${ctxStatic}/front/091008008a96767512.jpg">
  </a>
  
          </div>
          <div class="media-body">
            <div class="title">
                  <a class="link-light link-light" href="http://demo.edusoho.com/user/2487">格洛咪</a>
  
            </div>
            <div class="content">EduSoho官方运营</div>
          </div>
        </div>
            </div>
</div>

        
<div class="panel panel-default">
  <div class="panel-heading">
          <a href="javascript:;" class="more"><i class="es-icon es-icon-morehoriz"></i></a>
        <h3 class="panel-title">
      <i class="es-icon es-icon-personadd"></i>
      最新学员
    </h3>
  </div>
  <div class="panel-body">
          <ul class="user-avatar-list clearfix">
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/15593" data-card-url="/user/15593/card/show" data-user-id="15593">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/15578" data-card-url="/user/15578/card/show" data-user-id="15578">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/13008" data-card-url="/user/13008/card/show" data-user-id="13008">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/14101" data-card-url="/user/14101/card/show" data-user-id="14101">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/12396" data-card-url="/user/12396/card/show" data-user-id="12396">
    <img class="avatar-sm" src="${ctxStatic}/front/2200248c5cd0783401.jpg">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/14903" data-card-url="/user/14903/card/show" data-user-id="14903">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/15533" data-card-url="/user/15533/card/show" data-user-id="15533">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/15510" data-card-url="/user/15510/card/show" data-user-id="15510">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/6164" data-card-url="/user/6164/card/show" data-user-id="6164">
    <img class="avatar-sm" src="${ctxStatic}/front/1023451012f6184155.jpg">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/15501" data-card-url="/user/15501/card/show" data-user-id="15501">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/1384" data-card-url="/user/1384/card/show" data-user-id="1384">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/15478" data-card-url="/user/15478/card/show" data-user-id="15478">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/15475" data-card-url="/user/15475/card/show" data-user-id="15475">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/15468" data-card-url="/user/15468/card/show" data-user-id="15468">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
                          <li>
              <a class=" js-user-card" href="http://demo.edusoho.com/user/15467" data-card-url="/user/15467/card/show" data-user-id="15467">
    <img class="avatar-sm" src="${ctxStatic}/front/avatar.png">
  </a>
  
          </li>
              </ul>
      </div>
</div>

        
<div class="panel panel-default student-dynamic">

  <div class="panel-heading">
    <h3 class="panel-title"><i class="es-icon es-icon-recentactors"></i>学员动态</h3>
  </div>

  <div class="panel-body">
      
                        <div class="media media-number-o">
            <div class="media-body">
                  <a class="link-light " href="http://demo.edusoho.com/user/15593">deej</a>
  
              
  开始学习课时 <a class="link-dark" href="http://demo.edusoho.com/course/299" title="来自《作业练习》">作业练习体验</a>

            </div>
          </div> 
                                 <div class="media media-number-o">
            <div class="media-body">
                  <a class="link-light " href="http://demo.edusoho.com/user/15593">deej</a>
  
              
  开始学习课时 <a class="link-dark" href="http://demo.edusoho.com/course/299" title="来自《作业练习》">考试体验</a>

            </div>
          </div> 
                                 <div class="media media-number-o">
            <div class="media-body">
                  <a class="link-light " href="http://demo.edusoho.com/user/15593">deej</a>
  
              
  收藏了课程 <a class="link-dark" href="http://demo.edusoho.com/course/299" title="来自《作业练习》">作业练习</a>

            </div>
          </div> 
                                 <div class="media media-number-o">
            <div class="media-body">
                  <a class="link-light " href="http://demo.edusoho.com/user/15593">deej</a>
  
              
			加入课程 <a class="link-dark" href="http://demo.edusoho.com/course/299" title="来自《作业练习》">作业练习</a>
	  

            </div>
          </div> 
                                 <div class="media media-number-o">
            <div class="media-body">
                  <a class="link-light " href="http://demo.edusoho.com/user/15578">nulldust</a>
  
              
  开始学习课时 <a class="link-dark" href="http://demo.edusoho.com/course/299" title="来自《作业练习》">考试体验</a>

            </div>
          </div> 
               
      </div>

</div>

          </div>
  </div>
      </div>
      
              
          <footer class="es-footer">
  <div class="footer-link">
    <div class="container">
      <div class="row">
        
<div class="col-md-8 footer-main clearfix">
  <div class="link-item ">
  <h3>我是学生</h3>
  <ul>
          <li>
        <a href="http://www.qiqiuyu.com/course/347/learn#lesson/673" target="_blank">如何注册</a>
      </li>
          <li>
        <a href="http://www.qiqiuyu.com/course/347/learn#lesson/705" target="_blank">如何学习</a>
      </li>
          <li>
        <a href="http://www.qiqiuyu.com/course/347/learn#lesson/811" target="_blank">如何互动</a>
      </li>
      </ul>
</div>

  <div class="link-item ">
  <h3>我是老师</h3>
  <ul>
          <li>
        <a href="http://www.qiqiuyu.com/course/22" target="_blank">发布课程</a>
      </li>
          <li>
        <a href="http://www.qiqiuyu.com/course/147" target="_blank">使用题库</a>
      </li>
          <li>
        <a href="http://www.qiqiuyu.com/course/372" target="_blank">教学资料库</a>
      </li>
      </ul>
</div>

  <div class="link-item ">
  <h3>我是管理员</h3>
  <ul>
          <li>
        <a href="http://www.qiqiuyu.com/course/340" target="_blank">系统设置</a>
      </li>
          <li>
        <a href="http://www.qiqiuyu.com/course/341" target="_blank">课程设置</a>
      </li>
          <li>
        <a href="http://www.qiqiuyu.com/course/343" target="_blank">用户管理</a>
      </li>
      </ul>
</div>

  <div class="link-item hidden-xs">
  <h3>商业应用</h3>
  <ul>
          <li>
        <a href="http://www.qiqiuyu.com/course/232/learn#lesson/358" target="_blank">会员专区</a>
      </li>
          <li>
        <a href="http://www.qiqiuyu.com/course/232/learn#lesson/467" target="_blank">题库增强版</a>
      </li>
          <li>
        <a href="http://www.qiqiuyu.com/course/380" target="_blank">用户导入导出</a>
      </li>
      </ul>
</div>

  <div class="link-item hidden-xs">
  <h3>关于我们</h3>
  <ul>
          <li>
        <a href="http://www.edusoho.com/" target="_blank">ES官网</a>
      </li>
          <li>
        <a href="http://weibo.com/qiqiuyu/profile?rightmod=1&amp;wvr=6&amp;mod=personinfo" target="_blank">官方微博</a>
      </li>
          <li>
        <a href="http://www.edusoho.com/abouts/joinus" target="_blank">加入我们</a>
      </li>
      </ul>
</div>

</div>

<div class="col-md-4 footer-logo hidden-sm hidden-xs">
  <a class="" href="http://www.edusoho.com/" target="_blank"><img src="${ctxStatic}/front/block_picture_1448612323.png" alt="建议图片大小为233*64"></a>
  <div class="footer-sns">
        <a href="http://weibo.com/edusoho" target="_blank"><i class="es-icon es-icon-weibo"></i></a>
            <a class="qrcode-popover top">
      <i class="es-icon es-icon-weixin"></i>
      <div class="qrcode-content">
        <img src="${ctxStatic}/front/block_picture_1437731053.jpg" alt="">  
      </div>
    </a>
            <a class="qrcode-popover top">
      <i class="es-icon es-icon-apple"></i>
      <div class="qrcode-content">
        <img src="${ctxStatic}/front/block_picture_1437731062.png" alt=""> 
      </div>
    </a>
            <a class="qrcode-popover top">
      <i class="es-icon es-icon-android"></i>
      <div class="qrcode-content">
        <img src="${ctxStatic}/front/block_picture_1437731069.png" alt=""> 
      </div>
    </a>
      </div>
</div>



      </div>
    </div>
  </div>

  <div class="copyright">
    <div class="container">
        Powered by <a href="http://www.edusoho.com/" target="_blank">EduSoho v6.11.1</a>
  ©2014-2015 <a class="mlm" href="http://www.howzhi.com/" target="_blank">好知网</a>
      <script src="${ctxStatic}/front/hm.js"></script><script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?0540afe8617c50f12ffda1b818f72bea";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script> 
      <a class="mlm" href="http://demo.edusoho.com/archive/course">课程存档</a>
      <div class="mts">
                  课程内容版权均归
          <a href="http://demo.edusoho.com/">
            杭州阔知网络科技有限公司
          </a>
          所有
                          <a class="mlm" href="http://www.miibeian.gov.cn/" target="_blank">
             浙ICP备13006852号-1
          </a>
              </div>
    </div>
  </div>
</footer>    
      </div>
 
  <div id="login-modal" class="modal" data-url="/login/ajax"></div>
  <div id="modal" class="modal"></div>
  

<script>
  var app = {};
  app.debug = false;
  app.version = '6.11.1';
  app.httpHost = 'http://demo.edusoho.com';
  app.basePath = '';
  app.theme = 'jianmo';
  app.themeGlobalScript = 'theme/global-script';
  app.jsPaths = {"common":"common","theme":"\/themes\/jianmo\/js","filesharebundle":"\/bundles\/fileshare\/js","gracefulthemebundle":"\/bundles\/gracefultheme\/js","vipbundle":"\/bundles\/vip\/js","anywhereclientbundle":"\/bundles\/anywhereclient\/js","discountbundle":"\/bundles\/discount\/js","userimporterbundle":"\/bundles\/userimporter\/js","chargecoinbundle":"\/bundles\/chargecoin\/js","materiallibbundle":"\/bundles\/materiallib\/js","moneycardbundle":"\/bundles\/moneycard\/js","homeworkbundle":"\/bundles\/homework\/js","questionplusbundle":"\/bundles\/questionplus\/js","couponbundle":"\/bundles\/coupon\/js","customwebbundle":"\/bundles\/customweb\/js","customadminbundle":"\/bundles\/customadmin\/js","topxiawebbundle":"\/bundles\/topxiaweb\/js","topxiaadminbundle":"\/bundles\/topxiaadmin\/js","classroombundle":"\/bundles\/classroom\/js"};

  app.crontab = '/common/crontab';
          
  var CKEDITOR_BASEPATH = app.basePath + '/assets/libs/ckeditor/4.6.7/';

  app.config = {"api":{"weibo":{"key":"1549269531"},"qq":{"key":"101252320"},"douban":{"key":""},"renren":{"key":"06f3a36134044a50bef07871fda37f9f"}},"cloud":{"video_player":"http:\/\/cdn.staticfile.org\/GrindPlayerCN\/1.0.2\/GrindPlayer.swf","video_player_watermark_plugin":"http:\/\/cdn.staticfile.org\/GrindPlayerCN\/1.0.2\/Watermake-1.0.3.swf","video_player_fingerprint_plugin":"http:\/\/cdn.staticfile.org\/GrindPlayerCN\/1.0.2\/Fingerprint-1.0.1.swf"},"loading_img_path":"\/assets\/img\/default\/loading.gif?6.11.1"};

  app.arguments = {};
        app.arguments = {"course_uri":"\/course\/299"};
    
  app.scripts = ["course\/show","course\/common","common\/share-dropdown","course\/related-courses-block","course\/recommend-classroom","es-bar\/index","notification\/notification"];
  
  app.uploadUrl = '/file/upload';
  app.imgCropUrl = '/file/img/crop';
  app.lessonCopyEnabled = '0';

  app.mainScript = '/bundles/topxiaweb/js/app.js?6.11.1';
</script>
  <script src="${ctxStatic}/front/sea.js"></script>
<script src="${ctxStatic}/front/seajs-style.js"></script>
<script src="${ctxStatic}/front/seajs-global-config.js"></script>
<script>
  seajs.use(app.mainScript);
</script>

</body></html>