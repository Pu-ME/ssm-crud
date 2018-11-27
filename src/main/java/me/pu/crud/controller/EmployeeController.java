package me.pu.crud.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import me.pu.crud.bean.Department;
import me.pu.crud.bean.Employee;
import me.pu.crud.service.DepartmentService;
import me.pu.crud.service.EmployeeService;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;
	/**
	 * 修改员工信息
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.PUT)
	public String udpateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return "redirect:/emps";
	}
	@RequestMapping(value="/addOrUpdatePage/{id}",method=RequestMethod.GET)
	public String getEmp(@PathVariable("id") Integer id,Model model) {
		Employee emp = employeeService.getEmp(id);
		List<Department> depts = departmentService.getDepts();
		model.addAttribute("employee", emp);
		model.addAttribute("depts", depts);
		return "addOrUpdate";
	}
	/**
	 * 删除员工
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public String delete(@PathVariable("ids") String ids) {
		if(ids.contains("-")) {
			List<Integer> list = new ArrayList<>();
			String[] ids_str = ids.split("-");
			for (String string : ids_str) {
				list.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(list);
		}else {
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		return "redirect:/emps";
	}
	/**
	 * 添加员工
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	public String addEmps(Employee employee) {
		employeeService.saveEmp(employee);
		return "redirect:/emps";
	}
	/**
	 * 查询员工数据（分页查询）
	 * 
	 * @return
	 */
	 @RequestMapping("/emps")
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 查询前，传入页码以及每页大小
		PageHelper.startPage(pn, 7);
		// 查询
		List<Employee> emps = employeeService.getAll();
		// 使用pageInfo包装，只需要将pageinfo交给页面即可
		PageInfo page = new PageInfo(emps, 5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
}
