"use strict"

webpack = require("gulp-webpack").webpack
BowerWebpackPlugin = require "bower-webpack-plugin"
path = require "path"

s = require "./settings"

module.exports = {
  # entryポイントを指定、複数指定できます
  entry:
    app: "#{s.src}/js/entry/app.coffee"

  # 出力先の設定
  output:
    filename: "[name].js"

  # ファイル名の解決を設定
  resolve:
    root: [path.join(__dirname, "bower_components")]
    moduleDirectories: ["bower_components"]
    extensions: ["", ".js", ".coffee", ".webpack.js", ".web.js"]

  # .coffeeをcoffee-loaderに渡すように
  # 他にもhtmlやcssを読み込む必要がある場合はここへ追記
  module:
    loaders: [
      {test: /\.coffee$/, loader: "coffee-loader"}
    ]

  # webpack用の各プラグイン
  plugins: [
    # bower.jsonにあるパッケージをrequire出来るように
    new BowerWebpackPlugin()
  ]
}
