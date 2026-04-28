package com.pet.demo.service.Impl;

import com.pet.demo.dao.UserDao;
import com.pet.demo.entity.User;
import com.pet.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User save(User user) {

        String maxUserId = userDao.findMaxUserId();
        if (maxUserId == null) {
            user.setUserId("1");
        } else {
            int nextId = Integer.parseInt(maxUserId) + 1;
            user.setUserId(String.valueOf(nextId));
        }
        userDao.save(user);
        return user;
    }

    @Override
    public void delete(String id) {
        userDao.delete(id);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findOne(String id) {
        return userDao.findOne(id);
    }

    @Override
    public String findName(String id) {
        return userDao.findName(id);
    }

    @Override
    public User findByAccount(String Account) {
        return userDao.findByAccount(Account);
    }
    @Override
    public List<User> findByName(String userName) {
        return userDao.findByName(userName);
    }

    @Override
    public User login(String userAccount, String userPassword) {

        return userDao.login(userAccount,userPassword);
    }




}
