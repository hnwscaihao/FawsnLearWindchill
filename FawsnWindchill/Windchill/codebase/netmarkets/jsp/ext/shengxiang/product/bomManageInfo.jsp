<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>BOM数据信息维护</title>

<script src="/Windchill/netmarkets/javascript/ext/jquery/jquery-2.1.1.min.js"></script>
<script src="/Windchill/netmarkets/javascript/ext/bootstrap/js/bootstrap.min.js"></script>
<script src="/Windchill/netmarkets/javascript/ext/bootstrap/js/html5shiv.js"></script>
<script src="/Windchill/netmarkets/javascript/ext/bootstrap/js/respond.min.js"></script>
<script src="/Windchill/netmarkets/javascript/ext/bootstrap-table/bootstrap-table.min.js"></script>
<script src="/Windchill/netmarkets/javascript/ext/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<script src="/Windchill/netmarkets/javascript/ext/fa"></script>
<link rel="stylesheet" type="text/css"
	href="/Windchill/netmarkets/css/ext/fawsnlear/common.css" >
<link rel="stylesheet" type="text/css"
	href="/Windchill/netmarkets/javascript/ext/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" type="text/css"
	href="/Windchill/netmarkets/javascript/ext/bootstrap-table/bootstrap-table.min.css" >
</head>
<body style="font-size: 12px;">
	<div style="padding-left:8px; padding-top: 8px; background: #ededed; height:35px">
		<span class="headTitle">BOM数据信息维护</span>
	</div>
	<div class="panel panel-default " style="overflow:auto; ">
	    <div style="width: auto; height: auto;">
		    <div class="panel-body " style=" overflow:auto;">
		    	<div class="windowBg" style="width: 100%; ">
		    		<div id="BOMManager" class="panel panel-default"  >
		    			<div class="btn-group" style="padding: 6px 10px; background: #dddddd; width: 100%; height: auto; ">
							<button type="button" class="popupBtn" style="float: left; margin-right:5px; margin-left: 5px; min-width: 110px;" onClick="$('#importModal').modal('show');">
								<img alt="" src="/Windchill/netmarkets/images/export_list_to_xls.png" style="height: 16px; width: 20px; margin: -2px 0px 0px -8px;">
								导入BOM数据</button>
							<button type="button" class="popupBtn" style="float: left; margin-right:5px; margin-left: 5px; min-width: 110px;" onClick="exportBOMExcel();">
								<img alt="" src="/Windchill/netmarkets/images/export_list_to_xlsx.png" style="height: 16px; width: 20px; margin: -2px 0px 0px -8px;">
								导出BOM数据</button>
							<button type="button" class="popupBtn" style="float: left; margin-right:5px; margin-left: 5px; min-width: 135px;" onClick="initEBOM();">
								<img alt="" src="/Windchill/netmarkets/images/expandalllevels.gif" style="height: 16px; width: 20px; margin: -2px 0px 0px -8px;">
								生成EBOM&MBOM</button>
							<button type="button" class="popupBtn" style="float: left; margin-right:5px; margin-left: 5px; min-width: 100px;" onClick="batchUpdate();">
								<img alt="" src="/Windchill/netmarkets/images/add_to_24.png" style="height: 16px; width: 20px; margin: -2px 0px 0px -8px">
								批量更新</button>
						</div>
						<div class="panel-body" style="text-align: center; overflow-x: auto; padding-top: 0px;">
							<!-- <table class="table table-hover table-bordered table-striped table2excel moreHeader" id="bomTable" data-tableName="Test Table 1" 
								style="margin: auto; width: auto; table-layout: fixed;" data-mobile-responsive="false">
		    				</table> -->
		    				<table class="table table-hover table-bordered table-striped moreHeader" id="bomTableDemo" data-tableName="Test Table 1" 
								style="margin: auto; width: auto; table-layout: fixed;" data-mobile-responsive="false">
								<thead>
									<tr>
										<th colspan="40" rowspan="5" style="font-size: 18px;background-color: #eaf2ff; vertical-align: middle; text-align: center;">(   )Bill of Materials (   )物料清单</th>
										<th style="vertical-align: middle; text-align: center;">文件编号：</th>
										<th style="vertical-align: middle; text-align: center;" colspan="4">FEOS-FIS-FR-012</th>
									</tr>
									<tr>
										<th style="vertical-align: middle; text-align: center;">版本/实施日期：</th>
										<th style="vertical-align: middle; text-align: center;" colspan="4">02/2019.06.11</th>
									</tr>
									<tr>
										<th style="vertical-align: middle; text-align: center;">零件描述 <br/> PART DESCRIPTION</th>
										<th style="vertical-align: middle; text-align: center;" >骨架</th>
										<th style="vertical-align: middle; text-align: center;" >皮套</th>
										<th style="vertical-align: middle; text-align: center;" >开关</th>
										<th style="vertical-align: middle; text-align: center;" >塑料件</th>
									</tr>
									<tr>
										<th style="vertical-align: middle; text-align: center;">客户零件号  <br/> OEM PART NUMBER</th>
										<th style="vertical-align: middle; text-align: center;"> C00000001</th>
										<th style="vertical-align: middle; text-align: center;"> C00000002</th>
										<th style="vertical-align: middle; text-align: center;"> C00000003</th>
										<th style="vertical-align: middle; text-align: center;"> C00000004</th>
									</tr>
									<tr>
										<th style="vertical-align: middle; text-align: center;">零件号  <br/> PART NUMBER</th>
										<th style="vertical-align: middle; text-align: center;"> IN0000001</th>
										<th style="vertical-align: middle; text-align: center;"> IN0000002</th>
										<th style="vertical-align: middle; text-align: center;"> IN0000003</th>
										<th style="vertical-align: middle; text-align: center;"> IN0000004</th>
									</tr>
									<tr>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">序号  <br/> PART NUMBER</th>
										<th style="vertical-align: middle; text-align: center;" colspan="10">级别  <br/> Level</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">内/外部零件<br/> (I/O)</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">内部零件号<br/> Internal No.</th>
										<th style="vertical-align: middle; text-align: center;" colspan="4">颜色代码<br/> Color code.</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">颜色件<br/> Color（Y/N）</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">中文名称<br/>Chinese Name</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">英文名称<br/>English Name</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">图片<br/>Picture</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">客户零件号<br/>OEM PART NUMBER</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">零件3D版本<br/>Part Rev.</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">图纸号<br/>Drawing No.</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">图纸2D版本<br/>Drawing Rev.</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">设计沿用<br/>Follow Up（Y/N）</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">沿用项目名称<br/>Follow up project</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">CKD/LC</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">ECN号<br/>ECN No.</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">零件类别<br/>Part type</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">安全件<br/>Safety component(Y/N)</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">材料<br/>Material</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">材料标准<br/>Material standard</th>
										<th style="vertical-align: middle; text-align: center;" colspan="2">密度<br/>density</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">理论重量<br/>Theoretic  Mass(g)</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">尺寸规格<br/>Size（mm）</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">自制/外购零件/外委工艺<br/>Make/Buy Parts/Committee Process</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">供应商<br/>Supplier</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">单位<br/>Unit</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2">备注<br/>Remarks</th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2"></th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2"></th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2"></th>
										<th style="vertical-align: middle; text-align: center;" rowspan="2"></th>
									</tr>
									<tr>
										<th style="vertical-align: middle; text-align: center;">1</th>
										<th style="vertical-align: middle; text-align: center;">2</th>
										<th style="vertical-align: middle; text-align: center;">3</th>
										<th style="vertical-align: middle; text-align: center;">4</th>
										<th style="vertical-align: middle; text-align: center;">5</th>
										<th style="vertical-align: middle; text-align: center;">6</th>
										<th style="vertical-align: middle; text-align: center;">7</th>
										<th style="vertical-align: middle; text-align: center;">8</th>
										<th style="vertical-align: middle; text-align: center;">9</th>
										<th style="vertical-align: middle; text-align: center;">10</th>
										<th style="vertical-align: middle; text-align: center;">Red</th>
										<th style="vertical-align: middle; text-align: center;">Blue</th>
										<th style="vertical-align: middle; text-align: center;">Black</th>
										<th style="vertical-align: middle; text-align: center;">Yellow</th>
										<th style="vertical-align: middle; text-align: center;">数值</th>
										<th style="vertical-align: middle; text-align: center;">单位</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="vertical-align: middle; text-align: center;">
											1
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											2
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											I
										</td>
										<td style="vertical-align: middle; text-align: center;">
											ING000001
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											N
										</td>
										<td style="vertical-align: middle; text-align: center;">
											骨架底座
										</td>
										<td style="vertical-align: middle; text-align: center;">
											GU Jia Di Zuo
										</td>
										<td style="vertical-align: middle; text-align: center;">
											pic
										</td>
										<td style="vertical-align: middle; text-align: center;">
											C00000002
										</td>
										<td style="vertical-align: middle; text-align: center;">
											v1.3
										</td>
										<td style="vertical-align: middle; text-align: center;">
											art009821
										</td>
										<td style="vertical-align: middle; text-align: center;">
											2.0
										</td>
										<td style="vertical-align: middle; text-align: center;">
											Y
										</td>
										<td style="vertical-align: middle; text-align: center;">
											奥迪B8项目
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											ECN1
										</td>
										<td style="vertical-align: middle; text-align: center;">
											金属件
										</td>
										<td style="vertical-align: middle; text-align: center;">
											Y
										</td>
										<td style="vertical-align: middle; text-align: center;">
											铝金属
										</td>
										<td style="vertical-align: middle; text-align: center;">
											国际标准
										</td>
										<td style="vertical-align: middle; text-align: center;">
											0.05
										</td>
										<td style="vertical-align: middle; text-align: center;">
											平方米
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											5mm * 200mm * 20mm  
										</td>
										<td style="vertical-align: middle; text-align: center;">
											外购  
										</td>
										<td style="vertical-align: middle; text-align: center;">
											供应商1  
										</td>
										<td style="vertical-align: middle; text-align: center;">
											mm
										</td>
										<td style="vertical-align: middle; text-align: center;">
											采购骨架
										</td>
										<td style="vertical-align: middle; text-align: center;">
											1
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; text-align: center;">
											2
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											3
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											I
										</td>
										<td style="vertical-align: middle; text-align: center;">
											ING000003
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											N
										</td>
										<td style="vertical-align: middle; text-align: center;">
											底座组成
										</td>
										<td style="vertical-align: middle; text-align: center;">
											Di Zuo Zu Cheng
										</td>
										<td style="vertical-align: middle; text-align: center;">
											pic
										</td>
										<td style="vertical-align: middle; text-align: center;">
											C00000003
										</td>
										<td style="vertical-align: middle; text-align: center;">
											v1.3
										</td>
										<td style="vertical-align: middle; text-align: center;">
											art009821
										</td>
										<td style="vertical-align: middle; text-align: center;">
											2.0
										</td>
										<td style="vertical-align: middle; text-align: center;">
											Y
										</td>
										<td style="vertical-align: middle; text-align: center;">
											奥迪B8项目
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											ECN2
										</td>
										<td style="vertical-align: middle; text-align: center;">
											金属件
										</td>
										<td style="vertical-align: middle; text-align: center;">
											Y
										</td>
										<td style="vertical-align: middle; text-align: center;">
											铝金属
										</td>
										<td style="vertical-align: middle; text-align: center;">
											国际标准
										</td>
										<td style="vertical-align: middle; text-align: center;">
											0.05
										</td>
										<td style="vertical-align: middle; text-align: center;">
											平方米
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
										
										</td>
										<td style="vertical-align: middle; text-align: center;">
											外购  
										</td>
										<td style="vertical-align: middle; text-align: center;">
											供应商1
										</td>
										<td style="vertical-align: middle; text-align: center;">
											mm
										</td>
										<td style="vertical-align: middle; text-align: center;">
											采购骨架
										</td>
										<td style="vertical-align: middle; text-align: center;">
											1
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
									</tr>
									<tr>
										<td style="vertical-align: middle; text-align: center;">
											3
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											3
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											I
										</td>
										<td style="vertical-align: middle; text-align: center;">
											ING000004
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											N
										</td>
										<td style="vertical-align: middle; text-align: center;">
											紧固件
										</td>
										<td style="vertical-align: middle; text-align: center;">
											Jin Gu Jian
										</td>
										<td style="vertical-align: middle; text-align: center;">
											pic
										</td>
										<td style="vertical-align: middle; text-align: center;">
											C00000005
										</td>
										<td style="vertical-align: middle; text-align: center;">
											v1.3
										</td>
										<td style="vertical-align: middle; text-align: center;">
											art009821
										</td>
										<td style="vertical-align: middle; text-align: center;">
											2.0
										</td>
										<td style="vertical-align: middle; text-align: center;">
											Y
										</td>
										<td style="vertical-align: middle; text-align: center;">
											奥迪B8项目
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											ECN2
										</td>
										<td style="vertical-align: middle; text-align: center;">
											金属件
										</td>
										<td style="vertical-align: middle; text-align: center;">
											Y
										</td>
										<td style="vertical-align: middle; text-align: center;">
											铝金属
										</td>
										<td style="vertical-align: middle; text-align: center;">
											国际标准
										</td>
										<td style="vertical-align: middle; text-align: center;">
											10
										</td>
										<td style="vertical-align: middle; text-align: center;">
											个
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
										
										</td>
										<td style="vertical-align: middle; text-align: center;">
											外购  
										</td>
										<td style="vertical-align: middle; text-align: center;">
											供应商1
										</td>
										<td style="vertical-align: middle; text-align: center;">
											mm
										</td>
										<td style="vertical-align: middle; text-align: center;">
											骨架紧固件
										</td>
										<td style="vertical-align: middle; text-align: center;">
											1
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
										<td style="vertical-align: middle; text-align: center;">
											
										</td>
									</tr>
								</tbody>
		    				</table>
		    			</div>
		    		</div>		
		    	</div>		
			</div>		
	    </div>		
	</div>
	<div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	    <div class="modal-dialog">
	        <div class="modal-content" style="width: 60%; margin-left: 20%;">
	        	<div class="modal-header" style="background-color: #ededed; font-size:14px; padding: 10px 15px;">
	        		<span><strong id="title">导入BOM数据</strong></span>
	        	</div>
	            <div class="modal-body " style="margin-bottom: 0px;" >
	            	<div style="text-align: center; overflow-x: auto;">
	            		<input type="file">
					</div>
				</div>
	            <div class="modal-footer" style="height: 36px; padding-top: 8px;">
	                <button type="button" class="popupBtn" onclick="closeAlertWindow();">导入</button>
	                <button type="button" class="popupBtn" onclick="closeAlertWindow();">关闭</button>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>