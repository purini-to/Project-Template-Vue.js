"use strict"

# 出力先ディレクトリ
dest = "./app"
# ソースディレクトリ
src = "./src"

module.exports = {
  # 出力先を指定
  dest: dest
  # ソース
  src: src

  # coffeeビルドの設定
  js:
    src: "#{src}/js/**"
    dest: "#{dest}/js"
    uglify: false

  # stylusビルドの設定
  css:
    src: "#{src}/css/**/!(_)*"
    dest: "#{dest}/css"
    output: "app.css"
    autoprefixer:
      browsers: ["last 2 versions"]
    minify: false

  # htmlのビルド設定
  html:
    src: "#{src}/html/**/*.jade"
    dest: dest

  # その他の必要なファイル（画像等）
  assets:
    src: "#{src}/assets/**"
    dest: "#{dest}/assets"

  # watchタスクの監視対象を指定
  watch:
    js: "#{src}/js/**"
    css: "#{src}/css/**"
    html: "#{src}/html/**"
    assets: "#{src}/assets/**"
}
