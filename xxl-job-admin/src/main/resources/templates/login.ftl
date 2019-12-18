<!DOCTYPE html>
<html>
<head>
  	<#import "./common/common.macro.ftl" as netCommon>
	<@netCommon.commonStyle />
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/plugins/iCheck/square/blue.css">

    <link rel="stylesheet" href="${request.contextPath}/static/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css.css">
    <link rel="stylesheet" href="${request.contextPath}/static/plugins/iconic/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/util.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/main.css">

	<title>${I18n.admin_name}</title>
</head>
<body>
	<#--<div class="login-box">
		<div class="login-logo">
			<a><b>XXL</b>JOB</a>
		</div>
		<form id="loginForm" method="post" >
			<div class="login-box-body">
				<p class="login-box-msg">${I18n.admin_name}</p>
				<div class="form-group has-feedback">
	            	<input type="text" name="userName" class="form-control" placeholder="${I18n.login_username_placeholder}"  maxlength="18" >
	            	<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
	          	<div class="form-group has-feedback">
	            	<input type="password" name="password" class="form-control" placeholder="${I18n.login_password_placeholder}"  maxlength="18" >
	            	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
	          	</div>
				<div class="row">
					<div class="col-xs-8">
		              	<div class="checkbox icheck">
		                	<label>
		                  		<input type="checkbox" name="ifRemember" > &nbsp; ${I18n.login_remember_me}
		                	</label>
						</div>
		            </div><!-- /.col &ndash;&gt;
		            <div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">${I18n.login_btn}</button>
					</div>
				</div>
			</div>
		</form>
	</div>-->

    <div class="limiter">
        <div class="container-login100 login-container">

            <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                 <#--顶部切换系统语种-->
                <div style="float:right;">
                    <a style="color: #a64bf4;opacity:.8;" href="http://139.9.113.99:8082/zhuyin/toLogin">English</a>
                </div>

                <form class="login100-form validate-form" id="loginForm" method="post">
                    <#--<span class="login100-form-title p-b-49">烛阴-日志监测</span>-->
                    <span class="login100-form-title p-b-49">${I18n.login_tit}</span>

                    <div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
                        <span class="label-input100">${I18n.user_username}</span>
                        <input class="input100" type="text" name="userName" placeholder="${I18n.login_username_placeholder}" autocomplete="off" maxlength="18">
                        <span class="focus-input100" data-symbol="&#xf206;"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="请输入密码">
                        <span class="label-input100">${I18n.user_password}</span>
                        <input class="input100" type="password" name="password" placeholder="${I18n.login_password_placeholder}" maxlength="18">
                        <span class="focus-input100" data-symbol="&#xf190;"></span>
                    </div>

                    <div class="p-t-8 p-b-31"></div>

                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn">${I18n.login_btn}</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>

<@netCommon.commonScript />

<#--<script src="${request.contextPath}/static/plugins/jquery/jquery-3.2.1.min.js"></script>-->
<script src="${request.contextPath}/static/js/main.js"></script>

<script src="${request.contextPath}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
<script src="${request.contextPath}/static/js/login.1.js"></script>

</body>
</html>
