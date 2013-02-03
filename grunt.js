module.exports = function(grunt) {
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-contrib-less')
    grunt.loadNpmTasks('grunt-contrib-clean')
    grunt.initConfig({

	coffee: {
	    compile: {
		files: {
		    'build/*.js': 'src/*.coffee'
		}
	    }
	},
	
	less: {
	    all: {
		files: { "build/public/*.css" : "src/public/*.less" },
		options:{
		    compress:true
		}
	    }
	},

	lint:{
	    all: ['build/*.js']
	},

	clean:{
	    all:"build/"
	}
    });
    grunt.registerTask('default', 'clean coffee less lint');
}