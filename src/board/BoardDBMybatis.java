package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class BoardDBMybatis extends MybatisConnector {

	private final String namespace = "ldg.mybatis"; //���� �ش�Ǵ� ���̵� �׷��εȴ�??
	
	//BoardDBMybatis �̱��� ����� ������ ����Ʈ �׼ǿ� �������ֱ� ����
	private static BoardDBMybatis instance = new BoardDBMybatis();
	private BoardDBMybatis() {}
	public static BoardDBMybatis getInstance() {
		return instance;
	}
	
	SqlSession sqlSession; //������????
	
	public int getArticleCount(String boardid) {
		int x = 0;
		sqlSession = sqlSession();
		System.out.println(sqlSession);
		Map<String, String> map = new HashMap<String, String>(); //�Ķ���� ������ map���� �Ѵ�.
		map.put("boardid", boardid);
		x = sqlSession.selectOne(namespace + ".getArticleCount", map); //�Ķ���Ϳ� ����id�� �����Ƿ� �������� �߰�, map�߰�
			//�� ������Ʈ?? ��? .��� ���̳�? //xml�� �پ�ƼŬī��Ʈ �θ���. �տ� ���ӽ����̽����־���Ѵ�.
		sqlSession.close();
		return x;
	}

	
	
	public List getArticles(int startRow, int endRow, String boardid) {
		
		sqlSession = sqlSession();
		Map map = new HashMap(); //�Ķ���� ������ map���� �Ѵ�.
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("boardid", boardid);
		
		//List�� ���������Ѵ�.
		List li = sqlSession.selectList(namespace + ".getArticles", map); 
		//�Ķ���Ϳ� ����id�� �����Ƿ� �������� �߰�, map�߰�
		// �� ������Ʈ? ����Ʈ? ���ؾȵ�
		//�� ������Ʈ?? ��? .��� ���̳�? //xml�� �پ�ƼŬī��Ʈ �θ���. �տ� ���ӽ����̽����־���Ѵ�.
		//������ ����Ʈ���ǿ��� �Ѵ�.
		sqlSession.close();
		return li;
	}
	
	
	public void insertArticle(BoardDataBean article) {								//??BoardDataBean article
		
		sqlSession = sqlSession();
		//article�� ������Ʈ�ϱ� ������ ó�� ���� �ʿ����.
		int number = sqlSession.selectOne(namespace +".getNextNumber", article);
		//��ȣǥ �޴� ������ ��ũ ��Ŵ

		//getNum=0�̶�� ����? ������?
		if (article.getNum()!=0) {
			//��۾��� �κа� ��ũ �� ����
			sqlSession.update(namespace +".updateRe_step", article); //update�� ���� ������ ������ �ƴϰ�, ���� ref...restep�� ������ ���̴�.
			//?? ����ǰ �ֹ�,��ǰ ���� ���
			article.setRe_level(article.getRe_level()+1);
			article.setRe_step(article.getRe_step()+1);
			//������� ��ۺκ��̴�
		} else {
			//���۾��� �κ�
			//������ ���̷����� ��, ���̽��ܵ� 0�̴�.
			article.setRef(number); //�����̴ϱ� ����  number���� ������, ref�� number���� �Ѱ�. ������ ��� ref�� number�� ���� ��ȣ�̴�
			article.setRe_level(0);
			article.setRe_step(0);
		}	
		article.setNum(number);
		
		sqlSession.insert(namespace+".insertBoard",article);
		sqlSession.commit();
		sqlSession.close();	
	}
	
	
	public BoardDataBean getArticle //�Խù� ���� ����Ʈ�̸�, readcount �ϰ�, 
		(int num , String boardid, String chk) { //chk�� ����Ʈ�϶��� ����ī��Ʈ �߰��ؾ��ϰ�, �� �ܿ��Ŵ� ����ī��Ʈ �߰�.(�Խø� ��� �ô°�)
	
		/*sql="update board set readcount=readcount+1 "
				+ "where num = ? and boardid = ?";
	
		sql="select * from board where num = ? and boardid = ?";*/
	
		sqlSession = sqlSession();
		Map map = new HashMap(); //�Ķ���� ������ map���� �Ѵ�.
		map.put("num", num);	//num�� �ǹ� - ������̵�� ������� �����̸Ӹ� Ű�̴�
		map.put("boardid", boardid);
		//chk�� ����Ʈ�϶��� ����ī��Ʈ �߰��ؾ��ϰ�, �� �ܿ��Ŵ� ����ī��Ʈ �߰�.(�Խø� ��� �ô°�)
		if (chk.equals("content")) {										//??"content"
			sqlSession.update(namespace + ".addReadCount", map);
		}
		
		//List�� ���������Ѵ�.
		BoardDataBean article = sqlSession.selectOne(namespace + ".getArticle", map); 
		//�Ķ���Ϳ� ����id�� �����Ƿ� �������� �߰�, map�߰�
		// �� ������Ʈ? ����Ʈ? ���ؾȵ�
		//�� ������Ʈ?? ��? .��� ���̳�? //xml�� �پ�ƼŬī��Ʈ �θ���. �տ� ���ӽ����̽����־���Ѵ�.
		//������ ����Ʈ���ǿ��� �Ѵ�.
		sqlSession.commit();
		sqlSession.close();
		return article;	
	}
	
	
	
	public int updateArticle(BoardDataBean article) {
		//update�Ҷ��� ����ƮŸ�� ���� �ȵ�. ���� ��������. �ֳ��ϸ�, ����Ŭ������ DML�� �����ϸ� ����Ŭ ��ü������ DMLī���͸� �÷��ش�. ����Ŭ���� �ƿ� �÷��ش�.
		//�׷��� update, insert, delete�� ����Ʈ Ÿ���� ���� �ȵ�. �÷��ֱ� ������.
		//������ ������Ʈ,����Ʈ,���� �Ŀ��� �����ͺ��̽����� �˾Ƽ� ���� �������ش�.
		//������ Ÿ���� �ؽ������� ���� ������ ������ ������ �Ǵ� ���̴�.
		//String sql = "update board set writer=?,email=?, subject=? ,content=? where num=? and passwd = ?";
		
		sqlSession = sqlSession();
		//List�� ���������Ѵ�.
		int chk = sqlSession.update(namespace + ".updateArticle", article); 
		//�Ķ���Ϳ� ����id�� �����Ƿ� �������� �߰�, map�߰�
		// �� ������Ʈ? ����Ʈ? ���ؾȵ�
		//�� ������Ʈ?? ��? .��� ���̳�? //xml�� �پ�ƼŬī��Ʈ �θ���. �տ� ���ӽ����̽����־���Ѵ�.
		//������ ����Ʈ���ǿ��� �Ѵ�.
		sqlSession.commit();
		sqlSession.close();
		return chk;	
			
	}
	
	
	public int deleteArticle(int num, String passwd, 
			String boardid) throws Exception {
	
		sqlSession = sqlSession();												//??sqlSession
		Map map = new HashMap(); //�Ķ���� ������ map���� �Ѵ�.
		map.put("num", num);	//num�� �ǹ� - ������̵�� ������� �����̸Ӹ� Ű�̴�
		map.put("passwd", passwd);
		map.put("boardid", boardid);
		//List�� ���������Ѵ�.
		int chk = sqlSession.delete(namespace + ".deleteArticle", map); 		//??����Ŵ� updata ����Ŵ�delete
		//�Ķ���Ϳ� ����id�� �����Ƿ� �������� �߰�, map�߰�
		// �� ������Ʈ? ����Ʈ? ���ؾȵ�
		//�� ������Ʈ?? ��? .��� ���̳�? //xml�� �پ�ƼŬī��Ʈ �θ���. �տ� ���ӽ����̽����־���Ѵ�.
		//������ ����Ʈ���ǿ��� �Ѵ�.
		sqlSession.commit();
		sqlSession.close();
		return chk;	

	}
}
	
	

//------------������ ������

//select boardser.nextval from dual

		//update board set re_step=re_step+1
		// where ref= ? and re_step> ? and boardid = ?
		
		/*insert into board(num,writer,email,subject,
				 passwd,reg_date,
		ref,re_step,re_level,content,ip, boardid, filename, filesize)
				values(?,?,?,?,?,sysdate,?,?,?,?,?, ?, ?, ?)	*/
