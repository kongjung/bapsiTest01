package kr.co.bapsi.member.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.bapsi.member.service.MemberService;
import kr.co.bapsi.member.vo.FindCriteria;
import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.member.vo.PagingMaker;
import kr.co.bapsi.upload.vo.UploadVO;

@Controller
public class MemberController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

//    private stat

//    ic final Logger logger = LoggerFactory.getLogger(MemberController.class);
	ModelAndView mav = new ModelAndView();

	@Inject
	private MemberService memberService;

// *******************회원가입 **************************
	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {

		return "jsp/member/join";
	}

	// 회원가입 : alert창 띄우는 회원가입 창
	@RequestMapping(value = "/join/process", method = RequestMethod.POST)
	public String joinProcess(MemberVO member) throws Exception {

		memberService.join(member);

		return "jsp/member/joinCome";
	}

	// 이메일 중복 체크
	@RequestMapping(value = "/check/email")
	@ResponseBody
	public Map<Object, Object> checkEmail(@RequestBody String email) throws Exception {

		int count = 0;

		Map<Object, Object> map = new HashMap<Object, Object>();

		count = memberService.checkEmail(email);

		map.put("cnt", count);

		return map;
	}

	// 닉네임 중복 체크
	@RequestMapping(value = "/check/nickname")
	@ResponseBody
	public Map<Object, Object> checkNickname(@RequestBody String nickname) throws Exception {

		int count = 0;

		Map<Object, Object> map = new HashMap<Object, Object>();

		count = memberService.checkNickname(nickname);

		map.put("cnt", count);

		return map;

	}

// ****************************************************

//**************************마이페이지*******************************

	// 회원정보조회(마이페이지)
	@RequestMapping(value = "/{no}/mypage")
	public String myPage(@PathVariable("no") int no, HttpSession session) throws Exception {

		MemberVO member = memberService.myPage(no);
		UploadVO upload = memberService.myPagefile(no);

		session.setAttribute("member", member);
		session.setAttribute("upload", upload);

		return "jsp/member/myPage";
	}

	// 회원정보수정
	@RequestMapping(value = "/{no}/mypage/update", method = RequestMethod.GET)
	public String memberUpdate(@PathVariable("no") int no, Model model) throws Exception {

		MemberVO member = memberService.myPage(no);

		model.addAttribute("member", member);

		return "jsp/member/updateForm";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberVO member) throws Exception {

		memberService.update(member);

		return "jsp/member/updateCome";
	}

	// 회원탈퇴
	@RequestMapping("/{no}/selfdelete")
	public String selfDelete(@PathVariable("no") int no, HttpSession session) throws Exception {

		memberService.selfDelete(no);

		session.invalidate();

		return "jsp/member/deleteCome";
	}

	// id(email) 찾기??
	@RequestMapping("/find/email")
	public ModelAndView findEmail() {

		return mav;
	}

	// 비밀번호 찾기
	@RequestMapping("/find/password")
	public ModelAndView findPassword() {

		return mav;
	}

// *******************************************************************************

//****************회원목록(관리자) 관련 메소드******************

	/*
	 * @RequestMapping(value = "/list") public String adminMlist(Model model,
	 * MemberVO member, PageCriteria pCri) throws Exception {
	 * 
	 * // controller -> service -> dao 요청 // List<MemberVO> list =
	 * memberService.memberList(); // model.addAttribute("list", list);
	 * 
	 * model.addAttribute("list", memberService.pagingCriteria(pCri)); PagingMaker
	 * pagingMaker = new PagingMaker(); pagingMaker.setCri(pCri);
	 * 
	 * // pagingMaker.setTotalData(255); //int형으로 데이터를 몇 개 받을 지 여기서 정한다.!! 또는 전체
	 * 데이터를 가르킨다.!! pagingMaker.setTotalData(memberService.pagingCountData(pCri));
	 * model.addAttribute("pagingCountData",memberService.pagingCountData(pCri));
	 * 
	 * // 뷰페이지에 보일 수 있게 공유영역에 올리는 거다!! model.addAttribute("pagingMaker",
	 * pagingMaker);
	 * 
	 * return "jsp/admin/memberList"; }
	 */
	// 회원목록 페이지 - 검색기능 구현 및 페이징(위에꺼 업그레이드 버전)
	@RequestMapping(value = "/list")
	public String adminMlist(Model model, MemberVO member, FindCriteria fCri) throws Exception {

		// controller -> service -> dao 요청
//  	   List<MemberVO> list = memberService.memberList();
//  	   model.addAttribute("list", list);

		model.addAttribute("list", memberService.listFind(fCri));
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(fCri);

//  	pagingMaker.setTotalData(255);  //int형으로 데이터를 몇 개 받을 지 여기서 정한다.!! 또는 전체 데이터를 가르킨다.!!
		pagingMaker.setTotalData(memberService.findCountData(fCri));
		model.addAttribute("findCountData", memberService.findCountData(fCri));

		// 뷰페이지에 보일 수 있게 공유영역에 올리는 거다!!
		model.addAttribute("pagingMaker", pagingMaker);

		return "jsp/admin/memberList";
	}

	// 회원상세보기 페이지
	@RequestMapping(value = "/list/detail/{no}")
	public String memberView(@PathVariable("no") int no, Model model) {

		// 회원 정보를 model에 저장
		MemberVO member = memberService.detailMember(no);
		model.addAttribute("member", member);
//        System.out.println("no : " + no);
		return "jsp/admin/memberDetail";
	}

	// 강퇴(관리자모드)
	@RequestMapping("/{no}/adminDelete")
	public String Delete(@PathVariable("no") int no, HttpSession session, MemberVO member) {

		memberService.deleteMember(no);

		// 세션만 초기화 시키면
//        session.invalidate();

		return "jsp/admin/adminDelete";
	}

	// 검색기능 구현

// **********************************************************

// ************************ 로그인 *******************************

	// 네이버 로그인 api
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "jsp/login/login";
	}

	// 로그인 콜백
	@SuppressWarnings({ "unchecked", "unused" })
	@RequestMapping(value = "/login/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback-");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
		model.addAttribute("result", apiResult);
		System.out.println("result" + apiResult);

		/* 네이버 로그인 성공 페이지 View 호출 */
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = (Map<String, Object>) mapper.readValue(apiResult, HashMap.class);
		Map<String, Object> mapResponse = (Map<String, Object>) map.get("response");
		String email = (String) mapResponse.get("email");
		String name = (String) mapResponse.get("name");
		// String nickname = (String)mapResponse.get("nickname");
		System.out.println("email: " + email);
		System.out.println("name: " + name);
		// System.out.println("nickname: " + nickname);

		MemberVO mvo = new MemberVO();
		mvo.setEmail(email);
		mvo.setName(name);
		// mvo.setNickname(nickname);

		if (mvo == null) {
			memberService.naverInsert(mvo);
			System.out.println("네이버 userVO를 확인하세요 " + mvo);
			session.setAttribute("userVO", mvo);
			return "jsp/login/callback";

		} else {
			session.setAttribute("userVO", mvo);
			return "jsp/login/callback";

		}

		// model.addAttribute("userVO",mvo);

//       JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");  
//     String snsId = jsonparse.JsonToString(jsonobj, "id");
//     String name = jsonparse.JsonToString(jsonobj, "name");
//
//     UserVO vo = new UserVO();
//     vo.setUser_snsId(snsId);
//     vo.setUser_name(name);
//
//     System.out.println(name);
//     try {
//         vo = service.naverLogin(vo);
//     } catch (Exception e) {
//         // TODO Auto-generated catch block
//         e.printStackTrace();
//     }
//
//
//     session.setAttribute("login",vo);
//     return new ModelAndView("user/loginPost", "result", vo);

		// 지유쌤이 헀던 redirect;
		// return "redirect:/";
//		return "jsp/login/callback";
	}

	// alert 창 띄어주는 직적만든 로그인
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@ModelAttribute("member") MemberVO member, Model model, HttpSession session)
			throws Exception {

		// 로그인 시작
		/* 생성한 인증 URL을 View로 전달 */
		MemberVO userVO = memberService.loginCheck(member);

		String msg = "";

		if (userVO == null) {
			msg = "Fail";
			model.addAttribute("msg", msg);

			return "jsp/login/login";
		} else {
			msg = userVO.getNickname() + "님 환영합니다.";
			session.setAttribute("msg", msg);
			session.setAttribute("no", userVO.getNo());
			session.setAttribute("userVO", userVO);

			return "jsp/login/loginCome";
		}
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "jsp/login/logoutBye";
	}

//**********************************************************

// *************************임지영1 체크박스 모드*********************************

//	 체크박스 관리자 등업
	@RequestMapping(value = "/checkUp", method = RequestMethod.POST)
	public String checkUp(@Valid MemberVO memberVO) throws Exception {
		if (memberVO.getNoList() == null) {
			return "jsp/admin/nochecks";
		} else {
			memberService.checkUp(memberVO);
			System.out.println("-----------임지영임지영임지영->" + memberVO);
			return "jsp/admin/checkUp";
		}
	}

	// 체크박스 일반사용자강등
	@RequestMapping(value = "/checkDown", method = RequestMethod.POST)
	public String checkDown(@Valid MemberVO memberVO) throws Exception {
		if (memberVO.getNoList() == null) {
			return "jsp/admin/nochecks";
		} else {
			memberService.checkDown(memberVO);
			return "jsp/admin/checkDown";
		}
	}

	// 체크박스 회원탈퇴
	@RequestMapping(value = "/checkDelete", method = RequestMethod.POST)
	public String checkDelete(@Valid MemberVO memberVO) throws Exception {
		if (memberVO.getNoList() == null) {
			return "jsp/admin/nochecks";
		} else {
			memberService.checkDelete(memberVO);
			return "jsp/admin/checkDelete";
		}
	}
}