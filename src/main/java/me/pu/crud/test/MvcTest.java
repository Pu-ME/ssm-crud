package me.pu.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

import me.pu.crud.bean.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "classpath:applicationContext-mvc.xml" })
public class MvcTest {
	@Autowired
	WebApplicationContext context;
	
	MockMvc mockMvc;

	@Before
	public void initMockMvc() {
		 mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void testPage() throws Exception {
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","1"))
				.andReturn();
		MockHttpServletRequest request = result.getRequest();
		
		PageInfo page = (PageInfo)request.getAttribute("pageInfo");
		
		System.out.println("当前页面："+page.getPageNum());
		System.out.println("总页数：" +page.getPages());
		
		List<Employee> list = page.getList();
		for (Employee employee : list) {
			System.out.println("ID:"+employee.getEmpId()+" Name:"+employee.getEmpName());
		}
	}
}
