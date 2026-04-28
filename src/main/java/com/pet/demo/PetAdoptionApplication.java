package com.pet.demo;

import com.pet.demo.dao.UserDao;
import com.pet.demo.entity.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.InputStream;
import java.util.List;

//SpringBootApplication：它的作用是启用 Spring Boot 的自动配置功能，并扫描当前包及其子包下的组件。
//MapperScan指定 MyBatis Mapper 接口的扫描路径。
// Spring Boot 会自动扫描指定路径下的 Mapper 接口，并将其注册到 Spring 容器中，这样就可以在其他组件中使用这些 Mapper 接口进行数据库操作。

@SpringBootApplication
@MapperScan("com.pet.demo.dao")
public class PetAdoptionApplication {
    public static void main(String[] args) {
        SpringApplication.run(PetAdoptionApplication.class, args);
    }

}




//SpringApplication.run(PetAdoptionApplication.class, args) 方法会启动 Spring Boot 应用
//        它会创建并启动 Spring 应用上下文，自动配置应用程序所需的各种组件，
