# SSM-CRUD
### 一、环境搭建

**介绍：**框架使用SSM、数据库使用mysql、前端使用Bootstrap、Maven管理依赖

1. 创建Maven工程，在pom.xml中添加所需的依赖。
2. 在web.xml中配置spring监听器、springMVC控制器、spring编码、rest风格过滤器。
3. 在resources目录下创建applicationContext.xml、applicationContext-mvc.xml、mybatis-config.xml、dbinfo.properties.
4. 在applicationContext.xml中配置数据源(dataSource)、整合mybatis(sqlSessionFactoryBean、MapperScannerConfigurer)、事务管理(DataSourceTransactionManager)。
5. 在applicationContext-mvc.xml中配置InternalResourceViewResolver、mvc:default-servlet-handler、mvc:annotation-driven。
6. 在mybatis-config.xml中配置settings以及plugins。
7. 在dbinfo.properties中配置数据库连接文件。

### 二、效果图

- 列表页面![](https://github.com/Pu-ME/SSM-CRUD/blob/master/photo/1.png)

- 添加页面![](https://github.com/Pu-ME/SSM-CRUD/blob/master/photo/2.png)

- 编辑页面![](https://github.com/Pu-ME/SSM-CRUD/blob/master/photo/3.png)

- 批量删除![](https://github.com/Pu-ME/SSM-CRUD/blob/master/photo/4.png)

  ​

