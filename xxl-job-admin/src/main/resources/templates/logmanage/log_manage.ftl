<!DOCTYPE html>
<html>
<head>
<#import "../common/common.macro.ftl" as netCommon>
<@netCommon.commonStyle />
    <!-- DataTables -->
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <title>${I18n.admin_name}</title>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["xxljob_adminlte_settings"]?exists && "off" == cookieMap["xxljob_adminlte_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
    <!-- header -->
<@netCommon.commonHeader />
    <!-- left -->
<@netCommon.commonLeft "log_manage" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>${I18n.log_manage}</h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-3">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.log_monitor_ip}</span>

                        <#--TODO 去除value="1"-->
                        <input type="text" class="form-control" id="role" >
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.log_monitoring_person}</span>
                        <input type="text" class="form-control" id="username" autocomplete="on" placeholder="${I18n.system_UsernameOrPwd}">
                    </div>
                </div>
                <div class="col-xs-1">
                    <button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
                </div>

                <div class="col-xs-2">
                    <button class="btn btn-block btn-success add" type="button">${I18n.log_monitor_add}</button>
                </div>
            </div>

            <div class="row" style="margin-top: 20px">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body" >
                            <table id="log_manage_list" class="table table-bordered table-striped" width="100%" >
                                <thead>
                                <tr>
                                <#--<th name="no" >序号</th>-->
                                    <th name="http_host" >${I18n.log_monitor_ip}</th>
                                    <th name="monitoring_person" >${I18n.log_monitoring_person}</th>
                                    <th name="monitoring_phone" >${I18n.log_monitoring_phone}</th>
                                    <th>${I18n.system_opt}</th>
                                </tr>
                                </thead>
                                <tbody>
                                	<#--
                                    <tr>
                                        <td colspan="4" style="text-align: center;padding: 50px 0">${I18n.system_no_data}</td>
                                    </tr>
                                    -->
                                </tbody>
                                <tfoot></tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- footer -->
<@netCommon.commonFooter />
</div>

<!-- 新增.模态框 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" >${I18n.log_monitor_add}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form" >
                    <div class="form-group">
                        <label class="col-sm-3 control-label">${I18n.log_monitor_ip}<font color="red">*</font></label>
                        <div class="col-sm-7"><input type="text" class="form-control" name="monitor_ip" placeholder="${I18n.system_please_input}${I18n.log_monitor_ip}" maxlength="20" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">${I18n.log_monitoring_person}<font color="red">*</font></label>
                        <div class="col-sm-7"><input type="text" class="form-control" name="monitoring_person" placeholder="${I18n.system_please_input}${I18n.log_monitoring_person}" maxlength="20" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">${I18n.log_monitoring_phone}<font color="red">*</font></label>
                        <div class="col-sm-7"><input type="text" maxlength="11" class="form-control" name="monitoring_phone" placeholder="${I18n.system_please_input}${I18n.log_monitoring_phone}" ></div>
                    </div>

                    <hr>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <button type="submit" class="btn btn-primary"  >${I18n.system_save}</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">${I18n.system_cancel}</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- 更新.模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" >${I18n.user_update}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form" >
                    <#-- <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">${I18n.user_username}<font color="red">*</font></label>
                        <div class="col-sm-8"><input type="text" class="form-control" name="username" placeholder="${I18n.system_please_input}${I18n.user_username}" maxlength="20" readonly ></div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">${I18n.user_password}<font color="red">*</font></label>
                        <div class="col-sm-8"><input type="text" class="form-control" name="password" placeholder="${I18n.user_password_update_placeholder}" maxlength="20" ></div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">${I18n.user_role}<font color="red">*</font></label>
                        <div class="col-sm-10">
                            <input type="radio" name="role" value="0" />${I18n.user_role_normal}
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="role" value="1" />${I18n.user_role_admin}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">${I18n.user_permission}<font color="black">*</font></label>
                        <div class="col-sm-10">
                        <#if groupList?exists && groupList?size gt 0>
                            <#list groupList as item>
                                <input type="checkbox" name="permission" value="${item.id}" />${item.title}(${item.appName})<br>
                            </#list>
                        </#if>
                        </div>
                    </div>
                    -->
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label">${I18n.log_monitoring_person}<font color="red">*</font></label>
                        <div class="col-sm-7"><input type="text" class="form-control" name="monitoring_person" placeholder="${I18n.system_please_input}${I18n.log_monitoring_person}" maxlength="20" ></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">${I18n.log_monitoring_phone}<font color="red">*</font></label>
                        <div class="col-sm-7"><input type="text" maxlength="11" class="form-control" name="monitoring_phone" placeholder="${I18n.system_please_input}${I18n.log_monitoring_phone}" ></div>
                    </div>

                    <hr>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <button type="submit" class="btn btn-primary"  >${I18n.system_save}</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">${I18n.system_cancel}</button>
                            <input type="hidden" name="id" >
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<@netCommon.commonScript />
<!-- DataTables -->
<script src="${request.contextPath}/static/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${request.contextPath}/static/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${request.contextPath}/static/js/log_manage.js"></script>
<script>
<#--
    // add role
    $("#addModal .form input[name=role]").change(function () {
        var role = $(this).val();
        if (role == 1) {
            $("#addModal .form input[name=permission]").parents('.form-group').hide();
        } else {
            $("#addModal .form input[name=permission]").parents('.form-group').show();
        }
        $("#addModal .form input[name='permission']").prop("checked",false);
    });

    jQuery.validator.addMethod("myValid01", function(value, element) {
        var length = value.length;
        var valid = /^[a-z][a-z0-9]*$/;
        return this.optional(element) || valid.test(value);
    }, I18n.user_username_valid );

    jQuery.validator.addMethod("validPhone", function(value, element) {
        var length = value.length;
        var valid = /^[1][3,4,5,7,8][0-9]{9}$/;
        return this.optional(element) || valid.test(value);
    }, I18n.log_monitoring_phone_valid );

    // add
    $(".add").click(function(){
        $('#addModal').modal({backdrop: false, keyboard: false}).modal('show');
    });
    var addModalValidate = $("#addModal .form").validate({
        errorElement : 'span',
        errorClass : 'help-block',
        focusInvalid : true,
        rules : {
            monitor_ip : {
                required : true,
                //rangelength:[4, 20],
                //TODO 校验IP是否存在
                //myValid01: true
            },
            monitoring_person : {
                required : true,
                //rangelength:[4, 20]
            },
            monitoring_phone : {
                required : true,
                digits:true,
                validPhone:true
            }
        },
        messages : {
            monitor_ip : {
                required : I18n.system_please_input + I18n.log_monitor_ip,
                //rangelength: I18n.system_lengh_limit + "[4-20]"
            },
            monitoring_person : {
                required : I18n.system_please_input + I18n.log_monitoring_person,
                //rangelength: I18n.system_lengh_limit + "[4-20]"
            },
            monitoring_phone : {
                required : I18n.system_please_input + I18n.log_monitoring_phone,
                rangelength: I18n.system_please_input + "11位" + I18n.log_monitoring_phone
            }
        },
        highlight : function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        success : function(label) {
            label.closest('.form-group').removeClass('has-error');
            label.remove();
        },
        errorPlacement : function(error, element) {
            element.parent('div').append(error);
        },
        submitHandler : function(form) {

            var permissionArr = [];
            $("#addModal .form input[name=permission]:checked").each(function(){
                permissionArr.push($(this).val());
            });

            var paramData = {
                "monitor_ip": $("#addModal .form input[name=monitor_ip]").val(),
                "monitoring_person": $("#addModal .form input[name=monitoring_person]").val(),
                "monitoring_phone": $("#addModal .form input[name=monitoring_phone]").val(),
            };

            //TODO 传入controlor
            /*$.post(base_url + "/user/add", paramData, function(data, status) {
                if (data.code == "200") {
                    $('#addModal').modal('hide');

                    layer.msg( I18n.system_add_suc );
                    userListTable.fnDraw();
                } else {
                    layer.open({
                        title: I18n.system_tips ,
                        btn: [ I18n.system_ok ],
                        content: (data.msg || I18n.system_add_fail),
                        icon: '2'
                    });
                }
            });*/
        }
    });
    $("#addModal").on('hide.bs.modal', function () {
        $("#addModal .form")[0].reset();
        addModalValidate.resetForm();
        $("#addModal .form .form-group").removeClass("has-error");
        $(".remote_panel").show();	// remote

        $("#addModal .form input[name=permission]").parents('.form-group').show();
    });
-->
</script>
</body>
</html>
