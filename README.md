# Yeoman Generators for Spring Boot

In order to setup the required dependencies:

We have to install the following  : 

1. `npm install --save yeoman-generator@4.12.0`

2. `npm link`

3. `npm install -g yo`

4. `npm install -g shelljs`


You have to install JDK 1.8 required to build the sources and add the environment variable JAVA_HOME to that installed path

You will need to setup maven as well to build and generate the source code

You have to put the pom template and the yaml spec template under the folder generator-springboot\generators\app\templates

Once during execution, you will be asked to provide the name of the spec file yaml (e.g. : employee.yaml)

Here is the sequence of execution :

Generating OpenApi Spec with SpringBoot Application
? What is the application name ? hydroquebec
? What's your package application name ? qc.hydroquebec.employee
? What's your package type ? jar
? Is Spring Data Required as well (y/n) ? y
? What's your input spec file name ? employee.yaml
   create hydroquebec\pom.xml
   create hydroquebec\employee.yaml
Running Maven to generate Java code source...
Running command : mvn to build the project
[INFO] Scanning for projects...
[INFO]
[INFO] ----------------< qc.hydroquebec.employee:hydroquebec >-----------------
[INFO] Building hydroquebec 1.0.0
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] --- maven-clean-plugin:3.0.0:clean (default-clean) @ hydroquebec ---
[INFO]
[INFO] --- openapi-generator-maven-plugin:4.3.1:generate (default) @ hydroquebec ---
[INFO] No .openapi-generator-ignore file found.
[INFO] OpenAPI Generator: spring (server)
[INFO] Generator 'spring' is considered stable.
[INFO] ----------------------------------
[INFO] Environment variable JAVA_POST_PROCESS_FILE not defined so the Java code may not be properly formatted. To define it, try 'export JAVA_POST_PROCESS_FILE="/usr/local/bin/clang-format -i"' (Linux/Mac)
[INFO] NOTE: To enable file post-processing, 'enablePostProcessFile' must be set to `true` (--enable-post-process-file for CLI).
[INFO] Processing operation getEmployees
[INFO] Processing operation addEmployee
[WARNING] 'scheme' not defined in the spec (2.0). Default to [http] for server URL [http://api/v1]
[WARNING] 'scheme' not defined in the spec (2.0). Default to [http] for server URL [http://api/v1]
[WARNING] 'scheme' not defined in the spec (2.0). Default to [http] for server URL [http://api/v1]
[INFO] writing file C:\Users\elbion\Documents\REDHAT Repos\yeoman-generators-spring-boot\generator-springboot\hydroquebec\src\main\java\qc\hydroquebec\employee\model\Employee.java
...
...
ava/qc/hydroquebec/employee/RFC3339DateFormat.java: C:\Users\elbion\Documents\REDHAT Repos\yeoman-generators-spring-boot\generator-springboot\hydroquebec\src\main\java\qc\hydroquebec\employee\RFC3339DateFormat.java uses or overrides a deprecated API.
[INFO] /C:/Users/elbion/Documents/REDHAT Repos/yeoman-generators-spring-boot/generator-springboot/hydroquebec/src/main/java/qc/hydroquebec/employee/RFC3339DateFormat.java: Recompile with -Xlint:deprecation for details.
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  14.272 s
[INFO] Finished at: 2023-10-03T09:17:48-04:00
[INFO] ------------------------------------------------------------------------
Done Running Maven...
Application hydroquebec with the package name qc.hydroquebec.employee and package type jar and spec employee.yaml generated successfully


To execute the generator, run:

`yo springboot`


