package com.pet.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//配置类来配置静态资源映射，
//        让 Spring Boot 能够正确地将请求映射到本地文件系统中的图片目录。
@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 配置静态资源映射，将 /petImages/** 映射到 D:/petImages/ 目录
        registry.addResourceHandler("/petImages/**")
                .addResourceLocations("file:D:/petImages/");
    }
//注册拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        添加拦截路径
        registry.addInterceptor(new LoginHandlerInterceptor()).addPathPatterns("/backstage/admin","/Apply/find","/PetTest/pet","/front/user","/manage","/info");
    }
    //启动时访问index，而不是index.html
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {

    registry.addViewController("/").setViewName("forward:/index");
    registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    WebMvcConfigurer.super.addViewControllers(registry);
    }

}

