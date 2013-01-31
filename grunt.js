module.exports = function(grunt) {
    grunt.loadNpmTasks('grunt-coffee');
    grunt.initConfig({
	coffee: {
	    app: {
		bin: '/home/nick/node-priject/node_modules/grunt-coffee/node_modules/coffee-script/bin/coffee',
		src: '/home/nick/node-project/coffee/*.coffee',
		dest: '/home/nick/node-project/build/'
	    }
	},
	
	lint:{
	    all: ['build/*.js']
	}
    });
    grunt.registerTask('default', 'coffee lint');
}