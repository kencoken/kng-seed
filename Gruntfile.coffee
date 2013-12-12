module.exports = (grunt) ->

  grunt.option "coffeeDir", "app/js"
  grunt.option "jsDir", "app/js"
  grunt.option "lessDir", "app/css/less"
  grunt.option "cssDir", "app/css"

  grunt.option "unitTestDir", "test/unit"
  grunt.option "e2eTestDir", "test/e2e"

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      compile:
        expand: true
        cwd: "<%= grunt.option('coffeeDir') %>"
        src: ["**/*.coffee"]
        dest: "<%= grunt.option('jsDir') %>"
        ext: ".js"

    less:
      options:
        paths: ["<%= grunt.option('lessDir') %>"]
      compile:
        files:
          "<%= grunt.option('cssDir') %>/main.css": "<%= grunt.option('lessDir') %>/main.less"

    karma:
      options:
        autoWatch: false
        browsers: ["Chrome"]
        plugins: [
          "karma-coffee-preprocessor"
          "karma-junit-reporter"
          "karma-chrome-launcher"
          "karma-firefox-launcher"
          "karma-phantomjs-launcher"
          "karma-jasmine"
          "karma-ng-scenario"
        ]
      unit:
        singleRun: true
        configFile: 'test/karma.conf.coffee'
      e2e:
        singleRun: true
        configFile: 'test/karma-e2e.conf.coffee'
        
    watch:
      coffee:
        files: ["<%= grunt.option('coffeeDir') %>/**/*.coffee"]
        tasks: ["coffee"]
        options:
          livereload: true
      less:
        files: ["<%= grunt.option('lessDir') %>/**/*.less"]
        tasks: ["less"]
        options:
          livereload: true
      karma:
        files: [
          "<%= grunt.option('jsDir') %>/**/*.js"
          "<%= grunt.option('unitTestDir') %>/**/*.coffee"
          "<%= grunt.option('e2eTestDir') %>/**/*.coffee"
        ]
        tasks: ["karma:unit:run"]

    clean: [
      "<%= grunt.option('jsDir') %>/**/*.js"
      "<%= grunt.option('cssDir') %>/main.css"
    ]

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-karma"

  grunt.registerTask "default", ["coffee", "less"]
  grunt.registerTask "test", ["coffee", "less", "karma:unit"]
