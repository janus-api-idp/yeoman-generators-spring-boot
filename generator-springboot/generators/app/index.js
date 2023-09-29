"use strict";
const Generator = require("yeoman-generator");
const prompts = require('./prompts');

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
      this.destinationPath("skeleton/pom.xml"),
      {
        appName: this.configOptions.appName,
	packageName: this.configOptions.packageName,
	packageType: this.configOptions.packageType,
	isSpringDataRequired : this.configOptions.isSpringDataRequired
      }
    );

  }

  end() {
    this.log(`Application ${this.configOptions.appName} with the package name ${this.configOptions.packageName} and package type ${this.configOptions.packageType} generated successfully`);

  }

};