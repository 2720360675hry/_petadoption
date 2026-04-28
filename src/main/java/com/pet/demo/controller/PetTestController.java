package com.pet.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pet.demo.config.Log;
import com.pet.demo.entity.Admin;
//import com.pet.demo.entity.File;
import com.pet.demo.entity.Pet;
import com.pet.demo.entity.User;
//import com.pet.demo.provider.UCloudProvider;
import com.pet.demo.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/PetTest")
public class PetTestController {
    @Autowired
    private PetService petService;

//    @Autowired(required = false)
//    private UCloudProvider uCloudProvider;

    @GetMapping("/pet")
    public String findAll(Model model, @RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(name = "searchName", required = false) String searchName) {
        model.addAttribute("url", "/PetTest/pet");
        if (StringUtils.isEmpty(searchName)) {
            PageHelper.startPage(pageNum, 5);
            List<Pet> pets = petService.findAll();
            PageInfo<Pet> pageInfo = new PageInfo<>(pets);
            model.addAttribute("pagelist", pageInfo);
        } else {
            String name = "%" + searchName + "%";
            PageHelper.startPage(pageNum, 5);
            List<Pet> pets = petService.findByName(name);
            PageInfo<Pet> pageInfo = new PageInfo<>(pets);
            model.addAttribute("pagelist", pageInfo);
        }
        return "pet";
    }

    @PostMapping("/save")
    public String savePet(@RequestParam(value = "petPic", required = false) MultipartFile file,
                          HttpServletRequest request,
                          @RequestParam(value = "existingPic", required = false) String existingPic) {
        Pet pet = new Pet();
        pet.setPetName(request.getParameter("petName"));

//        去多余空格
        String petDetail = request.getParameter("petDetail");
        if (petDetail!= null) {
            petDetail = petDetail.trim();
        }
        pet.setPetDetail(petDetail);

        pet.setPetDetail(request.getParameter("petDetail"));
        pet.setPetSex(request.getParameter("petSex"));
        pet.setPetState(request.getParameter("petState"));
        pet.setPetSub(request.getParameter("petSub"));
        pet.setPetType(request.getParameter("petType"));
        pet.setPetBir(request.getParameter("petBir"));
        pet.setPetId(request.getParameter("petId"));

        // 本地上传图片逻辑
        if (file != null &&!file.isEmpty()) {
            String uploadDir = "D:/petImages/";
            String originalFileName = file.getOriginalFilename();

            File dest = new File(uploadDir + originalFileName);
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            try {
                file.transferTo(dest);
                pet.setPetPic("/petImages/" + originalFileName);
            } catch (IOException e) {
                e.printStackTrace();
                return "redirect:/PetTest/pet?error=图片上传失败";
            }
        } else if (!StringUtils.isEmpty(existingPic)) {
            pet.setPetPic(existingPic);
        }

        if (StringUtils.isEmpty(request.getParameter("petId"))) {
            petService.save(pet);
        } else {
            petService.update(pet);
        }
        return "redirect:/PetTest/pet";
    }

    @GetMapping("/delete")
    public String deletePet(String petId) {
        petService.delete(petId);
        return "redirect:/PetTest/pet";
    }

    @GetMapping("/findByName")
    public String findByName(Model model, @RequestParam(name = "searchName", required = false) String searchName) {
        String name = "%" + searchName + "%";
        List<Pet> pets = petService.findByName(name);
        model.addAttribute("pets", pets);
        return "pet";
    }
}