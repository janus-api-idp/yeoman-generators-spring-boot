<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId><%= packageName %></groupId>
    <artifactId><%= appName %></artifactId>
    <packaging><%= packageType %></packaging>
    <name><%= appName %></name>
    <version>1.0.0</version>
    <properties>
        <java.version>1.8</java.version>
        <maven.compiler.source>${java.version}</maven.compiler.source>
        <maven.compiler.target>${java.version}</maven.compiler.target>
        <springfox-version>2.8.0</springfox-version>
    </properties>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.0.1.RELEASE</version>
    </parent>
    <build>
        <sourceDirectory>src/main/java</sourceDirectory>
        <defaultGoal>spring-boot:run</defaultGoal>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
            <plugin>
                <groupId>org.openapitools</groupId>
                <artifactId>openapi-generator-maven-plugin</artifactId>
                <version>4.3.1</version>
                <executions>
                    <execution>
                        <phase>generate-sources</phase>
                        <goals>
                            <goal>generate</goal>
                        </goals>
                        <configuration>
                            <generatorName>spring</generatorName>
                            <library>spring-boot</library>
                            <output>${project.basedir}</output>
                            <inputSpec>
                                <%= specFileName %>
                            </inputSpec>

                            <configOptions>
                                <serializableModel>true</serializableModel>
                                <artifactId>${project.artifactId}</artifactId>
                                <groupId>${project.groupId}</groupId>
                                <version>${project.version}</version>
                                <dateLibrary>java8</dateLibrary>
                                <sourceFolder>src/main/java</sourceFolder>
                                <basePackage><%= packageName %></basePackage>
                                <invokerPackage><%= packageName %></invokerPackage>
                                <configPackage><%= packageName %>.config</configPackage>
                                <modelPackage><%= packageName %>.model</modelPackage>
                                <apiPackage><%= packageName %>.api</apiPackage>
                            </configOptions>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <!--SpringFox dependencies -->
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
            <version>${springfox-version}</version>
        </dependency>
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger-ui</artifactId>
            <version>${springfox-version}</version>
        </dependency>
        <dependency>
            <groupId>javax.xml.bind</groupId>
            <artifactId>jaxb-api</artifactId>
            <version>2.2.11</version>
        </dependency>
        <dependency>
            <groupId>com.fasterxml.jackson.datatype</groupId>
            <artifactId>jackson-datatype-jsr310</artifactId>
        </dependency>
        <dependency>
            <groupId>org.openapitools</groupId>
            <artifactId>jackson-databind-nullable</artifactId>
            <version>0.1.0</version>
        </dependency>
    <!-- Bean Validation API support -->
        <dependency>
            <groupId>javax.validation</groupId>
            <artifactId>validation-api</artifactId>
        </dependency>

<%_ if (isSpringDataRequired === 'y') { _%>
        <!-- JPA Dependency -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
            <version>2.3.0.RELEASE</version>
        </dependency>
<%_ } _%>

    </dependencies>
</project>
