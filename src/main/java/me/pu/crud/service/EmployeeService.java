package me.pu.crud.service;

import java.util.List;

import org.aspectj.weaver.patterns.ExactAnnotationFieldTypePattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.pu.crud.bean.Employee;
import me.pu.crud.bean.EmployeeExample;
import me.pu.crud.bean.EmployeeExample.Criteria;
import me.pu.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;

	public List<Employee> getAll() {
		List<Employee> list = employeeMapper.selectByExampleWithDept(null);
		return list;
	}

	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}

	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
	}

	public Employee getEmp(Integer id) {
		return employeeMapper.selectByPrimaryKeyWithDept(id);
	}

	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	public void deleteBatch(List<Integer> list) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(list);
		employeeMapper.deleteByExample(example);
	}
}
