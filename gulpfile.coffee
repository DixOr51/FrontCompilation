# Config
path =
  css: "css/",
  js: "js/",
  scss: "sass/",
  img: "img/",
  dist: "dist/",


# Require
gulp = require('gulp')
browserSync = require('browser-sync')
gulpif = require('gulp-if')
$ = require('gulp-load-plugins')()


# Tasks
gulp.task 'sass', ->
  gulp.src "#{path.scss}*.scss"
    .pipe $.sass()
      .on 'error', $.sass.logError
    .pipe $.autoprefixer
      browsers: ['last 2 versions']
    .pipe gulp.dest path.css
    .pipe $.size()
    .pipe browserSync.reload(stream: true)


gulp.task 'coffee', ->
  gulp.src('js/*.coffee')
    .pipe $.coffee
      bare: true
    .pipe gulp.dest('js');


gulp.task "copyNoRetina", ->
  dest = "#{path.img}icons"
  gulp.src "#{path.img}icons/@2x/*.png"
    .pipe $.changed dest
    .pipe $.imageResize {width: '50%', height: '50%', imageMagick: true}
    .pipe gulp.dest dest


gulp.task 'sprite', ['copyNoRetina'], ->
  gulp.src "#{path.img}icons/@2x/*.png"
    .pipe $.spritesmith {imgName: "sprite@2x.png", cssName: "_sprite.scss"}
    .img.pipe gulp.dest path.img

  sprite = gulp.src "#{path.img}icons/*.png"
    .pipe $.spritesmith
      imgName: "sprite.png"
      cssName: "_sprite.scss"
      cssSpritesheetName: 'sprite'
      cssTemplate: "#{path.scss}tools/_sprite.scss.mustache"

  sprite.img.pipe gulp.dest path.img
  sprite.css.pipe gulp.dest "#{path.scss}tools/"


gulp.task 'export', ['coffee', 'sass', 'sprite', 'clean'], ->
  gulp.src "#{path.img}**/*"
    .pipe $.imagemin()
    .pipe gulp.dest "#{path.dist}img"

  gulp.src '*.html'
    .pipe $.useref()
    .pipe gulpif '*.js', $.uglify()
    .pipe gulpif '*.css', $.cleanCss()
    .pipe gulp.dest path.dist


gulp.task 'clean', ->
  gulp.src(path.dist, {read: false}).pipe $.clean()


gulp.task 'default', ['coffee', 'sass', 'sprite'], ->
  browserSync
    notify: false
    server: {baseDir: './'}
  gulp.watch ['*.html'], browserSync.reload
  gulp.watch "#{path.img}icons/@2x/*.png", ['sprite']
  gulp.watch "#{path.scss}**/*.scss", ['sass']
  gulp.watch "#{path.js}**/*.coffee", ['coffee']
