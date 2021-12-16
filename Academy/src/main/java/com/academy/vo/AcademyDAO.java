package com.academy.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AcademyDAO {
	InitialContext ic;
	Connection conn = null;
	PreparedStatement pstmt = null;
	// singleton
	private static AcademyDAO adao = new AcademyDAO();

	private AcademyDAO() {
	}

	public static AcademyDAO getInstance() {
		return adao; 
	}

	public Connection getConnection() throws SQLException {
		// 1.JNDL 서버 객체 생성 > 가장 최신의 connection 하는방법..****

		try {
			ic = new InitialContext();
			// 2.Lookup()
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			// 3.getConnection()
			conn = ds.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		conn.close();
		pstmt.close();
		rs.close();
	} // 연결 닫기

	public void close(Connection conn, PreparedStatement pstmt) throws SQLException {
		conn.close();
		pstmt.close();
	} // 연결 닫기

	public ArrayList<NoticeVO> selectNoticeAll() {
		ArrayList<NoticeVO> nl = new ArrayList<NoticeVO>(); 
		
		String sql = "select * from Notice";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql); 
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				nl.add(new NoticeVO(rs.getInt("boardNo"), rs.getString("userId"), 
						rs.getString("title"), rs.getString("regDate"), rs.getInt("hit")));
			}

			close(conn, pstmt, rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nl;

	}
	
	public NoticeVO selectNotice(Integer boardNo) {
		String sql = "select * from notice where boardNo=?";
		PreparedStatement pstmt;
		NoticeVO nvo = null;
		try {
			pstmt = getConnection().prepareStatement(sql);

			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				nvo = new NoticeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6));
			}
			close(conn, pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nvo;
	}
	
	public int insertUser(UserVO vo) { // 회원가입
		String sql = "insert into User(userId,userPwd,userName,email,phoneNo,subjectName,division) values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt;
		int count = 0;
		try {
			pstmt = getConnection().prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getUserPwd());
			pstmt.setString(3, vo.getUserName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhoneNo());
			pstmt.setString(6, vo.getSubjectName());
			pstmt.setInt(7, vo.getDivision());

			count = pstmt.executeUpdate();
			close(conn, pstmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;

	}

	public HashMap<String, Object> loginCheck(String userId, String userPwd) { //준호님 친구분수정
        String sql = "select userPwd,subjectName from User where userid = ?";
        PreparedStatement pstmt;
        ResultSet rs = null;
        int ok = 0;
        UserVO user =new UserVO();
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
           pstmt = getConnection().prepareStatement(sql);
           pstmt.setString(1, userId);

           rs = pstmt.executeQuery();

           if (rs.next()) {
              if (rs.getString(1).equals(userPwd)) {
                 ok = 1;
                 user.setSubjectName(rs.getString(2));
                 user.setUserId(userId);
                 map.put("key", ok);
                 map.put("user", user);
              } else if (rs.getString(1).equals(userId)) {
                 ok = 2;
                 map.put("key", ok);
                 map.put("user", null);
              }
           } else {
              ok = 3;
              map.put("key", ok);
              map.put("user", null);
           }
           close(conn, pstmt, rs);

        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
        return map;
     }

	public int writeCheck(String userId) {
		String sql = "select division from User where userid = ?";
		PreparedStatement pstmt;
		ResultSet rs = null;
		int ok = 0;
		
		try {
			pstmt = getConnection().prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if (rs.getInt(1)==1) {
					ok = 1;
				} else if (rs.getInt(1)==0) {
					ok = 0;
				}
			}
			close(conn, pstmt, rs);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ok;
	}
	
	public int insertNotice(NoticeVO vo) { // 공지사항 저장
		String sql = "insert into notice(userId,title,content) values(?,?,?)";
		PreparedStatement pstmt;
		int count = 0;
		try {
			pstmt = getConnection().prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());

			count = pstmt.executeUpdate();
			close(conn, pstmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;

	}
	
	public int updateNotice(NoticeVO vo) {
		String sql = "update Notice set title=?, content=? where boardNo=?";
		PreparedStatement pstmt;

		int num = 0;
		try {
			pstmt = getConnection().prepareStatement(sql);

			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getBoardNo());

			num = pstmt.executeUpdate();
			close(conn, pstmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	public int deleteNotice(Integer boardNo) {
		
		String sql = "delete from notice where boardNo=?";
		PreparedStatement pstmt;
		int num = 0;
		try {
			pstmt = getConnection().prepareStatement(sql);
			pstmt.setInt(1, boardNo);

			num = pstmt.executeUpdate(); 
			close(conn, pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;

	}
	public List<NoticeVO> selectBoardAll() {
	      List<NoticeVO> bvo = new ArrayList<NoticeVO>();
	      String sql = "select title, regDate from notice";
	      ResultSet rs = null;
	      try {
	         pstmt = getConnection().prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            NoticeVO nvo2 = new NoticeVO(rs.getString(1), rs.getString(2));
	            bvo.add(nvo2);
	         }
	         close(conn, pstmt,rs);
	      } catch (SQLException e) {
	         e.getMessage();
	      }
	      return bvo;
	   }

	   public int checkView(String userId,String subjectName) {
	      String sql = "select subjectName from User where userId = ?";
	      int ok=0;
	      ResultSet rs = null;
	      try {
	         pstmt = getConnection().prepareStatement(sql);
	         pstmt.setString(1, userId);
	         rs = pstmt.executeQuery(sql);
	         if (rs.next()) {
	            if(rs.getString(1).equals(subjectName)) {
	               ok=1;
	            }else {
	               ok=0;
	            }
	         }
	         close(conn, pstmt, rs);

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return ok;
	   }
	   
	   public int increaseHit(Integer boardNo) { 
			int num = 0;
			String sql = "update Notice set hit=hit+1 where boardNo=?";
			PreparedStatement pstmt;
			try {
				pstmt = getConnection().prepareStatement(sql);
				pstmt.setInt(1, boardNo);

				num = pstmt.executeUpdate();
				close(conn, pstmt);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return num;
		}
}
