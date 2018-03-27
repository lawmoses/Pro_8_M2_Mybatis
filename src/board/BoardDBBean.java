package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.net.aso.p;


//?? import oracle.net.aso.p;

//db에 넣어주기만 하는 프로그램. 모든 유저가 글쓰기시 새로 인스턴스를 생성할 필요가 없음.
//싱글턴방식
public class BoardDBBean {
	
	// (1)싱글턴 패턴 -> 종이를 뽑을 때 프린터기를 여러개 만드는게 아니라 프린터기 하나를 만들어놓고 종이를 여러장 뽑는다.
	//싱글턴
		//(구글) 자바빈 인스턴스 객체를 새로 생성해 주고 있다.
		//(구글) 메서드를 통해서 값을 수정할 것임.
	private static BoardDBBean instance = new BoardDBBean();
	private BoardDBBean() {
		//외부에서 생성할 수 없도록 생성자 private로 막아놓음
	}
	public static BoardDBBean getInstance() {
		return instance;//instance객체의 주소 반환
	}
	
	
	
	//(1)커넥션 연결
	//getConnection메서드 > connection객체를 이 객체에서 만든 다는 것
	//연결시켜주는 커넥션 메소드
		//(구글) 커넥션 풀 설정
	public static Connection getConnection() {
		Connection con = null;
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbId = "scott";
			String dbPass = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass); //드라이버 로드.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	

	//(2)커넥션해제
	//커넥션 닫는 메서드
	public void close(Connection con, ResultSet rs, PreparedStatement pstmt) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException ex) {
				}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {
				}
		if (con != null)
			try {
				con.close();
			} catch (SQLException ex) {
				}
	}
	

	
	
	// (3)게시물 추가하는 메소드 -> 오라클 db에 게시물을 넣는 메소드
	//게시글 추가 메소드
	//(구글) writerPro.jsp : 입력처리에 사용할 메서드
	public void insertArticle(BoardDataBean article) { // ?? (BoardDataBean article)
		//db 데이터 삽입 메서드
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = ""; //(궁금증) 왜 "" 인가? null이 아니고, SQL문이니까?
		int number = 0;
		try {
			//serial number 진행시키기 위한 sql문 <-num컬럼
			//(구글) 오라클 수행하여 값 찾음
			pstmt = con.prepareStatement("select boardser.nextval " + "from dual");
			/*
			 ========================================================================
			sequence의 종류와 구조 및 값을 알고자 할때
			========================================================================
			CASE1: sysdba 계정에서
			conn /as sysdba
			col sequence_name format a10;
			col cache_size format 999;
			col last_number format 999;
			select sequence_name, min_value, max_value, increment_by, cache_size, last_number from dba_sequences where sequence_owner='SCOTT';

			CASE2: scott 계정
			conn scott/tiger
			select friend_seq.nextval from dual; -- 다음 sequence의 값
			select friend_seq.currval from dual; -- 현재 sequence의 값

			select member_seq.nextval from dual; -- 다음 sequence의 값
			select member_seq.currval from dual; -- 현재 sequence의 값

			========================================================================
			★ 유의할 사항은
			 - 시퀀스명.Nextval 하면 전에 값으로 되돌릴수 없습니다.
			                       └> 해결책: 삭제하고 다시 만들어줘야 함!
			출처: http://annehouse.tistory.com/163 [초록지붕의 앤]
			 */
			
			//(구글)값을 찾아서 수행
			rs = pstmt.executeQuery();
			//executeQuery 메쏘드는 하나의 result set을 만드는 SQL문들에서 사용된다.
			//예를들어, executeQuery 메쏘드는 ResultSet 객체를 리턴한다. 
			if (rs.next())
				//(구글) 게시물 번호
				number = rs.getInt(1)+1;
			//커런트 발로 했다가 넥스트 발로 해야하기 때문에, 더하기 1을 안해도 된다. number=rs.getInt(1)+1; <- 이거 수정 실패했으므로 더하기 1을 하자.
			else 	
				number = 1;
			//(구글) 게시물 초기번호
			//넥스트 발에 의해서 넘버를 획득하였다.
			
		//	========================
			
			//(구글) 답변글인지 일반글인지를 구분해서 입력해주는 로직!
			//내가 답글하는 상대이다.
			int num = article.getNum();	
			int ref = article.getRef();	//글그룹화 번호
			int re_step = article.getRe_step();	//그룹내의 순서
			int re_level = article.getRe_level(); //글 제목 들여쓰기
			
			//(구글) 답글의 답글일 경우
			if (num != 0) //(num != 0) 이것은 답글인 경우이다. 
				{
				sql = "update board set re_step=re_step+1"
						+ "where ref= ? and re_step> ? and boardid = ?";
				//(구글) 오라클 수행하여 값 찾음
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.setString(3, article.getBoardid());
				pstmt.executeUpdate();	//???
				/*그러나 executeUpdate 메쏘드에서는 다르다. 
				이 메쏘드는 INSERT, UPDATE 또는 DELETE 문들, 그리고 또한 CREATE TABLE과 DROP TABLE과 같은 
				SQL DDL(Data Definition Languate)문들을 실행하는데 사용되어진다. 
				INSERT, UPDATE, DELETE 문의 결과는 테이블내의 0 이나 많은 열들내에서 하나이상의 행을 수정
				하는 것이다. 
				executeUpdate의 리턴값은 작용한 열의 개수(갱신 카운트로 간주되는)를 나타내는 정수이다. 
				즉, 그것은 새로운 테이블을 만들고, 그것이 결과이지만, 아무것도 리턴하지는 않는다. 
				이러한 경우에 executeUpdate 메쏘드는 0를 리턴한다. */
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
					//2 : 답글쓰기====================
					// (구글) 답글, 게시글이 처음인 경우
					// 이것은 새글이다. 넘버 그대로, re_step = 0; re_level = 0; 0이니까 새글
					ref = number;	//글그룹화 번호 ref
					re_step = 0;	//그룹내의 순서 re_step
					re_level = 0;	//글 제목 들여쓰기 re_level
				}
			
			//=========== 아래 수정하세요!!!!
			
			// (구글) 쿼리 작성
			// 이 부분 하기 전에 아리스텝 넘버 이런 것들이 바뀌어야한다.
			sql = "insert into board(num,writer,email,subject," + " passwd,reg_date,";
			sql += "ref,re_step,re_level,content,ip, boardid) " + "values(?,?,?,?,?,sysdate,?,?,?,?,?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getEmail());
			pstmt.setString(4, article.getSubject());
			pstmt.setString(5, article.getPasswd());
			pstmt.setInt(6, ref); //글그룹화 번호 ref
			pstmt.setInt(7, re_step);	//그룹내의 순서 re_step
			pstmt.setInt(8, re_level);	//글 제목 들여쓰기 re_level
			pstmt.setString(9, article.getContent());	//글내용 content
			pstmt.setString(10, article.getIp());
			pstmt.setString(11, article.getBoardid()); //boardid ?? 일반게시판,각종 게시판
			pstmt.executeUpdate(); //???
			/*그러나 executeUpdate 메쏘드에서는 다르다. 
			이 메쏘드는 INSERT, UPDATE 또는 DELETE 문들, 그리고 또한 CREATE TABLE과 DROP TABLE과 같은 
			SQL DDL(Data Definition Languate)문들을 실행하는데 사용되어진다. 
			INSERT, UPDATE, DELETE 문의 결과는 테이블내의 0 이나 많은 열들내에서 하나이상의 행을 수정
			하는 것이다. 
			executeUpdate의 리턴값은 작용한 열의 개수(갱신 카운트로 간주되는)를 나타내는 정수이다. 
			즉, 그것은 새로운 테이블을 만들고, 그것이 결과이지만, 아무것도 리턴하지는 않는다. 
			이러한 경우에 executeUpdate 메쏘드는 0를 리턴한다. */
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(con, rs, pstmt);
			//닫는 메서드
			//매개변수가 있어야함. 열어놓은 것들 달고 들어가야함
		}
	}
	
	
	
	// (4)전체 게시물 세는 메소드
	//화요일 게시글 카운팅 메소드
	//(구글)list.jsp : 페이징(총 게시물)을 위해서 전체 DB에 입력된 행의 수가 필요!
	public int getArticleCount(String boardid) {
		int x = 0;
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select nvl(count(*),0) " + "from board where boardid = ?";//* 안들어감1
		int number = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardid);
			rs = pstmt.executeQuery();
			//executeQuery 메쏘드는 하나의 result set을 만드는 SQL문들에서 사용된다.
			//예를들어, executeQuery 메쏘드는 ResultSet 객체를 리턴한다.
			if (rs.next()) {
				x = rs.getInt(1); // nvl(count(*),0) 를 x에 넣어주는 것.
				// rs 즉 결과가 있다면 x=rs.getInt(1) :  첫 번째 결과 값을 int형으로 x에 집어 넣으란 소리
				//<질문>
				/*Statement stmt0= Conn.createStatement();
				ResultSet rs0=stmt0.executeQuery("select max(b_id) from khboard");
				        if(rs0.next()) {
				                int datacount=rs0.getInt(1);     //총 글 수
				                int pagecount=datacount/10;   //총 페이지수
				                int remcount=datacount%10;   //마지막 페이지글수
				 */
				//<답변>
				/*초보신것 같아서 풀어서 말씀드릴께요.. 

				getInt(1)을 getInt("max(b_id)") 으로 보시면 됩니다. 
				b_id가 숫자로 구성된 컬럼이라면 getInt(1)는 해당 컬럼의 가장 높은 값을 int 형으로 가져옵니다.문자로 구성된 컬럼이라면 에러 나겠죠.^^ 

				etc) 
				보통 알리아스를 사용하여 쓰는데 
				select max(b_id) as cnt from khboard 
				getInt("cnt")로 쉽게 사용하셔도 됩니다. 
				getInt(1) 에서 숫자는 1은 select문에서 첫번째 항목 cnt를 가져오라는 의미 입니다*/
			}
		} catch (Exception e) {
			e.printStackTrace();	////에러 메시지의 발생근원지를 찾아서 단계별로 에러 출력
		} finally {
			close(con, rs, pstmt);
		}
		return x;
	}
	

	//(5)리스트 뽑아내는 메소드  ! 다소 어려울수있으나 중요!
	//게시글 가져오는 메소드
	//(구글) list.jsp ==> paging! DB로부터 여러 행을 결과로 받는다.
	public List getArticles(int startRow, int endRow, String boardid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = " select * from "
					+ "( select rownum rnum ,a.* "
					+ " from (select num,writer,email,subject,passwd,"
					+ "reg_date,readcount,ref,re_step,re_level,content,"
					+ "ip from board where boardid = ? order by ref desc , re_step) " // 1.?
					+ "	a ) where rnum  between ? and ?  ";	// 2.? and 3.?
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardid);
			pstmt.setInt(2, startRow);	//?? list페이지에 있다. 여기서만 적용된다.
			pstmt.setInt(3, endRow);	//??
			rs = pstmt.executeQuery();	//(구글)값을 찾아서 수행
			//executeQuery 메쏘드는 하나의 result set을 만드는 SQL문들에서 사용된다.
			//예를들어, executeQuery 메쏘드는 ResultSet 객체를 리턴한다.
			if (rs.next()) {
							articleList = new ArrayList();
							do {
								BoardDataBean article = new BoardDataBean(); //어떻게 아래 set으로 해준 데이터들이 들어가는가? DB라서??
								article.setNum(rs.getInt("num"));
								article.setWriter(rs.getString("writer"));
								article.setEmail(rs.getString("email"));
								article.setSubject(rs.getString("subject"));
								article.setPasswd(rs.getString("passwd")); //주의 : getString
								article.setReg_date(rs.getTimestamp("reg_date")); //주의: getTimestamp
								article.setReadcount(rs.getInt("readcount"));
								article.setRef(rs.getInt("ref"));
								article.setRe_step(rs.getInt("re_step"));
								article.setRe_level(rs.getInt("re_level"));
								article.setContent(rs.getString("content"));
								article.setIp(rs.getString("ip"));
								//데이터 넣는다
								articleList.add(article);
							} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(conn, rs, pstmt);
		}
		return articleList;
	}
	
	
	// (6)게시물 뽑아내는 메소드
	public BoardDataBean getArticle(int num , String boardid, String chk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;	
		String sql="";
		try {
			conn = getConnection();
			if(chk.equals("content")) {	//?? 어떤의미인가??
			sql="update board set readcount=readcount+1 "
					+ "where num = ? and boardid = ?";
			//게시글 볼 떄 마다 리드카운트 증가
			//수정-업데이트 할 땐ㄴ
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardid);
			pstmt.executeUpdate();
			 /* pstmt.executeUpdate();리턴결과는 
			 (1) INSERT, DELETE, UPDATE된 행의 수
			 (2) 아무 리턴이 없으면 0*/
			}	
			
			sql="select * from board where num = ? and boardid = ?";
			pstmt = conn.prepareStatement(sql);
			//맵핑하기 전에 sql을 수정해야한다.
			pstmt.setInt(1, num);
			pstmt.setString(2, boardid);
			rs=pstmt.executeQuery();
			//executeQuery 메쏘드는 하나의 result set을 만드는 SQL문들에서 사용된다.
			//예를들어, executeQuery 메쏘드는 ResultSet 객체를 리턴한다.
			if(rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));			
				}	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {	
				close(conn, rs, pstmt);	
			}
		  return article;	
		 }
	

	
	//(7) 게시물 수정하는 메소드
	//(구글) updatePro.jsp : 실제 데이터를 수정하는 메소드
	public int updateArticle(BoardDataBean article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int chk = 0;
		//이거는 선생님 코드에 없는데?
		try {
				conn = getConnection();
				String sql = "update board set writer=?,email=?,"
							+ " subject=? ,content=? where num=? and passwd = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, article.getWriter());
				pstmt.setString(2, article.getEmail());
				pstmt.setString(3, article.getSubject());
				pstmt.setString(4, article.getContent());
				pstmt.setInt(5, article.getNum());
				pstmt.setString(6, article.getPasswd());
				chk= pstmt.executeUpdate();//이게 뭐지??
				 /* pstmt.executeUpdate();리턴결과는 
				 (1) INSERT, DELETE, UPDATE된 행의 수
				 (2) 아무 리턴이 없으면 0*/
		}catch (Exception e) {
			e.printStackTrace();
		} finally {	
			close(conn, null, pstmt);	
		}
		  return chk;	
		//chk가 1이면 0이면?? 업데이트 된 숫자가 리턴된다. updatePro 로 가자.
	}
	
		
	//(8) 게시물 삭제하는 메소드
	// (구글) deletPro.jsp : 실제 데이터를 삭제하는 메소드
	public int deleteArticle(int num, String passwd, String boardid) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="delete from board where num=? " + " and passwd = ?";
		int x = -1;
		try {	
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, passwd);
				x=pstmt.executeUpdate();
				/* pstmt.executeUpdate();리턴결과는 
				 (1) INSERT, DELETE, UPDATE된 행의 수
				 (2) 아무 리턴이 없으면 0*/
				//executeUpdate의 리턴값은 작용한 열의 개수(갱신 카운트로 간주되는)를 나타내는 정수이다.
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {	
			close(conn, rs, pstmt);
		}		
		return x;	
	}	
	
}
