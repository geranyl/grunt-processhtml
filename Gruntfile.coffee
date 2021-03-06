# grunt-processhtml
# https://github.com/dciccale/grunt-processhtml
#
# Copyright (c) 2013 Denis Ciccale (@tdecs)
# Licensed under the MIT license.
# https://github.com/dciccale/grunt-processhtml/blob/master/LICENSE-MIT

"use strict"

module.exports = ->

  @initConfig
    jshint:
      all: ["tasks/**/*.js", "<%= nodeunit.tests %>"]
      options:
        jshintrc: ".jshintrc"

    processhtml:
      dev:
        options:
          data:
            message: "This is dev target"

        files:
          "test/fixtures/dev/index.processed.html": ["test/fixtures/index.html"]

      dist:
        options:
          process: true
          data:
            title: "My app"
            message: "This is dist target"

        files:
          "test/fixtures/dist/index.processed.html": ["test/fixtures/index.html"]

      custom:
        options:
          templateSettings:
            opener: '{{'
            closer: '}}'
          data:
            message: "This has custom delimiters for the template"

        files:
          "test/fixtures/custom/custom.processed.html": ["test/fixtures/custom.html"]

    nodeunit:
      tests: ["test/*_test.js"]

  @loadTasks "tasks"

  @loadNpmTasks "grunt-contrib-jshint"
  @loadNpmTasks "grunt-contrib-nodeunit"

  @registerTask "test", ["processhtml", "nodeunit"]
  @registerTask "default", ["jshint", "test"]
