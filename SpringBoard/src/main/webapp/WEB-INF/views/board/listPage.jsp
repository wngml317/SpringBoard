<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alter("처리가 완료되었습니다.");
	}
</script>
</head>
<body>
	<section class="content">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">BNO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>

						<c:forEach items="${list }" var="boardVO">
							<tr>
								<td>${boardVO.bno }</td>
								<!-- 페이지 이동을 위한 링크 처리 -->
								<!-- <td><a href='/board/read?bno=${boardVO.bno }'>${boardVO.title }</a></td> -->
								<td><a
									href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${boardVO.bno }'>
									${boardVO.title }</a></td>
								<td>${boardVO.writer }</td>
								<td><fmt:formatDate value="${boardVO.regdate }" pattern="yyyy-MM-dd HH:mm:ss" 
										 /></td>
								<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- /.box-body -->
				<!-- <div class="box-footer">Footer</div> -->
				<!-- /.box-footer -->
			</div>
		</div>
		<!-- /.col (left) -->
	</section>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="listPage?page=${pageMaker.startPage - 1 }">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
					<!-- <a href="listPage?page=${idx }">${idx }</a> -->
					<a href="listPage${pageMaker.makeQuery(idx)} ">${idx }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="listPage?page=${pageMaker.endPage +1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>