module.exports = function(grunt) {
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.initConfig({

        coffee: {
            compile: {
                files: {
                    'build/*.js': 'src/**/*.coffee'
                }
            }
        },
        
        less: {
            all: {
                files: { "build/public/*.css" : "src/public/**/*.less" },
                options:{
                    compress:true
                }
            }
        },

        lint:{
            all: ['build/**/*.js']
        },

        clean:{
            all:"build/"
        },
        watch: {
            public_files: {
              files: ['src/**/*.coffee', 'src/public/**/*.less'],
              tasks: ['build']
            }
        },
        copy: {
            all: {
                files: {
                    'build/public/images/': 'src/public/images/**',
                    'build/public/': 'src/public/css'
                }
            }
        }
    });
    grunt.registerTask('default', 'clean coffee less lint watch');
    grunt.registerTask('build', 'clean coffee less lint');
};