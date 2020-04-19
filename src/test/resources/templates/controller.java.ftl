package ${package.Controller};

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import ${package.Service}.${table.serviceName};
import ${package.Entity}.${entity};
import java.util.List;


/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

	@Autowired
	public ${table.serviceName} ${table.entityPath}Service;

	/**
	 * 查询所有信息
	 * @return
	 */
	@RequestMapping("/list")
	public List<${entity}> list(){
        return ${table.entityPath}Service.list();
	}

	/**
	 * 分页查询
	 * @return
	 */
	@RequestMapping("/page")
	public IPage<${entity}> page(){
		return ${table.entityPath}Service.page(new Page<>(1,5),new QueryWrapper<${entity}>());
	}

	/**
	* 新增
	*/
	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	public boolean add(@RequestBody ${entity} ${table.entityPath}){
		return ${table.entityPath}Service.save(${table.entityPath});
	}

	/**
	* 修改
	*/
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	public boolean update(@RequestBody ${entity} ${table.entityPath}){
		return ${table.entityPath}Service.updateById(${table.entityPath});
	}

	/**
	* 删除
	*/
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public boolean delete(@RequestBody User user){
		return ${table.entityPath}Service.remove(new QueryWrapper<${entity}>());
	}
}
</#if>