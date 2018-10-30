package kr.co.bapsi.member.service;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Service;

import kr.co.bapsi.member.dao.MemberDAO;
import kr.co.bapsi.member.vo.FindCriteria;
import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.member.vo.PageCriteria;
import kr.co.bapsi.upload.vo.UploadVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;

//*******************회원가입 **************************	
	// 회원가입
	@Override
	public void join(MemberVO member) throws Exception {
		memberDAO.join(member);

	}

	// 이메일 중복 체크
	@Override
	public int checkEmail(String email) throws Exception {

		return memberDAO.checkEmail(email);
	}

	// 닉네임 중복 체크
	@Override
	public int checkNickname(String nickname) throws Exception {

		return memberDAO.checkNickname(nickname);
	}

//****************************************************

//****************회원목록(관리자) 관련 메소드******************
	// 회원목록
	@Override
	public MemberVO myPage(int no) throws Exception {

		return memberDAO.myPage(no);
	}

	@Override
	public UploadVO myPagefile(int no) throws Exception {

		return memberDAO.myPagefile(no);
	}

	// 회원정보 상세보기
	@Override
	public void update(MemberVO member) throws Exception {

		memberDAO.update(member);

	}

	// 회원삭제
	@Override
	public void selfDelete(int no) throws Exception {

		memberDAO.selfDelete(no);
	}

//*****************************************************	

//****************회원목록(관리자) 관련 메소드******************

	// 관리자: 회원목록 관련 메소드
	@Override
	public List<MemberVO> memberList() throws Exception {
		return memberDAO.memberList();

	}

	// 관리자: 회원정보 상세보기 오버라이드(DAO호출)
	@Override
	public MemberVO detailMember(int no) {
		return memberDAO.detailMember(no);
	}

	// 관리자: 회원삭제
	@Override
	public void deleteMember(int no) {

		memberDAO.deleteMember(no);
	}

	// 관리자 : 검색구현
	@Override
	public List<MemberVO> listFind(FindCriteria findCri) throws Exception {
		return memberDAO.listFind(findCri);
	}

	// 관리자: 검색구현
	@Override
	public int findCountData(FindCriteria findCri) throws Exception {
		return memberDAO.findCountData(findCri);
	}

//*****************************************************	

//*******************관리자 페이징 **************************	

	// 관리자 : 페이징
	public List<MemberVO> pagingCriteria(PageCriteria pCri) throws Exception {
		return memberDAO.pagingCriteria(pCri);
	}

	// 관리자 : 페이징 전체 수 가져오기
	public int pagingCountData(PageCriteria pCri) throws Exception {
		return memberDAO.pagingCountData(pCri);
	}

//*****************************************************	

//***************  로그인 *******************************	
	// 로그인 서비스 Implements
	@Override
	public MemberVO loginCheck(MemberVO member) throws Exception {

		return memberDAO.loginCheck(member);
	}

	// 네이버 회원목록 관련 메소드
	@Override
	public void naverInsert(MemberVO mvo) {
		memberDAO.naverInsert(mvo);
	}

//*****************************************************	
	@Override
	public void checkUp(MemberVO memberVO) throws Exception {
		memberDAO.checkUp(memberVO);
	}

	@Override
	public void checkDown(@Valid MemberVO memberVO) throws Exception {
		memberDAO.checkDown(memberVO);

	}

	@Override
	public void checkDelete(@Valid MemberVO memberVO) throws Exception {
		memberDAO.checkDelete(memberVO);
	}

}
