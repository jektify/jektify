// Script: gulpfile.js
// by: William C. Canin

const { src, dest, series } = require('gulp');
const uglify = require('gulp-uglify');
const rename = require('gulp-rename');

// Função para processar JS
function javascripts() {
  return src('src/js/jektify.js')      // arquivo de entrada
    .pipe(rename({ suffix: '.min' }))  // adiciona .min
    .pipe(uglify())                     // minifica
    .pipe(dest('assets/vendor/jektify/js')); // pasta de saída
}

// Task build
const build = series(javascripts);

// Exporta tasks
exports.js = javascripts;
exports.build = build;
exports.default = build;