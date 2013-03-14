module.exports = (grunt) ->
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.initConfig
        coffee: 
            compile: 
                files: 'build/*.js': 'src/**/*.coffee'
        less: 
            all: 
                files:  "build/public/*.css" : "src/public/**/*.less" 
                options:
                    compress:true
        clean:
            all:"build/"
        watch: 
            public_files: 
              files: ['src/**/*.coffee', 'src/public/**/*.less'],
              tasks: ['build']            
        copy: 
            all: 
                files: [
                    src: ['src/public/css/*.css']
                    dest: 'build/public/'
                ]
    
    grunt.registerTask 'default', ["clean", "coffee", "less", "copy", "watch"]
    grunt.registerTask 'build', ["clean", "coffee", "less", "copy"]