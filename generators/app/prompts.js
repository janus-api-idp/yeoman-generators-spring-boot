module.exports = {
  prompting
};

function prompting() {
  const done = this.async();
  const prompts = [
    {
      type: "string",
      name: "appName",
      message: "What is the application name ?",
      default: "openapi-spring"
    },
    {
      type: "string",
      name: "packageName",
      message: "What's your package application name ?",
      default: "com.redhat.employee"
    },
    {
      type: "string",
      name: "packageType",
      message: "What's your package type ?",
      default: "jar"
    },
    {
      type: "string",
      name: "isSpringDataRequired",
      message: "Is Spring Data Required as well (y/n) ?",
      default: "y"
    }

  ];

  this.prompt(prompts).then(answers => {
    Object.assign(this.configOptions, answers);
    done();
  });
}