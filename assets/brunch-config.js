exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
    joinTo: {
      'js/app.js': /(js)/,
      'js/vendor.js': /(vendor|vendor\/now-ui-kit|node_modules).*/
    },
      order: {
        after: [
          "js/app.js",
          "js/vendor.js"
        ]
      }
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        after: ["priv/static/css/app.scss", ""] // concat app last
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
      "fonts": ["node_modules/font-awesome/fonts", "node_modules/now-ui-kit/assets/fonts"]
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
