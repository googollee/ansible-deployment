# 基于Ansible的部署框架

## 概念

### 阶段Stage

定义不同的部署阶段，一般为test/canary/prod。

### 环境Env

定义不同的部署环境。有时候不同的部署阶段需要使用相同的部署环境。

比如对于canary阶段，一般会使用和prod阶段一致的环境，这时就可以准备一个prod环境，让canary/prod阶段都是用prod环境的变量定义。

## 目录结构

- service1

  用来保存服务相关的配置文件模版，以及生成的配置文件。

  - stage.*.yaml

    定义不同stage的变量。 其中`include_env`表示需要引入不同名的env环境。如果不指定`include_env`，默认使用同名环境对应的变量。

  - env.*.yaml

    定义不同env的变量。

  - confs
  
    保存配置模版。模版会根据stage以及env定义的变量，声称配置文件。

  - generated

    生成后的配置文件。

## 命令

### 生成配置`make`

对confs或者变量定义改动后，执行`make`，根据最新文件生成配置文件。

配置文件在签入前生成。

### 检查配置`make check`

检查生成的文件和模版以及变量是否一致。

用于提交后的CI，检查文件是否为最新生成的。
