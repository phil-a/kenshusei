exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
    joinTo: {
      "js/app.js": ["js/app.js"],
      "js/jquery.3.2.1.min.js": ["vendor/core/jquery.3.2.1.min.js"],      
      "js/now-ui-kit.js": ["vendor/now-ui-kit.js"],
      "js/bootstrap.min.js": ["vendor/core/bootstrap.min.js"],
      "js/popper.min.js": ["vendor/core/popper.min.js"],
      "js/bootstrap-switch.js": ["vendor/plugins/bootstrap-switch.js"],
      "js/bootstrap-datepicker.js": ["vendor/plugins/bootstrap-datepicker.js"],
      "js/jquery.sharrre.js": ["vendor/plugins/jquery.sharrre.js"],
      "js/nouislider.min.js": ["vendor/plugins/nouislider.min.js"]
    },
      order: {
        after: [
          "js/app.js",
          "js/now-ui-kit.js"
        ]
      }
    },
    stylesheets: {
      joinTo: {
        "css/app.css": ["css/app.scss"],
        "css/bootstrap.min.css": ["vendor/core/bootstrap.min.css"],
        "css/demo.css": ["vendor/core/demo.css"],
        "css/now-ui-kit.css": ["vendor/now-ui-kit.css"],
      },
      order: {
        after: ["css/app.css", "css/now-ui-kit.css"] // concat app last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/assets/static". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(static)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    },
    copycat: {
      "fonts": ["node_modules/font-awesome/fonts", "static/fonts"]
    },
    sass: {
      options: {
        includePaths: ["node_modules/bootstrap/scss", "node_modules/font-awesome/scss", "node_modules/now-ui-kit/assets/sass"],
        precision: 8
      }
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },

  npm: {
    enabled: true,
    globals: {
      $: 'jquery',
      jQuery: 'jquery',
      Tether: 'tether',
      Popper: 'popper.js',
      bootstrap: 'bootstrap'
    }
  }
};
