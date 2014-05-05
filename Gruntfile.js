module.exports = function (grunt) {
	grunt.initConfig(gruntInitConfig(grunt));
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.registerTask('default',['watch']);
	grunt.event.on('watch',function(action,filepath,target){
		grunt.log.writeln(target + ': ' + filepath + ' has ' + action);
		switch (filepath) {
			case 'Blade.as': 
				var options = {
					cmd: '../apache-flex-sdk/bin/mxmlc',
					// width, height
					args: ['-use-network=false','-default-size','600','340','./Blade.as']
				};
				grunt.util.spawn(options,onDone);
			break;
			case 'Blade.swf':
				var options = {
					cmd: 'open',
					args: ['./Blade.swf','-a','Adobe Flash CS5']
				};
				grunt.util.spawn(options,onDone);
			break;
			default: break;
		}
	});
}

function onDone (e,r,c) {
	if (e) {
		console.log('>> onDone: Error: Code:'+c+': '+e);
	} else {
		if (r.stderr != '') {
			process.stdout.write('>> Error: Code:'+c+': '+r.stderr+'\n');
		} else {
			process.stdout.write('>> Success: '+r.stdout+'\n');
		}
	}
}

function gruntInitConfig (grunt) {
	return {
		pkg: grunt.file.readJSON('package.json'),
		watch: {
			scripts: {
				files: ['Blade.as','Blade.swf','Gruntfile.js']
			}
		}
	};
}