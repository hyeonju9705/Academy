package com.academy.vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AcademyDAO {
	InitialContext ic;
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	private ResultSet rs = null;
	private Statement stmt = null;
	private String sql = "";
	// singleton
	private static AcademyDAO adao = new AcademyDAO();

	private AcademyDAO() {
	}

	public static AcademyDAO getInstance() {
		return adao;
	}

	public Connection getConnection() {// DB 연결 객체 반환
		// 1.JNDL 서버 객체 생성 > 가장 최신의 connection 하는방법..****

		try {
			InitialContext ic = new InitialContext();
			// 2.Lookup()
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			// 3.getConnection()
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// 연결 닫기

//	//로그인할 때 사용하는 DB (임시)
//	public Connection getConnection2() throws SQLException {
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			conn = DriverManager.getConnection("jdbc:mysql://192.168.0.16:3306/project", "project", "1234");
//		} catch (ClassNotFoundException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		return conn;
//	}

	public void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // 연결 닫기

	public ArrayList<NoticeVO> selectNoticeAll(String subjectName) {
		ArrayList<NoticeVO> nl = new ArrayList<NoticeVO>();

		sql = "select * from Notice where subjectName= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subjectName);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				nl.add(new NoticeVO(rs.getInt("boardNo"), rs.getString("userId"), rs.getString("title"),
						rs.getString("regDate"), rs.getInt("hit")));
			}

			close(conn, pstmt, rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nl;

	}

	public NoticeVO selectNotice(Integer boardNo) {
		sql = "select * from notice where boardNo=?";
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
		sql = "insert into User(userId,userPwd,userName,email,phoneNo,subjectName,division) values(?,?,?,?,?,?,?)";
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

	public HashMap<String, Object> loginCheck(String userId, String userPwd) {
		sql = "select userPwd,subjectName from User where userid = ?";
		int ok = 0;
		UserVO user = new UserVO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			pstmt = getConnection().prepareStatement(sql);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) { // 회원임
				if (rs.getString(1).equals(userPwd)) { 
					ok = 1; //로그인 성공
					user.setSubjectName(rs.getString(2)); //과목
					user.setUserId(userId); //아이디
					map.put("key", ok);
					map.put("user", user);
				} else  {
					ok = 2; // 비밀번호 불일치 (회원이면서)
					map.put("key", ok);
					map.put("user", user); //유저는 초기 상태임
				}
			} else {
				ok = 3; //회원 아님
				map.put("key", ok);
				map.put("user", user); //유저는 초기 상태임
			}

			close(conn, pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;
	}

	// 공지사항
	public int writeCheck(String userId) {
		sql = "select division from User where userid = ?";
		int ok = 0;

		try {
			pstmt = getConnection().prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getInt(1) == 1) {
					ok = 1;
				} else if (rs.getInt(1) == 0) {
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
		sql = "insert into notice(userId,title,content,subjectName) values(?,?,?,?)";
		int count = 0;
		try {
			pstmt = getConnection().prepareStatement(sql);

			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getSubjectName());

			count = pstmt.executeUpdate();
			close(conn, pstmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	public int updateNotice(NoticeVO vo) {
		sql = "update Notice set title=?, content=? where boardNo=?";
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
		sql = "delete from notice where boardNo=?";
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
		sql = "select title, subjectName from notice";
		try {
			pstmt = getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeVO nvo2 = new NoticeVO(rs.getString(1), rs.getString(2));
				bvo.add(nvo2);
			}
			close(conn, pstmt, rs);
		} catch (SQLException e) {
			e.getMessage();
		}
		return bvo;
	}
	
	public List<NoticeVO> selectBoardAll2(String subjectName) {
		List<NoticeVO> bvo = new ArrayList<NoticeVO>();
		sql = "select title, subjectName from notice where subjectName=?";
		try {
			pstmt = getConnection().prepareStatement(sql);
			pstmt.setString(1, subjectName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeVO nvo2 = new NoticeVO(rs.getString(1), rs.getString(2));
				bvo.add(nvo2);
			}
			close(conn, pstmt, rs);
		} catch (SQLException e) {
			e.getMessage();
		}
		return bvo;
	}

	public int checkView(String userId, String subjectName) {
		sql = "select subjectName from User where userId = ?";
		int ok = 0;
		try {
			pstmt = getConnection().prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery(sql);
			if (rs.next()) {
				if (rs.getString(1).equals(subjectName)) {
					ok = 1;
				} else {
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

	public int increaseHit(Integer boardNo) {
		int num = 0;
		sql = "update Notice set hit=hit+1 where boardNo=?";
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

	// 희수
	// 개인정보 조회
	public UserVO selectUser(String userId) {
		UserVO vo = null;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement("select *from User where userId=?;");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new UserVO(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
						rs.getString(7), rs.getInt(8));
			}
			close(conn, pstmt, rs);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	// 개인정보 수정
	public int mypageUpdate(UserVO vo) {
		int count = 0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement("update User set userName=?, userPwd=?, phoneNo=?, email=? where userId=?");
			pstmt.setString(1, vo.getUserName());
			pstmt.setString(2, vo.getUserPwd());
			pstmt.setString(3, vo.getPhoneNo());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getUserId());
			count = pstmt.executeUpdate();

			close(conn, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	// 회원 탈퇴
	public int deleteUser(String userId) {
		int count = 0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement("delete from user where userId =?");
			pstmt.setString(1, userId);

			count = pstmt.executeUpdate();

			close(conn, pstmt);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return count;
	}

	// 전체공지사항조회
	public List<ANoticeVO> AselectNoticeAll() {
		List<ANoticeVO> avo = new ArrayList<ANoticeVO>();
//		String sql = "select title, regDate from Anotice";
//		String sql = "select title, regDate from ANotice where userId=?";
		String sql = "select * from Anotice";
		ResultSet rs = null;
		try {
			pstmt = getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ANoticeVO avo2 = new ANoticeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6));
				avo.add(avo2);
			}
			close(conn, pstmt, rs);
		} catch (SQLException e) {
			e.getMessage();
		}
		return avo;
	}

	public ANoticeVO AselectNotice(Integer boardNo) {
		sql = "select * from Anotice where boardNo=?";
		ANoticeVO avo = null;
		try {
			pstmt = getConnection().prepareStatement(sql);

			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				avo = new ANoticeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6));
			}
			close(conn, pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return avo;
	}

	public List<ANoticeVO> AselectBoardAll() {
		List<ANoticeVO> avo = new ArrayList<ANoticeVO>();
		sql = "select title, boardNo from Anotice";
		try {
			pstmt = getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ANoticeVO nvo2 = new ANoticeVO(rs.getString(1), rs.getInt(2));
				avo.add(nvo2);
			}
			close(conn, pstmt, rs);
		} catch (SQLException e) {
			e.getMessage();
		}
		return avo;
	}

	// 전체 공지사항 체크
	public int AwriteCheck(String userId) {
		sql = "select division from User where userid = ?";
		rs = null;
		int ok = 0;

		try {
			pstmt = getConnection().prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getInt(1) == 1) {
					ok = 1;
				} else if (rs.getInt(1) == 0) {
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

	// 전체 공지사항 추가
	public int AinsertNotice(ANoticeVO vo) { // 공지사항 저장
		sql = "insert into Anotice(userId,title,content) values(?,?,?)";
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

	// 전체 공지사항 수정
	public int AupdateNotice(ANoticeVO avo) {
		sql = "update ANotice set title=?, content=? where boardNo=?";

		int num = 0;
		try {
			pstmt = getConnection().prepareStatement(sql);

			pstmt.setString(1, avo.getTitle());
			pstmt.setString(2, avo.getContent());
			pstmt.setInt(3, avo.getBoardNo());

			num = pstmt.executeUpdate();
			close(conn, pstmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

	// 전체 공지사항 특정게시물 삭제
	public int AdeleteNotice(Integer boardNo) {
		sql = "delete from Anotice where boardNo=?";
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

	public int AincreaseHit(Integer boardNo) {
		int num = 0;
		sql = "update ANotice set hit=hit+1 where boardNo=?";
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
	
	// -------------- 댓글 ----------------------------
	public int insertComment(CommentsVO vo) { //댓글 작성
        sql = "insert into comments(userId,content,boardNo) values(?,?,?)";
        int count = 0;
        try {
           pstmt = getConnection().prepareStatement(sql);
           
           pstmt.setString(1, vo.getUserId());
           pstmt.setString(2, vo.getContent());
           pstmt.setInt(3, vo.getBoardNo());

           count = pstmt.executeUpdate();
           close(conn, pstmt);
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
        return count;

     }
     
     public ArrayList<CommentsVO> selectComments(int boardNo){
    	 sql = "select * from comments where boardNo=? group by regDate order by regDate desc";
        ArrayList<CommentsVO> vl = new ArrayList<CommentsVO>();
        try {
           pstmt = getConnection().prepareStatement(sql);

           pstmt.setInt(1, boardNo);
           rs = pstmt.executeQuery();
           while(rs.next()) {
              vl.add(new CommentsVO(rs.getInt(1), rs.getString(2), 
                    rs.getString(3), rs.getString(4), rs.getInt(5)));
           }
           close(conn, pstmt, rs);
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return vl;
     }
     
     public int deleteComment(Integer commentsNo) {
        sql = "delete from comments where commentsNo=?";
        int num = 0;
        try {
           pstmt = getConnection().prepareStatement(sql);
           pstmt.setInt(1, commentsNo);

           num = pstmt.executeUpdate(); 
           close(conn, pstmt);
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return num;

     }
     
     public int commentCount(int boardNo) {// 댓글 수 세기
    	 sql="select count(*) from comments where boardNo=?";
    	 int num=0;
    	 try {
    		 pstmt=getConnection().prepareStatement(sql);
    		 pstmt.setInt(1, boardNo);
    		 
    		 rs = pstmt.executeQuery();
    		 
    		 if(rs.next()) {
    			num= rs.getInt(1);
    		 }
             close(conn, pstmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 return num;
    	 
     }
     
     // ------------- 댓글 끝 ----------------------------------     
     
     public List<NoticeVO> selectBoard(String subjectName) {
         List<NoticeVO> nvo = new ArrayList<NoticeVO>();
         sql = "select title, subjectName from notice where subjectName = ?";
         try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, subjectName);
            rs = pstmt.executeQuery();
            while (rs.next()) {
               NoticeVO nvo2 = new NoticeVO(rs.getString(1), rs.getString(2));
               nvo.add(nvo2);
            }
            conn.close();
            pstmt.close();
            rs.close();
         } catch (SQLException e) {
            e.getMessage();
         }
         return nvo;
      }
     
     public int insertFile(FileVO vo) { // 강의자료 등록
 		sql = "insert into datalab(userId,title,content,fileName,subjectName) values(?,?,?,?,?)";
 		int count = 0;
 		try {
 			pstmt = getConnection().prepareStatement(sql);

 			pstmt.setString(1, vo.getUserId());
 			pstmt.setString(2, vo.getTitle());
 			pstmt.setString(3, vo.getContent());
 			pstmt.setString(4, vo.getFileName());
 			pstmt.setString(5, vo.getSubjectName());

 			count = pstmt.executeUpdate();
 			close(conn, pstmt);
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 		return count;
 	}
     
     public ArrayList<FileVO> selectFileAll(String subjectName) { //강의자료 전체보기
 		ArrayList<FileVO> fl = new ArrayList<FileVO>();

 		sql = "select * from datalab where subjectName=?";
 		try {
 			conn = getConnection();
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, subjectName);
 			rs = pstmt.executeQuery();

 			while (rs.next()) {
 				fl.add(new FileVO(rs.getInt(1), rs.getString(2), rs.getString(3),
 						rs.getString(4), rs.getString(5), rs.getString(6)));
 			}

 			close(conn, pstmt, rs);

 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 		return fl;

 	}
     
     public int deleteFile(Integer boardNo) {
 		sql = "delete from datalab where boardNo=?";
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
     public FileVO selectFile(Integer boardNo) {
 		sql = "select * from datalab where boardNo=?";
 		PreparedStatement pstmt;
 		FileVO fvo = null;
 		try {
 			pstmt = getConnection().prepareStatement(sql);

 			pstmt.setInt(1, boardNo);
 			ResultSet rs = pstmt.executeQuery();
 			if (rs.next()) {
 				fvo = new FileVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
 						rs.getString(6));
 			}
 			close(conn, pstmt, rs);
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 		return fvo;
 	}
     
     public int dataUpdate(FileVO vo) {   //자료실 수정
         int count=0;
         conn = getConnection();
         try {
           pstmt = conn.prepareStatement("update datalab set title=?, content=? where boardNo=?");
           pstmt.setString(1, vo.getTitle());
           pstmt.setString(2, vo.getContent());
           pstmt.setInt(3, vo.getBoardNo());
           
           count = pstmt.executeUpdate();         
           close(conn, pstmt);
        } catch (SQLException e) {
           e.printStackTrace();
        }
         
         return count;
      }
     
  // 강의계획서
 	public List<SyllabusVO> selectSyllabus(String subjectName) { // subject_main.jsp에서 강의계획서 띄우기
 		List<SyllabusVO> svo = new ArrayList<SyllabusVO>();
 		sql = "select weekday,title, subjectName  from syllabus where subjectName = ?";
 		try {
 			conn = getConnection();
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, subjectName);
 			rs = pstmt.executeQuery();
 			while (rs.next()) {
 				SyllabusVO svo2 = new SyllabusVO(rs.getString(1), rs.getString(2), rs.getString(3));
 				svo.add(svo2);
 			}
 			conn.close();
 			pstmt.close();
 			rs.close();
 		} catch (SQLException e) {
 			e.getMessage();
 		}
 		return svo;
 	}

 	public SyllabusVO selectSyllabus2(int syllabusNo) {
 		//List<SyllabusVO> svo = new ArrayList<SyllabusVO>();
 		SyllabusVO svo2 = null;
 		sql = "select weekday,title, content, subjectName  from syllabus where syllabusNo=?";
 		try {
 			conn = getConnection();
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, syllabusNo);
 			rs = pstmt.executeQuery();
 			if(rs.next()) {
 				 svo2 = new SyllabusVO(syllabusNo, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
 				
 			}
 			conn.close();
 			pstmt.close();
 			rs.close();
 		} catch (SQLException e) {
 			e.getMessage();
 		}
 		return svo2;
 	}

 	public List<SyllabusVO> selectSyllabusAll(String subjectName) { // 강의계획서 모든 리스트 보기
 		List<SyllabusVO> svo = new ArrayList<SyllabusVO>();
 		sql = "select syllabusNo, weekday,title,content,subjectName from syllabus where subjectName = ?";
 		try {
 			pstmt = getConnection().prepareStatement(sql);
 			pstmt.setString(1, subjectName);
 			rs = pstmt.executeQuery();
 			while (rs.next()) {
 				SyllabusVO svo2 = new SyllabusVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
 						rs.getString(5));
 				svo.add(svo2);
 			}
 			close(conn, pstmt, rs);
 		} catch (SQLException e) {
 			e.getMessage();
 		}
 		return svo;
 	}

 	public int SyllabusCheck(String userId) {	//이거 지금 맛감 주석달아둬도됨
 		sql = "select division from User where userid = ?";
 		rs = null;
 		int ok = 0;

 		try {
 			pstmt = getConnection().prepareStatement(sql);
 			pstmt.setString(1, userId);
 			rs = pstmt.executeQuery();

 			if (rs.next()) {
 				if (rs.getInt(1) == 1) { // ok가 1이면 강사
 					ok = 1;
 				} else if (rs.getInt(1) == 0) { // ok가 0이면 학생
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

 	public int updateSyllabus(SyllabusVO vo) {
 		sql = "update Syllabus set title=?, content=? where weekDay=? and subjectName = ? and syllabusNo = ?";

 		int num = 0;
 		try {
 			pstmt = getConnection().prepareStatement(sql);

 			pstmt.setString(1, vo.getTitle());
 			pstmt.setString(2, vo.getContent());
 			pstmt.setString(3, vo.getWeekDay());
 			pstmt.setString(4, vo.getSubjectName());
 			pstmt.setInt(5, vo.getSyllabusNo());

 			num = pstmt.executeUpdate();
 			close(conn, pstmt);
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 		return num;
 	}
    
}
