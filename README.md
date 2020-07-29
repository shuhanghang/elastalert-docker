基于[elastalert](https://github.com/Yelp/elastalert)0.2.4 [python:3.6-alpine](https://hub.docker.com/_/python)构建
## 1. 配置
以配置邮件报警为例
+ 修改config.yml
+ 修改rules目录下的规则文件(rules目录下可存在多个rule文件)
+ 修改smtp_auth文件填写发邮人用户名及密码

## 2. 运行
```shell
docker run --name elastalert-docker \
    -v `PWD`:/home/ \
    -d shuhanghang/elastalert-docker:1.0
```
