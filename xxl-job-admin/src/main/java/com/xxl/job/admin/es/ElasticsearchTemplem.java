package com.xxl.job.admin.es;

import java.util.Optional;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import com.xxl.job.admin.core.model.Person;

@Configuration
public interface ElasticsearchTemplem extends ElasticsearchRepository<Person,String> {

	Optional<Person> findById(String id);






	

}
