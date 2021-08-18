const { CleanWebpackPlugin } = require('clean-webpack-plugin')
const { VueLoaderPlugin } = require('vue-loader')
const helpers = require('./helpers')

module.exports = {
  // Where webpack looks to start building the bundle
  entry: {
    ['projects-import']: helpers.root('src', 'projects'),
    ['reitem-import']: helpers.root('src', 'reitems'),
    ['customers']: helpers.root('src', 'customers'),
    ['transactions']: helpers.root('src', 'transactions'),
  },

  // Where webpack outputs the assets and bundles
  output: {
    path: helpers.pluginPath('../../../../vendor/bookhouse'),
    filename: 'js/[name].js',
    assetModuleFilename: 'assets/[name][ext]',
  },

  resolve: {
    extensions: ['.js', '.jsx', '.vue', '.json'],
    alias: {
      '@': helpers.root('src'),
    },
  },

  // Determine how modules within the project are treated
  module: {
    noParse: /^(vue|vue-router|vuex|vuex-router-sync)$/,
    rules: [
      // Vuejs: Use vue-loader to transpile vue files
      { test: /\.vue$/, use: ['vue-loader'] },

      // JavaScript: Use Babel to transpile JavaScript files
      {
        test: /\.js$/,
        use: [
          {
            loader: 'babel-loader',
            options: {
              compact: false,
            },
          },
        ],
      },
      // Assets Loader test: /\.(jpg|jpeg|png|woff|woff2|eot|ttf|svg|gif)$/,
      { test: /\.(jpg|jpeg|png|woff|woff2|eot|ttf|svg|gif)$/, type: 'asset/resource' },
      // {
      //   test: /\.svg/,
      //   use: [
      //     {
      //       loader: 'svg-sprite-loader',
      //       options: {
      //         symbolId: 'flag-[name]',
      //       },
      //     },
      //   ],
      // },
    ],
  },

  // Customize the webpack build process
  plugins: [
    // Vue Loader Plugin
    new VueLoaderPlugin(),

    // Removes/cleans build folders and unused assets when rebuilding
    new CleanWebpackPlugin(),
  ],
}
