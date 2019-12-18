<!DOCTYPE html>
<html>
<head>
<#import "./common/common.macro.ftl" as netCommon>
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
<@netCommon.commonLeft "log_list" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>${I18n.log_search}</h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-3">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.log_cate}</span>
                        <select class="form-control" id="role" >
                            <option value="-1" >${I18n.system_all}</option>
                            <option value="1" >${I18n.log_cate_info}</option>
                            <option value="0" >${I18n.log_cate_warn}</option>
                            <option value="2" >${I18n.log_cate_error}</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.log_monitor_ip}</span>
                        <input type="text" class="form-control" id="log_monitor_ip" >
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.log_visit_time}</span>
                        <input type="datetime-local" class="form-control" id="username" >
                    </div>
                </div>
                <div class="col-xs-1">
                    <button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
                </div>
            </div>

            <div class="row" style="margin-top: 20px">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body" >
                            <table id="log_list" class="table table-bordered table-striped" width="100%" >
                                <thead>
                                <tr>
                                    <#--<th name="no" >序号</th>-->
                                    <#--<th name="log_cate" >${I18n.log_cate}</th>-->
                                    <th name="status" >${I18n.log_cate}</th>
                                    <th name="http_host" >${I18n.log_monitor_ip}</th>
                                    <th name="upstream_addr" >${I18n.log_visit_ip}</th>
                                    <th name="reqTime">${I18n.log_visit_time}</th>
                                    <th name="status">${I18n.log_response_code}</th>
                                    <#--<th name="log_message" >${I18n.log_message}</th>-->
                                </tr>
                                </thead>
                                <tbody>
                                    <#--<tr>
                                        <td colspan="6" style="text-align: center;padding: 50px 0">${I18n.system_no_data}</td>
                                    </tr>-->
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


<@netCommon.commonScript />
<!-- DataTables -->
<script src="${request.contextPath}/static/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${request.contextPath}/static/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${request.contextPath}/static/js/log_list.js"></script>
</body>
</html>
