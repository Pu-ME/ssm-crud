package me.pu.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import me.pu.crud.bean.Department;
import me.pu.crud.bean.Employee;
import me.pu.crud.service.DepartmentService;

@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService  departmentService;
	
	
	@RequestMapping("/addOrUpdatePage")
	public String getDepts(Model model) {
		List<Department> depts = departmentService.getDepts();
		model.addAttribute("employee", new Employee());
		model.addAttribute("depts", depts);
		
		return "addOrUpdate";
	}
}
