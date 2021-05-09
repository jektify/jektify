// Script: gulpfile.js
// by: William C. Canin

let gulp = require('gulp');
let babel = require('gulp-babel');
let uglify = require('gulp-uglify');
let rename = require('gulp-rename');

// function javascripts
function javascripts() {
  return gulp
    .src('src/js/jektify.js')
    .pipe(rename({ suffix: ".min" }))
    .pipe(babel({
        presets: ['@babel/env']
    }))
    .pipe(uglify())
    .pipe(gulp.dest('assets/vendor/jektify/js'))
}


// task build
const build = gulp.series(gulp.parallel(javascripts));

// export tasks
exports.js = javascripts;
exports.build = build;
exports.default = build;
