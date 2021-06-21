<!-- BEGIN: main -->
<form action="{FORM_ACTION}" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="input-group">
                <span class="input-group-addon">
                    <label class="radio-inline">
                        <input type="radio" name="optradio" value="Top100" checked>Top 100
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="optradio" value="PhoDiem">Phổ điểm
                    </label>
                </span>
                <span class="hidden-xs hidden-sm input-group-addon">Cụm thi</span>
                <select class="form-control" id="listCity" name="city">
                    <!-- BEGIN: area -->
                    <option value="{AREA.id}" {AREA.selected}>{AREA.name}</option>
                    <!-- END: area -->
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="input-group">
                <span class="input-group-addon">Môn</span>
                <select class="form-control" id="listSubject" name="subject">
                    <!-- BEGIN: subjectid -->
                    <option value="{SUBJECTID.key}" {SUBJECTID.selected}>{SUBJECTID.value}</option>
                    <!-- END: subjectid -->
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="input-group">
                <span class="input-group-addon">Năm</span>
                <select class="form-control" id="listYear" name="year">
                    <!-- BEGIN: year -->
                    <option value="{YEAR.key}" {YEAR.selected}>{YEAR.key}</option>
                    <!-- END: year -->
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <button type="submit" name="search_submit" class="btn btn-primary btn-block">Xem kết quả</button>
        </div>
    </div>
</form>
<!-- BEGIN: show_top100 -->
<div id="ListTop100" style="margin-top: 20px;">
    <h3 class="m-header-text text-center" id="title_caption" style="margin-bottom: 20px;">Top 100 cụm thi 
        <span id="cumthi" style="color: blue;">{CITY.key} {CITY.title}</span> môn 
        <span id="thimon">{SUBJECT}</span> 
        <span id="spNamTop" style="color: red;">{CURRENT}</span>
    </h3>
    <div>
        <div id="lblResult" class="text-danger" style="font-size:16px;font-weight:bold;"></div>
    </div>
    <div class="row">
        <div class="col-md-24">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th rowspan="2">#</th>
                            <th rowspan="2">Số báo danh</th>
                            <th rowspan="2">Sở GDĐT</th>
                            <th rowspan="2">Toán</th>
                            <th rowspan="2">Ngữ văn</th>
                            <th rowspan="2">Ngoại ngữ</th>
                            <th colspan="4">Bài khoa học tự nhiên</th>
                            <th colspan="4">Bài khoa học Xã hội</th>
                        </tr>
                        <tr>
                            <th>Vật lý</th>
                            <th>Hóa học</th>
                            <th>Sinh học</th>
                            <th style="background: #0067b8;color: #ffffff">Điểm KHTN</th>
                            <th>Lịch sử</th>
                            <th>Địa lý</th>
                            <th>GDCD</th>
                            <th style="background: #0067b8;color: #ffffff">Điểm KHXH</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- BEGIN: item -->
                        <tr>
                            <td>{NO}</td>
                            <td>{DATA.Code}</td>
                            <td>{DATA.CityName}</td>
                            <td id="Toan" {TOAN}>{DATA.Toan}</td>
                            <td id="NguVan" {VAN}>{DATA.NguVan}</td>
                            <td id="NgoaiNgu" {NN}>{DATA.NgoaiNgu}</td>
                            <td id="VatLi" {VL}>{DATA.VatLi}</td>
                            <td id="HoaHoc" {HH}>{DATA.HoaHoc}</td>
                            <td id="SinhHoc" {SH}>{DATA.SinhHoc}</td>
                            <td id="KHTN" {KHTN}>{DATA.KHTN}</td>
                            <td id="LichSu" {LS}>{DATA.LichSu}</td>
                            <td id="DiaLi" {DL}>{DATA.DiaLi}</td>
                            <td id="GDCD" {GDCD}>{DATA.GDCD}</td>
                            <td id="KHXH" {KHXH}>{DATA.KHXH}</td>
                        </tr>
                        <!-- END: item -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-24">
            <div id="chartPie" style="height: 840px; position: relative; touch-action: none; display: none;" data-role="chart" class=" k-chart"></div>
        </div>
    </div>
</div>
<!-- END: show_top100 -->
<!-- BEGIN: show_pho_diem -->
<div class="row" id="PhoDiemChart">
    <div class="col-md-24">
        <div class="k-content wide">
            <div id="chart"></div>
        </div>
    </div>
</div>
<link href="{VENDOR_KENDO}/kendo.common-bootstrap.min.css" rel="stylesheet" />
<link href="{VENDOR_KENDO}/kendo.bootstrap.min.css" rel="stylesheet" />
<script src="{VENDOR_KENDO}/jquery.min.js"></script>
<script src="{VENDOR_KENDO}/jszip.min.js"></script>
<script src="{VENDOR_KENDO}/kendo.core.min.js"></script>

<script src="{VENDOR_KENDO}/kendo.data.min.js"></script>
<script src="{VENDOR_KENDO}/kendo.userevents.min.js"></script>
<script src="{VENDOR_KENDO}/kendo.color.min.js"></script>

<script src="{VENDOR_KENDO}/kendo.popup.min.js"></script>
<script src="{VENDOR_KENDO}/kendo.drawing.min.js"></script>

<script src="{VENDOR_KENDO}/kendo.dataviz.core.min.js"></script>
<script src="{VENDOR_KENDO}/kendo.dataviz.themes.min.js"></script>
<script src="{VENDOR_KENDO}/kendo.dataviz.chart.min.js"></script>
<script>
/*Hiển thị phổ điểm*/
$(document).ready(function() {
    var data = `{DATA}`;
    var score = `{SUBJECT}`;
    var dataChart = $.parseJSON(data);
    $("#chart").kendoChart({

        dataSource: {
            data: dataChart, dataType: "json"
        },
        title: {
            text: 'Phổ điểm môn ' + $('#listSubject').find('option:selected').text() + ' ' + $('#listCity').find('option:selected').text()
        },

        series: [{
            //type: "column",
            //labels: {
            //    visible: true,
            //    position: "above"
            //},
            field: "Count",
            //categoryField: "Count"
        }],
        seriesDefaults: {

            labels: {
                visible: true, rotation: "270", format: "#,###,###" //position: "above"

            }
        },
        zoomable: {
            mousewheel: {
                lock: "y"
            },
            selection: {
                lock: "y"
            }
        },
        categoryAxis: {
            field: score,
            majorGridLines: {
                visible: false
            },
            line: {
                visible: true
            },

            labels: {
                rotation: "270"
            }
        },
        yAxis: {
            visible: true,
            labels: {
                format: "#,###,###"
            }
        }

    });
    });
</script>
<!-- END: show_pho_diem -->
<!-- END: main -->