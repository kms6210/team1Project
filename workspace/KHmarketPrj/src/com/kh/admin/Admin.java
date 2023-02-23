package com.kh.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.auction.Auction;
import com.kh.main.Main;

import com.kh.user.UserData;
import com.kh.user.UserInput;

// 테이블 : 유저, 상품, 제재 내역, 품질 검증, 계좌, Q&A, 공지사항

public class Admin {
	AdminTemp adminTemp = new AdminTemp();

	public void adminlogin(Connection conn) throws Exception {
		//관리자 로그인
		//데이터 입력받기
		String sql = "SELECT * FROM K_ADMIN WHERE UPPER(ID) = UPPER( ? ) AND PWD = ? AND KEY = ? AND QUIT_YN ='N' ";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		System.out.println("\n관리자 로그인");
		
		System.out.print("ID 입력 :");
		String id = Main.SC.nextLine();

		System.out.print("PWD 입력 :");
		String pwd = Main.SC.nextLine();

		System.out.print("KEY 입력 :");
		String key = Main.SC.nextLine();

		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, key);

		ResultSet rs = pstmt.executeQuery();

		if(rs.next()) {
			System.out.println("관리자 로그인 완료");
			Main.login_admin_no = rs.getInt("ADMIN_NO");
		}else {
			System.out.println("로그인 실패..");
		}
	}

	// 회원 목록 조회
	public void showUserList(Connection conn) throws Exception {

		String sql = "SELECT * FROM K_USER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			 String userNo= rs.getString("USER_NO");
			 String id = rs.getString("ID");
			 String pwd = rs.getString("PWD");
			 String nick = rs.getString("NICK");
			 String phoneNo = rs.getString("PHONE_NO");
			 String trustLevel = rs.getString("TRUST_LEVEL");
			 String address = rs.getString("ADDRESS");
			 String balance = rs.getString("BALANCE");
			 String questionNo = rs.getString("QUESTION_NO");
			 String answer = rs.getString("ANSWER");
			 String userStatus = rs.getString("USER_STATUS");
			 String signDate = rs.getString("SIGN_DATE");

			System.out.println("--------------------------------------------------------회원 목록------------------------------------------------------------------------");
			System.out.println(userNo+"|"+id+"|"+pwd+"|"+nick+"|"+phoneNo+"|"+trustLevel+"|"+address+"|"+balance+"|"+questionNo+"|"+answer+"|"+userStatus+"|"+signDate);
		}
	}

public void deleteItem(Connection conn) throws Exception {
	// 상품 거래 상태
	String sql = "UPDATE ITEM SET TRADE_STATUS =? WHERE ITEM_NO =? ";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	System.out.print("상품 번호를 입력 하세요");
	String itemNo = Main.SC.nextLine();

	System.out.print("거래 상태 (D / N):");
	String tradeStatus = Main.SC.nextLine();

	pstmt.setString(1, tradeStatus);
	pstmt.setString(2, itemNo);

	int result = pstmt.executeUpdate();

	if (result ==1) {
		System.out.println(itemNo+"번 상품이 거래 완료 처리 되었습니다");
	}else {
		System.out.println("실패..");
	}
}

public void banId(Connection conn) throws Exception {
	// 계정 정지하기 (ex. 7일 / 30일 / 1년 / 영구 ...)
	String sql = "UPDATE BANNED SET STOP_REASON = ? WHERE USER_NO =?";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	System.out.print("정지할 유저 번호 :");
	String userNo = Main.SC.nextLine();

	System.out.print("정지 사유 :");
	String stopReason = Main.SC.nextLine();

	pstmt.setString(1, stopReason);
	pstmt.setString(2, userNo);

	int result = pstmt.executeUpdate();
	if(result ==1) {
		System.out.println(userNo+"번 유저가"+stopReason+"의 사유로 정지 되었습니다.");
	}else {
		System.out.println("실패");
	}

}

public void judgeQuality(Connection conn) throws Exception {
	// 품질 판정 전에 아이템, 가격, 유저번호 보여주기   (상품이랑 품질 테이블이랑 join 후 가격 상품번호 유저번호 select)
	adminTemp.showItmeList(conn);
	
	// 품질 판정하기
	String sql = "UPDATE QUALITY SET GRADE  = ?   WHERE ITEM_NO= ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	System.out.print("상품 번호: ");
	String itemNo = Main.SC.nextLine();

	System.out.print(itemNo +" 번 상품 등급 점수: ");
	String grade = Main.SC.nextLine();

	pstmt.setString(1, grade);
	pstmt.setString(2, itemNo);
	int result =pstmt.executeUpdate();

	if(result ==1) {
		System.out.println(itemNo+"번 상품 등급 판정 완료");
	}else {
		System.out.println("실패...");
	}
}


public void updateAdminBalance(Connection conn) throws Exception {
	//3.updateAdminBalance (유저번호 가격 밸런스)
	adminTemp.showItmeList(conn); // 상품 가격 먼저 보여준후

	String sql = "UPDATE K_ADMIN SET BALANCE = ? WHERE ADMIN_NO =1";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	System.out.print("등급 판정이 완료된 상품 가격의 10% 수수료 차감: ");
	int balance = Main.integerParseInt(); 
	
	pstmt.setInt(1, balance);
	
	int result = pstmt.executeUpdate();
	
	if(result ==1) {
		System.out.println("관리자의 잔고에"+balance+"원이 입금되었습니다");
		adminTemp.adminBalanceList(conn);
		
	}else {
		System.out.println("실패..");
	}
	
	
}

public void answerQuestion(Connection conn) throws Exception {
	//질문 목록 보여주기
	adminTemp.showQuestionList(conn);

	// 답변하기
	String sql = "UPDATE QNA SET ANSWER  =? WHERE QUESTION_NO = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	System.out.print("질문 번호 : ");
	String questionNo = Main.SC.nextLine();

	System.out.print("답변 : ");
	String answer = Main.SC.nextLine();

	pstmt.setString(1,answer);
	pstmt.setString(2,questionNo);

	int result = pstmt.executeUpdate();

	if(result ==1) {
		System.out.println("답변 작성 완료");
	}else {
		System.out.println("답변 작성 실패..");
	}

}

public void writePublic(Connection conn) throws Exception {
	// 공지사항 작성하기
	String sql = "INSERT INTO NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) VALUES(SEQ_PUBLIC_NO.NEXTVAL,?,?,SYSDATE)";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	System.out.print("제목을 입력하세요 : ");
	String title = Main.SC.nextLine();

	System.out.print("내용을 입력하세요 : ");
	String content = Main.SC.nextLine();

	pstmt.setString(1, title);
	pstmt.setString(2, content);

	int result = pstmt.executeUpdate();

	if(result ==1) {
		System.out.println("공지사항 작성 완료");
}else {
	System.out.println("공지사항 작성 실패");
}
}

public void deletePublic(Connection conn) throws Exception {
	// 공지사항 삭제하기
	String sql = "UPDATE NOTICE SET QUIT_YN =? WHERE PUBLIC_NO =? ";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	System.out.print("삭제할 공지사항 번호 선택 :");
	String publicNo = Main.SC.nextLine();

	System.out.print("삭제 하시겠습니까? (Y / N) :");
	String quitYn = Main.SC.nextLine();

	pstmt.setString(1, quitYn);
	pstmt.setString(2, publicNo);

	int result = pstmt.executeUpdate();

	if(result ==1) {
		System.out.println(publicNo + "번 공지사항 삭제완료");
	}else {
		System.out.println("삭제실패..");
	}
}

public void showFaqList (Connection conn) throws Exception {
	//자주묻는 질문 추가
	String sql = "UPDATE FAQ SET QUESTION = ? ,ANSWER =? WHERE QUESTION_NO = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	System.out.print("질문 등록 번호: ");
	String questionNo = Main.SC.nextLine();

	System.out.print("자주묻는 질문 : ");
	String question = Main.SC.nextLine();

	System.out.print("답변 : ");
	String answer = Main.SC.nextLine();

	pstmt.setString(1, question);
	pstmt.setString(2, answer);
	pstmt.setString(3, questionNo);

	int result = pstmt.executeUpdate();

	if(result ==1) {
		System.out.println("자주묻는 질문 등록 완료.");
	} else {
		System.out.println("실패...");
	}
}
}