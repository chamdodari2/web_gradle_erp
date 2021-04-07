package web_gradle_erp.dao;

import java.util.List;

import web_gradle_erp.dto.Title;

public interface TitleDao {
	List<Title> selectTitleByAll();
	Title selectTitleByNo(Title title);
	int insertTitle(Title title);
	int updateTitle(Title title);
	int deleteTitle(Title title);

}
