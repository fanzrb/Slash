sourceDir = 'browser/src'
destDir = 'browser/assets'
viewsDir = 'browser'

gulp = require 'gulp'
clean = require 'gulp-clean'
jade = require 'gulp-jade'
less = require 'gulp-less'
coffee = require 'gulp-coffee'

gulp.task 'clean', ->
    gulp.src([destDir, "#{viewsDir}/*.html"]).pipe(clean())

gulp.task 'html', ->
    gulp.src "#{sourceDir}/jade/**/*.jade"
        .pipe jade()
        .pipe gulp.dest viewsDir

gulp.task 'css', ->
    gulp.src "#{sourceDir}/less/importer.less"
        .pipe less()
        .pipe gulp.dest "#{destDir}/css"

gulp.task 'js', ->
    gulp.src "#{sourceDir}/coffee/**/*.coffee"
        .pipe coffee()
        .pipe gulp.dest("#{destDir}/js")

gulp.task 'static', ->
    gulp.src "#{sourceDir}/static/**"
        .pipe gulp.dest "#{destDir}"

gulp.task 'main-js', ->
    gulp.src "coffee/**/*.coffee"
        .pipe coffee()
        .pipe gulp.dest "main/"

gulp.task 'default', ['html', 'static', 'js', 'css', 'main-js'], ->
    # default task

gulp.task 'watch', ['default'], ->
    gulp.watch "#{sourceDir}/coffee/**/*.coffee", ['js']
    gulp.watch "#{sourceDir}/less/**/*.less", ['css']
    gulp.watch "#{sourceDir}/jade/**/*.jade", ['html']
    gulp.watch "#{sourceDir}/static/**/*", ['static']
    gulp.watch "coffee/**/*.coffee", ['main-js']
