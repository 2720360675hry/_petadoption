package com.pet.demo.service.Impl;

import com.pet.demo.dao.AdminDao;
import com.pet.demo.entity.Admin;
import com.pet.demo.entity.User;
import com.pet.demo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
//@Service注解用来标注服务层中的类，用于处理业务逻辑。在使用@Service注解标记的类中，通常会注入@Reposity的类。
@Service
public class AdminServiceImpl implements AdminService {

//    @Autowired 注解把 AdminDao 的实例注入到 AdminServiceImpl 类里。
//借助 @Autowired 注解，让 Spring 容器自动查找 AdminDao 类型的 bean，
//    并将其注入到 AdminServiceImpl 类的 adminDAO 字段中。这样一来，
//    AdminServiceImpl 类就能使用 AdminDao 提供的方法进行数据库操作了。
    @Autowired
    private AdminDao adminDAO;




    @Override
    public List<Admin> findAll() {
        return adminDAO.findAll();
    }

    @Override
    public void save(Admin admin) {


        Integer maxId = adminDAO.getMaxAdminId();
        if (maxId == null) {
            maxId = 0;
        }
        admin.setAdminId(String.valueOf(maxId + 1));
        adminDAO.save(admin);
    }

    @Override
    public void delete(String id) {
        adminDAO.delete(id);
    }

    @Override
    public void update(Admin admin) {
        adminDAO.update(admin);
    }

    @Override
    public List<Admin> findByName(String searchName){
        return adminDAO.findByName(searchName);
    }

    @Override
    public String findName(String id) {
        return adminDAO.findName(id);
    }


    @Override
    public Admin loading(String adminAccount, String adminPassword) {
        return adminDAO.loading(adminAccount, adminPassword);
    }


}
