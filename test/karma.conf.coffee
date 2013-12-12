module.exports = (config) ->
  config.set
    basePath: '../'
    frameworks: ['jasmine']

    files: [
      'app/vendor/angular/angular.js'
      'app/vendor/angular-mocks/angular-mocks.js'
      'app/vendor/angular-resource/angular-resource.js'
      'app/vendor/angular-cookies/angular-cookies.js'
      'app/vendor/angular-sanitize/angular-sanitize.js'
      'app/vendor/angular-route/angular-route.js'
      'app/js/**/*.js'
      'test/unit/**/*.coffee'
    ]
    exclude: [
      '**/*.min.js'
    ]