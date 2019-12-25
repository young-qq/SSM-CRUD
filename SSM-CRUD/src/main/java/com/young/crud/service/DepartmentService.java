package com.young.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.young.crud.bean.Department;

import com.young.crud.dao.DepartmentMapper;

@Service
public class DepartmentService {
	@Autowired
	private DepartmentMapper departmentmapper;
	public List<Department> getDepts() {
		
		List<Department> list=departmentmapper.selectByExample(null);
		return list;
	}

	
}
