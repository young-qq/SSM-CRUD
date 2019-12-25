package com.young.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.young.crud.bean.Department;

import com.young.crud.bean.Msg;
import com.young.crud.service.DepartmentService;
@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService departmentservice;
	
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		 List<Department> list=departmentservice.getDepts();
		return Msg.success().add("depts", list);
		
	}
}
