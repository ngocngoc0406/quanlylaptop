<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.NhapHang"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin - Nhập hàng</title>
<meta name="description" content="Admin - Bán hàng">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../include/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../include/leftmenu.jsp"></jsp:include>

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="../include/header.jsp"></jsp:include>

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>
									<b>Nhập hàng</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Hóa đơn</a></li>
									<li class="active">Danh sách</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Danh sách</strong> <br>
								<hr>
								<div class="col-md-12 d-flex">
									<div class="col-md-3">
										<a class="btn btn-primary float-left" href="add"><span><i
												class="fa fa-plus-square"></i></span> Thêm</a>

									</div>
									<div class="col-md-8">
										<div class="form-group">
											<form method="get" action="list" class="d-flex">
												<input type="text" placeholder="Nhập người nhập hàng"
													class="form-control" id="input_seacrh" name="search">
												<input type="submit" value="Tìm kiếm" id="input_submit">
											</form>
										</div>
									</div>
								</div>

							</div>

							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>ID</th>
											<th>Người gửi hàng</th>
											<th>SĐT người gửi</th>
											<th>Địa chỉ</th>
											<th>Ghi chú</th>
											<th>Ngày Nhập</th>
											<th>Ngày Tạo</th>
											<th>Ngày sửa</th>
											<th>Chi tiết</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<NhapHang> list = (ArrayList<NhapHang>) request.getAttribute("list");
										for (NhapHang l : list) {
										%>
										<tr>
											<td><%=l.getIdNhapHang()%></td>
											<td><%=l.getTenNguoiGui()%></td>
											<td><%=l.getSdt()%></td>
											<td><%=l.getDiaChi()%></td>
											<td><%=l.getGhiChu()%></td>
											<td><%=l.getNgayNhap()%></td>
											<td><%=l.getNgayTao()%></td>
											<td><%=l.getNgaySua()%></td>
											<td><div class="div_action">
													<a class="btn btn-success" href="listdetail?id=<%=l.getIdNhapHang()%>"><span><i
															class="fa fa-edit"></i></span>Chi tiết</a>
												</div></td>
											<td><div class="div_action">

													<a class="btn btn-success" href="edit?id=<%=l.getIdNhapHang()%>"><span><i
															class="fa fa-edit"></i></span> Sửa</a>
													<button class="btn btn-secondary"
														onclick="Delete(<%=l.getIdNhapHang()%>)">
														<span><i class="fa fa-trash-o"></i></span> Xóa
													</button>
												</div></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->
		<div class="clearfix"></div>
	</div>

	<style>
.div_action {
	margin: 0px 1px;
	display: flex;
}

.div_action a {
	margin-right: 10px
}

#input_seacrh {
	margin-right: 20px;
	margin-left: 150px;
}

#input_submit {
	border: 1px solid #ced4da;
	padding: 2px 7px;
	margin-right: -60px;
	background-color: #28a745;
	border-radius: 5px;
}
</style>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->

	<jsp:include page="../include/js.jsp"></jsp:include>

	<script src="../../lib/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="../../lib/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="../../lib/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="../../lib/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script src="../../lib/assets/js/lib/data-table/jszip.min.js"></script>
	<script src="../../lib/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script src="../../lib/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script src="../../lib/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script src="../../lib/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script src="../../lib/assets/js/init/datatables-init.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>
	<%
	if ((String) session.getAttribute("Edit") == "Success") {
	%>
	<script>
		swal('Sửa dữ liệu thành công');
	</script>
	<%
	session.removeAttribute("Edit");
	}
	%>
	
		<%
	if ((String) session.getAttribute("Edit") == "Faill") {
	%>
	<script>
		swal('Sửa dữ liệu thất bại');
	</script>
	<%
	session.removeAttribute("Edit");
	}
	%>

	<%
	if ((String) session.getAttribute("Add") == "Success") {
	%>
	<script>
		swal('Thêm dữ liệu thành công');
	</script>
	<%
	session.removeAttribute("Add");
	}
	%>

	<%
	if ((String) session.getAttribute("Add") == "Faill") {
	%>
	<script>
		swal('Thêm thất bại');
	</script>
	<%
	session.removeAttribute("Add");
	}
	%>
	<%
	if ((String) session.getAttribute("error") == "error") {
	%>
	<script>
		swal('Laptop này đã có');
	</script>
	<%
	session.removeAttribute("error");
	}
	%>

	<%
	if ((String) session.getAttribute("Delete") == "Success") {
	%>
	<script>
		swal('Xóa dữ liệu thành công');
	</script>
	<%
	session.removeAttribute("Delete");
	}
	%>

	<%
	if ((String) session.getAttribute("Delete") == "Faill") {
	%>
	<script>
		swal('Laptop này đang có hóa đơn mua hàng');
	</script>
	<%
	session.removeAttribute("Delete");
	}
	%>

	<script>
    function Delete(id) {
    	swal({
  		  title: "Bạn có chắc chắn muốn xóa dữ liệu?",
  		  text: "Sau khi xóa, bạn sẽ không thể phục hồi dữ liệu này!",
  		  type: 'warning',
  		  showCancelButton: true,
  		  confirmButtonColor: '#3085d6',
  		  cancelButtonColor: '#d33',
  		  confirmButtonText: 'Yes'
  		}).then((result) => {
  		  if (result.value) {
  			  window.location.href = "delete?id=" + id;
  		  } else {
  			  swal("Dữ liệu của bạn không thay đổi!");
  		  }
  		});
    }
  </script>
</body>
</html>
