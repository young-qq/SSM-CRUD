package com.young.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.young.crud.bean.Employee;
import com.young.crud.bean.Msg;
import com.young.crud.service.EmployeeService;

/*
处理员工CRUD请求
*/
@Controller
public class EmployeeController {
	private static final Employee Employee = null;
	@Autowired
	EmployeeService employeeService;
	/*
	查询员工数据（分页查询）
	*/
//	返回json格式的字符串，需导入jackson包
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps=employeeService.getAll();
//		使用pageInfo包装查询后的结果,传入连续显示的页数为5
		PageInfo<Employee> page = new PageInfo<Employee>(emps, 5);
		return Msg.success().add("pageInfo",page);
	};
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorfields", map);
		}
		else {
			employeeService.saveEmp(employee);
			return Msg.success();
			
		}
		
	}
	
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkuser(@RequestParam("empName")String empName) {
		//先判断用户名是否是合法的表达式
		String regx="[\u4e00-\u9fa5_a-zA-Z0-9_]{2,10}";
		boolean matches = empName.matches(regx);
		if (!matches) {
			return Msg.fail().add("va_msg", "用户名必须是2-10位");
		}
		boolean b=employeeService.checkUser(empName);
		if(b) {
			return Msg.success();
		}
		else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
		
		
	}
	
	//回显员工信息
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg updateuser(@PathVariable("id")Integer id) {
		Employee employee=employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
		
	}
	//更新员工信息
	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg saveEmp(Employee emp) {
	
		System.out.println(emp);
		employeeService.updateEmp(emp);
		return Msg.success();
		
		
	}
	//删除员工信息 批量删除二合一
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deltEmp(@PathVariable("empId")String empIds) {
		if(empIds.contains("-")) {
			String[] str_empIds=empIds.split("-");
			List<Integer> del_ids=new ArrayList<Integer>();
			for (String string : str_empIds) {
				del_ids.add(Integer.parseInt(string));
			}
			System.out.println(del_ids);
			employeeService.deleteBatch(del_ids);
			return Msg.success();
		}else {
			Integer empId = Integer.parseInt(empIds);
			employeeService.deleteEmp(empId);
			return Msg.success();
		}
		
		
	}
	//后端校验JSR303 导入hibernate-validator
	
//	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,
			Model model)
	
	{
		
//		引入PageHelper分页插件,，调用pagehelper设置页码及每页查询多少条数据
		PageHelper.startPage(pn, 5);
		List<Employee> emps=employeeService.getAll();
//		使用pageInfo包装查询后的结果,传入连续显示的页数为5
		PageInfo<Employee> page = new PageInfo<Employee>(emps, 5);
		model.addAttribute("pageInfo",page);
//		System.out.println(page);
		
		return "list";
	}
}
