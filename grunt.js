module.exports = function(grunt) {
    grunt.loadNpmTasks('grunt-coffee');
    grunt.initConfig({
	coffee: {
	    app: {
		bin: 'node_modules/grunt-coffee/node_modules/coffee-script/bin/coffee',
		src: 'coffee/*.coffee',
		dest: 'build/'
	    }
	},
	
	lint:{
	    all: ['build/*.js']
	}
    });
    grunt.registerTask('default', 'coffee lint');
}