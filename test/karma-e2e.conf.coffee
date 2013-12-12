module.exports = (config) ->
  config.set
    basePath: '../'
    frameworks: ['ng-scenario']

    port: 8000

    files: [
      'test/e2e/**/*.js'
    ]
    exclude: [
      '**/*.min.js'
    ]