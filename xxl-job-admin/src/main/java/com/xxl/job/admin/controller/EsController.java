package com.xxl.job.admin.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;
import com.xxl.job.admin.core.model.Person;
import com.xxl.job.admin.core.model.Response;
import com.xxl.job.admin.es.ElasticsearchTemplem;

@RestController
@RequestMapping("/es")
public class EsController {

	@Autowired
    private ElasticsearchTemplem personRepository;
    /**
     * 查询操作
     * @param
     * @return
     */
	@GetMapping("findAll")
    public Object findAll() {
        // 查找所有
		Response response=new Response();
        Iterable<Person> list = personRepository.findAll();
        response.setData(list);
        response.setMessage("请求成功");
        response.setCode(200);
 
        return response;
    }
	
	
	
	@GetMapping("/pageQuery")
    public Object pageQuery(@RequestParam("page")Integer page,@RequestParam("pagesize")Integer pagesize) {
        // 查找所有
		Response response=new Response();
		 Pageable pageable = new PageRequest(page, pagesize);
		Page<Person> personPage= personRepository.search(null,pageable);
        response.setData(personPage.getContent());
        response.setMessage("请求成功");
        response.setCode(200);
        return response;
    }
	
	
	//查询
    @RequestMapping("/query/{id}")
    public Person query(@PathVariable("id")String id){

    	Optional<Person> persion=personRepository.findById(id);
        System.err.println(new Gson().toJson(persion));

        return persion.get();
    }
    

}
