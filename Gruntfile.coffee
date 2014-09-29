module.exports = (grunt) ->
  'use strict'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    # "watch"-task configuration
    watch:
      uglify:
        files: 'js/*.js'
        tasks: 'uglify'
      cssmin:
        files: 'css/*.css'
        tasks: 'cssmin'

    # "cssmin"-task configuration
    cssmin:
      options:
        keepSpecialComments: 0
      main:
        files:
          'dist/css/main.min.css': [
            'css/main.css'
            'css/bootstrap.min.css'
            'css/bootstrap-responsive.min.css'
          ]

    # "uglify"-task configuration
    uglify:
      options:
        keepSpecialComments: 0
      yaaw:
        files:
          'dist/js/yaaw.min.js': [
            'js/jquery-1.7.2.min.js'
            'js/bootstrap.min.js'
            'js/jquery.jsonrpc.js'
            'js/jquery.Storage.js'
            'js/jquery.base64.min.js'
            'js/mustache.js'
            'js/peerid.js'
            'js/aria2.js'
            'js/yaaw.js'
          ]

    # "copy"-task configuration
    copy:
      img:
        expand: true
        src: 'img/*'
        dest: 'dist/'

  # load all grunt tasks
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  # all aliases task
  grunt.registerTask 'copy-img', 'copy:img'
  grunt.registerTask 'dist-watch', 'watch'
  grunt.registerTask 'dist', ['copy:img', 'uglify:yaaw', 'cssmin:main']
