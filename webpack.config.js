var Encore = require('@symfony/webpack-encore');
const path = require('path');
Encore
    .setOutputPath('public/build/')
    .setPublicPath('/build')
    .addEntry('app', './assets/js/app.js')
    .splitEntryChunks()
    .enableSingleRuntimeChunk()
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    .enableVersioning(Encore.isProduction())
    .configureBabel(() => {}, {
        useBuiltIns: 'usage',
        corejs: 3
    })
    .enableSassLoader()
    .enableVueLoader();

Encore.addAliases({
    '@symfony/stimulus-bridge/controllers.json': path.resolve(__dirname, 'assets/controllers.json')
});

module.exports = Encore.getWebpackConfig();