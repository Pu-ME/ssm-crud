package me.pu.crud.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import me.pu.crud.bean.Department;
import me.pu.crud.dao.DepartmentMapper;
import me.pu.crud.dao.EmployeeMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private SqlSession sqlSession;
	@Test
	public void testCRUD() {
		//测试部门
		departmentMapper.insertSelective(new Department(null, "销售部"));
		//测试员工
		//employeeMapper.insertSelective(new Employee(null, "Tom", "m", "tom@163.com", 1));
		//批量插入员工
		/*EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 500; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insertSelective(new Employee(null, uid, "m", uid+"@abc.com", 1));
		}
		System.out.println("插入员工完成.......");*/
	}
}
