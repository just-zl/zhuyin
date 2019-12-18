<!DOCTYPE html>
<html>
<head>
  	<#import "./common/common.macro.ftl" as netCommon>
	<@netCommon.commonStyle />
	<title>${I18n.admin_name}</title>
	<style>
		.hlep_tit{
            text-align: center;
			margin-bottom: 50px;
            font-weight:bold;
		}
		.help_cont{
			font-size: 18px;
            line-height: 35px;
		}
		.help_cont_bold{
            font-weight: bold;
            font-size: 18px;
			margin-bottom: 20px;
		}
		.help_box{
			margin-bottom: 30px;
		}
        .help_box .help_paragraph{
            margin-bottom: 15px;
        }
		.hlep_img{
            width:50%;
			margin-bottom: 15px;
		}
	</style>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["xxljob_adminlte_settings"]?exists && "off" == cookieMap["xxljob_adminlte_settings"].value >sidebar-collapse</#if> ">
<div class="wrapper">
	<!-- header -->
	<@netCommon.commonHeader />
	<!-- left -->
	<@netCommon.commonLeft "help" />
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content" style="padding-left: 50px;padding-right: 50px">
			<h3 class="hlep_tit">烛阴-日志监测系统 操作指南</h3>

			<p class="help_cont_bold">欢迎您使用烛阴-日志操作系统，下面将为您介绍本系统的使用方法，请仔细阅览哦。</p>

			<div class="help_box">
				<div class="help_paragraph">
					<p class="help_cont">一、登录</p>
					<p class="help_cont">
						进入本系统前需要用户进行登录操作，我们默认为系统创建了一个管理员用户，用户名：admin，
						用户密码：123456，登录后可以在页面顶部右侧点击用户名更改密码。另外，考虑到系统的安全
						性能，如需创建多个账号，需要管理员手动创建账号，后续会讲到使用方法。下面是我们美观大方
						的登录界面：
					</p>
					<img class="hlep_img" src="${request.contextPath}/static/img/examp_login.jpg">
                    <p class="help_cont">
                        奥，对了，我们这套系统还准备了英文版哦，点击登录框右上方的“English”就可以跳转到英文版
                        的系统了。
                    </p>
                </div>
            </div>

			<div class="help_box">
                <div class="help_paragraph">
                    <p class="help_cont">二、系统内部构成</p>
                    <p class="help_cont">
                        本系统由“运行报表”、“日志浏览”、“告警记录”、“日志监测管理”、
                        “系统用户管理”和“系统使用教程”六个模块组成，下面将一一对这
                        六个模块进行介绍。
                    </p>
                </div>

                <div class="help_paragraph">
                    <p class="help_cont">2.1运行报表</p>
                    <p class="help_cont">
                        本模块即是系统的首页，根据该系统所监测到的“正常日志”、“警告日志”和
						“报错日志”来监测目标系统的使用状况，以下是界面截图：
                    </p>
                    <img class="hlep_img" src="${request.contextPath}/static/img/examp_run_report.jpg">
                </div>

                <div class="help_paragraph">
                    <p class="help_cont">2.2日志浏览</p>
                    <p class="help_cont">
                        本模块用于查询、展示本系统监测到的所有日志信息。可以根据日志的类别（即：正常、警告和报错）
						、监测对象的IP以及用户访问监测对象的时间来查询，以显示该日志的详细信息，为工作人员提供一手
						资料。以下是界面截图：
                    </p>
                    <img class="hlep_img" src="${request.contextPath}/static/img/examp_log_browse.jpg">
                </div>

                <div class="help_paragraph">
                    <p class="help_cont">2.3告警记录</p>
                    <p class="help_cont">
                        本模块是用于展示本系统的告警记录。当本系统监测到目标系统的异常日志后，会通过发送短信的方式
						提醒目标系统的联系人。以下是界面截图：
                    </p>
                    <img class="hlep_img" src="${request.contextPath}/static/img/examp_alarm_record.jpg">
                </div>

                <div class="help_paragraph">
                    <p class="help_cont">2.4日志监测管理</p>
                    <p class="help_cont">
                        本模块用于展示本系统目前监测的所有IP，以及对应的联系人信息，本系统用户可以在信息后面进行
						操作（修改和删除记录）。以下是界面截图：
                    </p>
                    <img class="hlep_img" src="${request.contextPath}/static/img/examp_log_manage.jpg">

                    <p class="help_cont">
                        此外，本系统的使用人员还可以新增监测信息，只需点击页面右上方的“新增监测”按钮，填写相应信息
						即可生效，以下是操作页面的截图：
                    </p>
                    <img class="hlep_img" src="${request.contextPath}/static/img/examp_log_manage_new.jpg">
                </div>

                <div class="help_paragraph">
                    <p class="help_cont">2.5系统用户管理</p>
                    <p class="help_cont">
                        本模块用于展示本系统的当前用户，支持对每一条记录进行用户信息的编辑和删除操作。以下是该模块的
						截图：
                    </p>
                    <img class="hlep_img" src="${request.contextPath}/static/img/examp_sys_user_manage.jpg">

                    <p class="help_cont">
                        另外，出于系统的安全性考虑，<span style="color: red;">本系统需要管理员在本模块中创建新用户。</span>本系统的用户分为普通用户和
						管理员用户，两者的区别在于本模块只对管理员用户可见，也就意味着只有管理员才可以创建新的用户。
						以下是该功能截图：
                    </p>
                    <img class="hlep_img" src="${request.contextPath}/static/img/examp_sys_user_create.jpg">
                </div>

                <div class="help_paragraph">
                    <p class="help_cont">2.6系统使用教程</p>
                    <p class="help_cont">
                        嘿嘿，就是本文档啦。
                    </p>
                </div>

                <div class="help_paragraph">
                    <p class="help_cont" style="font-size: 12px;color: gray">
						tips:“烛阴”选自《山海经》，是上古神兽，人面龙身，口中衔烛。它威力极大，睁眼时普天光明
						，即是白天；闭眼时天昏地暗，即是黑夜……本系统命名为烛阴，即寓意您选择开启本系统后，表名
						“白昼降临”，所有监测对象的运行状态就能一清二楚，难逃法眼……
					</p>
                    <p class="help_cont" style="text-align: right;font-size: 14px;margin-top: 50px">
                        --中原鲲鹏训练营 软通智慧团队
                    </p>
                </div>

			</div>

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	
	<!-- footer -->
	<@netCommon.commonFooter />
</div>
<@netCommon.commonScript />
</body>
</html>
