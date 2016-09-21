var fs = require('fs');
var path = require('path');
var fse = require('fs-extra');
var artRend = require('./bin/render');

// 渲染页面
var inpath = path.resolve(__dirname,'./src');
var outpath = path.resolve(__dirname,'./dist');
fse.ensureDir(outpath, function(err){
	artRend(inpath,outpath);
});
