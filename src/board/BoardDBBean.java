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

//db�� �־��ֱ⸸ �ϴ� ���α׷�. ��� ������ �۾���� ���� �ν��Ͻ��� ������ �ʿ䰡 ����.
//�̱��Ϲ��
public class BoardDBBean {
	
	// (1)�̱��� ���� -> ���̸� ���� �� �����ͱ⸦ ������ ����°� �ƴ϶� �����ͱ� �ϳ��� �������� ���̸� ������ �̴´�.
	//�̱���
		//(����) �ڹٺ� �ν��Ͻ� ��ü�� ���� ������ �ְ� �ִ�.
		//(����) �޼��带 ���ؼ� ���� ������ ����.
	private static BoardDBBean instance = new BoardDBBean();
	private BoardDBBean() {
		//�ܺο��� ������ �� ������ ������ private�� ���Ƴ���
	}
	public static BoardDBBean getInstance() {
		return instance;//instance��ü�� �ּ� ��ȯ
	}
	
	
	
	//(1)Ŀ�ؼ� ����
	//getConnection�޼��� > connection��ü�� �� ��ü���� ���� �ٴ� ��
	//��������ִ� Ŀ�ؼ� �޼ҵ�
		//(����) Ŀ�ؼ� Ǯ ����
	public static Connection getConnection() {
		Connection con = null;
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbId = "scott";
			String dbPass = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass); //����̹� �ε�.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	

	//(2)Ŀ�ؼ�����
	//Ŀ�ؼ� �ݴ� �޼���
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
	

	
	
	// (3)�Խù� �߰��ϴ� �޼ҵ� -> ����Ŭ db�� �Խù��� �ִ� �޼ҵ�
	//�Խñ� �߰� �޼ҵ�
	//(����) writerPro.jsp : �Է�ó���� ����� �޼���
	public void insertArticle(BoardDataBean article) { // ?? (BoardDataBean article)
		//db ������ ���� �޼���
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = ""; //(�ñ���) �� "" �ΰ�? null�� �ƴϰ�, SQL���̴ϱ�?
		int number = 0;
		try {
			//serial number �����Ű�� ���� sql�� <-num�÷�
			//(����) ����Ŭ �����Ͽ� �� ã��
			pstmt = con.prepareStatement("select boardser.nextval " + "from dual");
			/*
			 ========================================================================
			sequence�� ������ ���� �� ���� �˰��� �Ҷ�
			========================================================================
			CASE1: sysdba ��������
			conn /as sysdba
			col sequence_name format a10;
			col cache_size format 999;
			col last_number format 999;
			select sequence_name, min_value, max_value, increment_by, cache_size, last_number from dba_sequences where sequence_owner='SCOTT';

			CASE2: scott ����
			conn scott/tiger
			select friend_seq.nextval from dual; -- ���� sequence�� ��
			select friend_seq.currval from dual; -- ���� sequence�� ��

			select member_seq.nextval from dual; -- ���� sequence�� ��
			select member_seq.currval from dual; -- ���� sequence�� ��

			========================================================================
			�� ������ ������
			 - ��������.Nextval �ϸ� ���� ������ �ǵ����� �����ϴ�.
			                       ��> �ذ�å: �����ϰ� �ٽ� �������� ��!
			��ó: http://annehouse.tistory.com/163 [�ʷ������� ��]
			 */
			
			//(����)���� ã�Ƽ� ����
			rs = pstmt.executeQuery();
			//executeQuery �޽��� �ϳ��� result set�� ����� SQL���鿡�� ���ȴ�.
			//�������, executeQuery �޽��� ResultSet ��ü�� �����Ѵ�. 
			if (rs.next())
				//(����) �Խù� ��ȣ
				number = rs.getInt(1)+1;
			//Ŀ��Ʈ �߷� �ߴٰ� �ؽ�Ʈ �߷� �ؾ��ϱ� ������, ���ϱ� 1�� ���ص� �ȴ�. number=rs.getInt(1)+1; <- �̰� ���� ���������Ƿ� ���ϱ� 1�� ����.
			else 	
				number = 1;
			//(����) �Խù� �ʱ��ȣ
			//�ؽ�Ʈ �߿� ���ؼ� �ѹ��� ȹ���Ͽ���.
			
		//	========================
			
			//(����) �亯������ �Ϲݱ������� �����ؼ� �Է����ִ� ����!
			//���� ����ϴ� ����̴�.
			int num = article.getNum();	
			int ref = article.getRef();	//�۱׷�ȭ ��ȣ
			int re_step = article.getRe_step();	//�׷쳻�� ����
			int re_level = article.getRe_level(); //�� ���� �鿩����
			
			//(����) ����� ����� ���
			if (num != 0) //(num != 0) �̰��� ����� ����̴�. 
				{
				sql = "update board set re_step=re_step+1"
						+ "where ref= ? and re_step> ? and boardid = ?";
				//(����) ����Ŭ �����Ͽ� �� ã��
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.setString(3, article.getBoardid());
				pstmt.executeUpdate();	//???
				/*�׷��� executeUpdate �޽�忡���� �ٸ���. 
				�� �޽��� INSERT, UPDATE �Ǵ� DELETE ����, �׸��� ���� CREATE TABLE�� DROP TABLE�� ���� 
				SQL DDL(Data Definition Languate)������ �����ϴµ� ���Ǿ�����. 
				INSERT, UPDATE, DELETE ���� ����� ���̺��� 0 �̳� ���� ���鳻���� �ϳ��̻��� ���� ����
				�ϴ� ���̴�. 
				executeUpdate�� ���ϰ��� �ۿ��� ���� ����(���� ī��Ʈ�� ���ֵǴ�)�� ��Ÿ���� �����̴�. 
				��, �װ��� ���ο� ���̺��� �����, �װ��� ���������, �ƹ��͵� ���������� �ʴ´�. 
				�̷��� ��쿡 executeUpdate �޽��� 0�� �����Ѵ�. */
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
					//2 : ��۾���====================
					// (����) ���, �Խñ��� ó���� ���
					// �̰��� �����̴�. �ѹ� �״��, re_step = 0; re_level = 0; 0�̴ϱ� ����
					ref = number;	//�۱׷�ȭ ��ȣ ref
					re_step = 0;	//�׷쳻�� ���� re_step
					re_level = 0;	//�� ���� �鿩���� re_level
				}
			
			//=========== �Ʒ� �����ϼ���!!!!
			
			// (����) ���� �ۼ�
			// �� �κ� �ϱ� ���� �Ƹ����� �ѹ� �̷� �͵��� �ٲ����Ѵ�.
			sql = "insert into board(num,writer,email,subject," + " passwd,reg_date,";
			sql += "ref,re_step,re_level,content,ip, boardid) " + "values(?,?,?,?,?,sysdate,?,?,?,?,?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getEmail());
			pstmt.setString(4, article.getSubject());
			pstmt.setString(5, article.getPasswd());
			pstmt.setInt(6, ref); //�۱׷�ȭ ��ȣ ref
			pstmt.setInt(7, re_step);	//�׷쳻�� ���� re_step
			pstmt.setInt(8, re_level);	//�� ���� �鿩���� re_level
			pstmt.setString(9, article.getContent());	//�۳��� content
			pstmt.setString(10, article.getIp());
			pstmt.setString(11, article.getBoardid()); //boardid ?? �ϹݰԽ���,���� �Խ���
			pstmt.executeUpdate(); //???
			/*�׷��� executeUpdate �޽�忡���� �ٸ���. 
			�� �޽��� INSERT, UPDATE �Ǵ� DELETE ����, �׸��� ���� CREATE TABLE�� DROP TABLE�� ���� 
			SQL DDL(Data Definition Languate)������ �����ϴµ� ���Ǿ�����. 
			INSERT, UPDATE, DELETE ���� ����� ���̺��� 0 �̳� ���� ���鳻���� �ϳ��̻��� ���� ����
			�ϴ� ���̴�. 
			executeUpdate�� ���ϰ��� �ۿ��� ���� ����(���� ī��Ʈ�� ���ֵǴ�)�� ��Ÿ���� �����̴�. 
			��, �װ��� ���ο� ���̺��� �����, �װ��� ���������, �ƹ��͵� ���������� �ʴ´�. 
			�̷��� ��쿡 executeUpdate �޽��� 0�� �����Ѵ�. */
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(con, rs, pstmt);
			//�ݴ� �޼���
			//�Ű������� �־����. ������� �͵� �ް� ������
		}
	}
	
	
	
	// (4)��ü �Խù� ���� �޼ҵ�
	//ȭ���� �Խñ� ī���� �޼ҵ�
	//(����)list.jsp : ����¡(�� �Խù�)�� ���ؼ� ��ü DB�� �Էµ� ���� ���� �ʿ�!
	public int getArticleCount(String boardid) {
		int x = 0;
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select nvl(count(*),0) " + "from board where boardid = ?";//* �ȵ�1
		int number = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardid);
			rs = pstmt.executeQuery();
			//executeQuery �޽��� �ϳ��� result set�� ����� SQL���鿡�� ���ȴ�.
			//�������, executeQuery �޽��� ResultSet ��ü�� �����Ѵ�.
			if (rs.next()) {
				x = rs.getInt(1); // nvl(count(*),0) �� x�� �־��ִ� ��.
				// rs �� ����� �ִٸ� x=rs.getInt(1) :  ù ��° ��� ���� int������ x�� ���� ������ �Ҹ�
				//<����>
				/*Statement stmt0= Conn.createStatement();
				ResultSet rs0=stmt0.executeQuery("select max(b_id) from khboard");
				        if(rs0.next()) {
				                int datacount=rs0.getInt(1);     //�� �� ��
				                int pagecount=datacount/10;   //�� ��������
				                int remcount=datacount%10;   //������ �������ۼ�
				 */
				//<�亯>
				/*�ʺ��Ű� ���Ƽ� Ǯ� �����帱����.. 

				getInt(1)�� getInt("max(b_id)") ���� ���ø� �˴ϴ�. 
				b_id�� ���ڷ� ������ �÷��̶�� getInt(1)�� �ش� �÷��� ���� ���� ���� int ������ �����ɴϴ�.���ڷ� ������ �÷��̶�� ���� ������.^^ 

				etc) 
				���� �˸��ƽ��� ����Ͽ� ���µ� 
				select max(b_id) as cnt from khboard 
				getInt("cnt")�� ���� ����ϼŵ� �˴ϴ�. 
				getInt(1) ���� ���ڴ� 1�� select������ ù��° �׸� cnt�� ��������� �ǹ� �Դϴ�*/
			}
		} catch (Exception e) {
			e.printStackTrace();	////���� �޽����� �߻��ٿ����� ã�Ƽ� �ܰ躰�� ���� ���
		} finally {
			close(con, rs, pstmt);
		}
		return x;
	}
	

	//(5)����Ʈ �̾Ƴ��� �޼ҵ�  ! �ټ� ������������ �߿�!
	//�Խñ� �������� �޼ҵ�
	//(����) list.jsp ==> paging! DB�κ��� ���� ���� ����� �޴´�.
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
			pstmt.setInt(2, startRow);	//?? list�������� �ִ�. ���⼭�� ����ȴ�.
			pstmt.setInt(3, endRow);	//??
			rs = pstmt.executeQuery();	//(����)���� ã�Ƽ� ����
			//executeQuery �޽��� �ϳ��� result set�� ����� SQL���鿡�� ���ȴ�.
			//�������, executeQuery �޽��� ResultSet ��ü�� �����Ѵ�.
			if (rs.next()) {
							articleList = new ArrayList();
							do {
								BoardDataBean article = new BoardDataBean(); //��� �Ʒ� set���� ���� �����͵��� ���°�? DB��??
								article.setNum(rs.getInt("num"));
								article.setWriter(rs.getString("writer"));
								article.setEmail(rs.getString("email"));
								article.setSubject(rs.getString("subject"));
								article.setPasswd(rs.getString("passwd")); //���� : getString
								article.setReg_date(rs.getTimestamp("reg_date")); //����: getTimestamp
								article.setReadcount(rs.getInt("readcount"));
								article.setRef(rs.getInt("ref"));
								article.setRe_step(rs.getInt("re_step"));
								article.setRe_level(rs.getInt("re_level"));
								article.setContent(rs.getString("content"));
								article.setIp(rs.getString("ip"));
								//������ �ִ´�
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
	
	
	// (6)�Խù� �̾Ƴ��� �޼ҵ�
	public BoardDataBean getArticle(int num , String boardid, String chk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;	
		String sql="";
		try {
			conn = getConnection();
			if(chk.equals("content")) {	//?? ��ǹ��ΰ�??
			sql="update board set readcount=readcount+1 "
					+ "where num = ? and boardid = ?";
			//�Խñ� �� �� ���� ����ī��Ʈ ����
			//����-������Ʈ �� ����
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardid);
			pstmt.executeUpdate();
			 /* pstmt.executeUpdate();���ϰ���� 
			 (1) INSERT, DELETE, UPDATE�� ���� ��
			 (2) �ƹ� ������ ������ 0*/
			}	
			
			sql="select * from board where num = ? and boardid = ?";
			pstmt = conn.prepareStatement(sql);
			//�����ϱ� ���� sql�� �����ؾ��Ѵ�.
			pstmt.setInt(1, num);
			pstmt.setString(2, boardid);
			rs=pstmt.executeQuery();
			//executeQuery �޽��� �ϳ��� result set�� ����� SQL���鿡�� ���ȴ�.
			//�������, executeQuery �޽��� ResultSet ��ü�� �����Ѵ�.
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
	

	
	//(7) �Խù� �����ϴ� �޼ҵ�
	//(����) updatePro.jsp : ���� �����͸� �����ϴ� �޼ҵ�
	public int updateArticle(BoardDataBean article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int chk = 0;
		//�̰Ŵ� ������ �ڵ忡 ���µ�?
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
				chk= pstmt.executeUpdate();//�̰� ����??
				 /* pstmt.executeUpdate();���ϰ���� 
				 (1) INSERT, DELETE, UPDATE�� ���� ��
				 (2) �ƹ� ������ ������ 0*/
		}catch (Exception e) {
			e.printStackTrace();
		} finally {	
			close(conn, null, pstmt);	
		}
		  return chk;	
		//chk�� 1�̸� 0�̸�?? ������Ʈ �� ���ڰ� ���ϵȴ�. updatePro �� ����.
	}
	
		
	//(8) �Խù� �����ϴ� �޼ҵ�
	// (����) deletPro.jsp : ���� �����͸� �����ϴ� �޼ҵ�
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
				/* pstmt.executeUpdate();���ϰ���� 
				 (1) INSERT, DELETE, UPDATE�� ���� ��
				 (2) �ƹ� ������ ������ 0*/
				//executeUpdate�� ���ϰ��� �ۿ��� ���� ����(���� ī��Ʈ�� ���ֵǴ�)�� ��Ÿ���� �����̴�.
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {	
			close(conn, rs, pstmt);
		}		
		return x;	
	}	
	
}
