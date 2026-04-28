package com.pet.demo.service.Impl;

import com.pet.demo.dao.PetDao;
import com.pet.demo.entity.Pet;
import com.pet.demo.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class PetServiceImpl implements PetService {
    @Autowired
    private PetDao petDao;

    @Override
    public List<Pet> findAll() {
        return petDao.findAll();
    }

    @Override
    public List<Pet> findPet(String petState) {
        return petDao.findPet(petState);
    }

    @Override
    public void save(Pet pet) {

        // 获取当前数据库中最大的petId对应的数字部分
        String maxPetId = petDao.findMaxPetId();
        int maxNumber = 0;
        if (maxPetId != null) {
            // 提取数字部分并转换为整数
            String numberPart = maxPetId.substring(3);
            maxNumber = Integer.parseInt(numberPart);
        }
        // 生成新的petId
        int newNumber = maxNumber + 1;
        String newPetId = "pet0" + newNumber;
        pet.setPetId(newPetId);

        petDao.save(pet);
    }

    @Override
    public void delete(String id) {
        petDao.delete(id);
    }

    @Override
    public void update(Pet pet) {
        petDao.update(pet);

    }

    @Override
    public Pet findOne(String id) {
        return petDao.findOne(id);
    }

    @Override
    public String findName(String id) {
        return petDao.findName(id);
    }

    @Override
    public List<Pet> findByName(String petName) {
        return petDao.findByName(petName);
    }

    @Override
    public List<Pet> findByNameWithState(String petName) {
        return petDao.findByNameWithState(petName);
    }


}
