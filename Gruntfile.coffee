_ = require("underscore")
_.str = require("underscore.string")
_.mixin _.str.exports()
module.exports = (grunt) ->

    allLessFiles = (lessDir, cssDir) ->
        allLessFiles = undefined
        result = {}
        lessDir = _(lessDir).trim("/") + "/"
        cssDir = _(cssDir).trim("/") + "/"
        allLessFiles = grunt.file.expand(lessDir + "**/*.less")
        _(allLessFiles).each (filename) ->
            cssFileName = cssDir + _(filename).chain().strRight(lessDir).strLeftBack(".less").value() + ".css"
            result[cssFileName] = filename
        return result

    allCoffeeScript = (coffeeDir, jsDir) ->
        allCSFiles = undefined
        result = {}
        coffeeDir = _(coffeeDir).trim("/") + "/"
        jsDir = _(jsDir).trim("/") + "/"
        allCSFiles = grunt.file.expand(coffeeDir + "**/*.coffee")
        _(allCSFiles).each (filename) ->
            jsFileName = jsDir + _(filename).chain().strRight(coffeeDir).strLeftBack(".coffee").value() + ".js"
            result[jsFileName] = filename
        return result

    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.initConfig
        coffee: 
            compile: 
                files: allCoffeeScript 'src/', 'build/'
        less: 
            all: 
                files: allLessFiles "src/", 'build/' 
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
                    expand: true
                    cwd: 'src/'
                    src: ['public/css/*.css']
                    dest: 'build/'
                ]
    
    grunt.registerTask 'default', ["clean", "coffee", "less", "copy", "watch"]
    grunt.registerTask 'build', ["clean", "coffee", "less", "copy"]