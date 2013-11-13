module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    connect:
      project:
        options:
          hostname: '*'
          base: 'samples/project'
          port: 9001
          keepalive: true

  grunt.registerTask 'default', ['build']
