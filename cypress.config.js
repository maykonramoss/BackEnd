const { defineConfig } = require("cypress");


module.exports = defineConfig({
  waitForAnimations: false,
  animationDistanceThreshold: 50,
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
      chromeWebSecurity: false
      
  },
  
});

