package com.pet.demo.dao;

import com.pet.demo.entity.Admin;
import com.pet.demo.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
//@Repository主要用于封装对于数据库的访问 表明这个类具有对数据库CRUD的功能，用在持久层的接口上。
@Repository
public interface AdminDao {
    //CURD
    List<Admin> findAll();
    void save(Admin admin);
    void delete(String id);
    void update(Admin admin);
    List<Admin> findByName(String id);
    String findName(String id);
    Admin loading(@Param("Account")String adminAccount, @Param("Password")String adminPassword);
    Integer getMaxAdminId();
}
