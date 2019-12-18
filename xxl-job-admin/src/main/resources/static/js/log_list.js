$(function() {

    // init date tables
    debugger;
    var userListTable = $("#log_list").dataTable({
        "deferRender": true,
        "processing" : true,
        "serverSide": true,
        "ajax": {
            url: base_url + "/es/pageQuery",
            type:"get",
            /*data:{
                page: 1,
                pagesize: 15
            },*/
            data : function ( d ) {
                var obj = {};
                /*obj.username = $('#username').val();
                obj.role = $('#role').val();*/
                obj.page = d.start;
                obj.pagesize = d.length;
                return obj;
            }
        },
        "searching": false,
        "ordering": false,
        //"scrollX": true,	// scroll x，close self-adaption
        "columns": [
            {
                "data": 'status',
                "visible" : true,
                "width":'10%',
                "render": function ( data, type, row ) {
                	debugger;
                    return function(){
                    	var firstNum = data.substr(0,1);
                        // html
                    	if(firstNum == 2){
                    		var html = '<p id="'+ row.id +'" >'+I18n.log_cate_info +'</p>';
                    	}else if(firstNum == 5 || data == 404){
                    		var html = '<p id="'+ row.id +'" >'+I18n.log_cate_error +'</p>';
                    	}else{
                    		var html = '<p id="'+ row.id +'" >'+I18n.log_cate_warn +'</p>';
                    	}

                        return html;
                    };
                }
            },
            {
                "data": 'http_host',
                "visible" : true,
                "width":'15%',
            },
            {
                "data": 'upstream_addr',
                "visible" : true,
                "width":'15%',
            },
            {
                "data": 'reqTime',
                "width":'10%',
                "visible" : true
            },
            {
                "data": 'status',
                "visible" : true,
                "width":'10%',
            },
            /*{
                "data": 'log_message',
                "width":'20%',
                "render": function ( data, type, row ) {
                    return function(){
                        // html
                        tableData['key'+row.id] = row;
                        var html = '<p id="'+ row.id +'" >'+
                            '<button class="btn btn-info btn-xs info" type="button">'+ I18n.system_show +'</button>  '+
                            '</p>';

                        return html;
                    };
                }
            }*/
        ],
        "language" : {
            "sProcessing" : I18n.dataTable_sProcessing ,
            "sLengthMenu" : I18n.dataTable_sLengthMenu ,
            "sZeroRecords" : I18n.dataTable_sZeroRecords ,
            "sInfo" : I18n.dataTable_sInfo ,
            "sInfoEmpty" : I18n.dataTable_sInfoEmpty ,
            "sInfoFiltered" : I18n.dataTable_sInfoFiltered ,
            "sInfoPostFix" : "",
            "sSearch" : I18n.dataTable_sSearch ,
            "sUrl" : "",
            "sEmptyTable" : I18n.dataTable_sEmptyTable ,
            "sLoadingRecords" : I18n.dataTable_sLoadingRecords ,
            "sInfoThousands" : ",",
            "oPaginate" : {
                "sFirst" : I18n.dataTable_sFirst ,
                "sPrevious" : I18n.dataTable_sPrevious ,
                "sNext" : I18n.dataTable_sNext ,
                "sLast" : I18n.dataTable_sLast
            },
            "oAria" : {
                "sSortAscending" : I18n.dataTable_sSortAscending ,
                "sSortDescending" : I18n.dataTable_sSortDescending
            }
        }
    });

    // table data
    var tableData = {};

    // search btn
    $('#searchBtn').on('click', function(){
        userListTable.fnDraw();
    });

    // job operate
    $("#log_list").on('click', '.delete',function() {
        var id = $(this).parent('p').attr("id");

        layer.confirm( I18n.system_ok + I18n.system_opt_del + '?', {
            icon: 3,
            title: I18n.system_tips ,
            btn: [ I18n.system_ok, I18n.system_cancel ]
        }, function(index){
            layer.close(index);

            $.ajax({
                type : 'POST',
                url : base_url + "/user/remove",
                data : {
                    "id" : id
                },
                dataType : "json",
                success : function(data){
                    if (data.code == 200) {
                        layer.msg( I18n.system_success );
                        userListTable.fnDraw(false);
                    } else {
                        layer.msg( data.msg || I18n.system_opt_del + I18n.system_fail );
                    }
                }
            });
        });
    });

    // 查看日志
    $("#user_list").on('click', '.info',function() {
        var id = $(this).parent('p').attr("id");

        layer.confirm( I18n.system_ok + I18n.system_opt_del + '?', {
            icon: 3,


            title: I18n.system_tips ,
            btn: [ I18n.system_ok, I18n.system_cancel ]
        }, function(index){
            layer.close(index);

            $.ajax({
                type : 'POST',
                url : base_url + "/user/remove",
                data : {
                    "id" : id
                },
                dataType : "json",
                success : function(data){
                    if (data.code == 200) {
                        layer.msg( I18n.system_success );
                        userListTable.fnDraw(false);
                    } else {
                        layer.msg( data.msg || I18n.system_opt_del + I18n.system_fail );
                    }
                }
            });
        });
    });

});
