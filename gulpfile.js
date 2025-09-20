// Script: gulpfile.js
// by: William C. Canin

const { src, dest, series } = require('gulp');
const uglify = require('gulp-uglify');
const rename = require('gulp-rename');

// Função para processar JS
function javascripts() {
  return src('src/js/jektify.js')
    .pipe(rename({ suffix: '.min' }))
    .pipe(uglify())
    .pipe(dest('assets/vendor/jektify/js'));
}

// Task build
const build = series(javascripts);

// Exports
exports.js = javascripts;
exports.build = build;
exports.default = build;