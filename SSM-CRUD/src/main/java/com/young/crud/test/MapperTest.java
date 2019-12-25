package com.young.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.young.crud.bean.Department;
import com.young.crud.bean.Employee;
import com.young.crud.dao.DepartmentMapper;
import com.young.crud.dao.EmployeeMapper;

/*
����dao��Ĺ���

1������SpringTestģ��
2��@@ContextConfigurationָ��spring�����ļ���λ��
3��ֱ��@authorized��Ҫ���������
*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;
	/*
	 ����DepartmentMapper
	*/
	@Test
	public void testCRUD() {
////		1������SpringIOC����
//		@SuppressWarnings("resource")
//		ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
////		2���������л�ȡmapper
//		ioc.getBean(DepartmentMapper.class);
		
//		System.out.println(departmentMapper);

		//		测试插入部门信息
		
//		departmentMapper.insertSelective(new Department(null,"开发部"));
//		departmentMapper.insertSelective(new Department(null,"测试部"));
		
//		测试插入员工信息
//		employeeMapper.insertSelective(new Employee(null,"young","M","young@qq.com",3));
		
//		批量插入多个员工，使用可以插入批量操作的salSession
		EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<1000;i++) {
			String uid=UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",3));
		}
	}
}

