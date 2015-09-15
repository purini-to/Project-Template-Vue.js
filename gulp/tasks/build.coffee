"use strict"

gulp = require "gulp"
$ = do require "gulp-load-plugins"

settings = require "../settings"
webpackSettings = require "../webpack.settings"

# src内のファイルを対象に、webpackを通してdistディレクトリにコンパイルします
gulp.task "build:webpack", ->
  gulp.src settings.src
  .pipe $.plumber()
  .pipe $.webpack webpackSettings
  .pipe $.if settings.js.uglify, $.uglify()
  .pipe gulp.dest settings.js.dest

# src内のファイルを対象に、webpackを通してdistディレクトリにコンパイルします(jsをminify化する)
gulp.task "build:webpack:minify", ->
  settings.js.uglify = true
  gulp.start "build:webpack"

# src内のファイルを対象に、distディレクトリにstylusをコンパイルします
gulp.task "build:stylus", ->
  gulp.src settings.css.src
  .pipe $.plumber()
  .pipe $.stylus()
  .pipe $.concat settings.css.output
  .pipe $.autoprefixer settings.autoprefixer
  .pipe $.if settings.css.minify, $.minifyCss()
  .pipe gulp.dest settings.css.dest

# src内のファイルを対象に、distディレクトリにstylusをコンパイルします(cssをminify化する)
gulp.task "build:stylus:minify", ->
  settings.css.minify = true
  gulp.start "build:stylus"

# src内のファイルを対象に、distディレクトリにjadeをコンパイルします
gulp.task "build:jade", ->
  gulp.src settings.html.src
  .pipe $.plumber()
  .pipe $.jade()
  .pipe gulp.dest settings.html.dest

gulp.task "build", ["build:webpack", "build:stylus", "build:jade"]

gulp.task "build:minify", ["build:webpack:minify", "build:stylus:minify", "build:jade"]
