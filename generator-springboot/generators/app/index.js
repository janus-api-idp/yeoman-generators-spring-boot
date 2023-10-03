"use strict";
const Generator = require("yeoman-generator");
const prompts = require('./prompts');
const shell = require('shelljs');

module.exports = class extends Generator {
 constructor(args, opts) {
    super(args, opts);
    this.configOptions = this.options.configOptions || {};
  }

 initializing() {
    this.log("Generating HydroQuebec OpenApi Spec with SpringBoot Application");
  }

 get prompting() {
        return prompts.prompting;
    }

 writing() {
    this.fs.copyTpl(
      this.templatePath("pom.xml.tpl"),
      this.destinationPath(this.configOptions.appName + "/pom.xml"),
      {
        appName: this.configOptions.appName,
	packageName: this.configOptions.packageName,
	packageType: this.configOptions.packageType,
	isSpringDataRequired : this.configOptions.isSpringDataRequired,
	specFileName: this.configOptions.specFileName
      }
    );

   this.fs.copyTpl(
      this.templatePath(this.configOptions.specFileName + ".tpl"),
      this.destinationPath(this.configOptions.appName + "/" + this.configOptions.specFileName),
      {
        appName: this.configOptions.appName
      }
    );

  }

  end() {
	this.log(`Running Maven to generate Java code source... `);
	const command = this._isWin() ? 'mvn' : './mvn';
	this.log(`Running command : ${command} to build the project`);
	shell.cd(`${this.configOptions.appName}`);
	shell.exec(`${command} clean compile`);
	this.log(`Done Running Maven...`);
    this.log(`Application ${this.configOptions.appName} with the package name ${this.configOptions.packageName} and package type ${this.configOptions.packageType} and spec ${this.configOptions.specFileName} generated successfully`);

  }

    _isWin() {
        return process.platform === 'win32';
    }
};