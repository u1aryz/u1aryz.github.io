module.exports = (grunt) ->
  require('load-grunt-tasks') grunt,
    pattern: 'grunt-*'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    compass:
      dist:
        options:
          sassDir: 'scss'
          cssDir: 'css'
          bundleExec: true

    watch:
      css:
        files: ["<%= compass.dist.options.sassDir %>/*.scss"]
        tasks: ['css']

    clean:
      src: ["<%= compass.dist.options.cssDir %>/*.css"]

    notify:
      compass:
        options:
          title: 'Task Complete'
          message: 'Compiling to CSS is completed.'

  grunt.registerTask 'default', ['clean', 'compass']
  grunt.registerTask 'css', ['compass', 'notify:compass']
