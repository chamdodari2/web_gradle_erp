package web_gradle_erp.dao;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import web_gradle_erp.JdbcUtil;
import web_gradle_erp.dao.impl.TitleDaoImpl;
import web_gradle_erp.dto.Title;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TitleDaoTest {
	private static Connection con;
	private static TitleDaoImpl dao = TitleDaoImpl.getInstance();
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		con = JdbcUtil.getConnection();
		dao.setCon(con);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		con.close();
	}

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01SelectTitleByAll() {
		System.out.printf("%s()%n", "test01SelectTitleByAll");
		
		List<Title> list = dao.selectTitleByAll();
		Assert.assertNotNull(list);
		
		list.parallelStream().forEach(System.out::println);
	}

	@Test
	public void test04SelectTitleByNo() {
		fail("Not yet implemented");
	}

	@Test
	public void test02InsertTitle() {
		fail("Not yet implemented");
	}

	@Test
	public void test03UpdateTitle() {
		fail("Not yet implemented");
	}

	@Test
	public void test05DeleteTitle() {
		fail("Not yet implemented");
	}

}
