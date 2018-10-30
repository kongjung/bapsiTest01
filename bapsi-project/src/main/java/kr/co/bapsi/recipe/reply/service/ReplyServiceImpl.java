package kr.co.bapsi.recipe.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.bapsi.recipe.reply.dao.ReplyDAO;
import kr.co.bapsi.recipe.vo.PageCriteria;
import kr.co.bapsi.recipe.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public void inputReply(ReplyVO rvo) {
		dao.write(rvo);
	}

	@Override
	public List<ReplyVO> replyList(int recipeNo) {
		return dao.list(recipeNo);
	}

	@Override
	public void modifyReply(ReplyVO rvo) {
		dao.modify(rvo);
	}

	@Override
	public void deReply(int no) {
		dao.reDelete(no);
	}
	
	@Override
	public List<ReplyVO> replyListPage(int recipeNo, PageCriteria pCri){
		return dao.reListPage(recipeNo, pCri);
	}
	
	@Override
	public int reCount(int no) {
		return dao.reCount(no);
	}

}
