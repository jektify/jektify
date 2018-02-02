/*
File: gulpfile.babel.js
Description: Script for tasks in Gulp (using ES6)
License: MIT
-----------------------------------------------------------
Author: William Canin
-----------------------------------------------------------
*/

/* Note: Due to a bug, the use of ES6 and Babel must be version 3.9.0 of Gulp.*/

/* LOAD PLUGINS
______________________________________________________________________________________ */

    import gulp from 'gulp'; // v3.9.0
    import jshint from 'gulp-jshint';
    import uglify from 'gulp-uglify';
    import rename from 'gulp-rename';
    import babel from 'gulp-babel';


    const APP_VERSION = "1.0.0";

/* COMPRESS JAVASCRIPTS
______________________________________________________________________________________ */

    gulp.task('javascripts', (cb) => {
      return gulp.src('src/dev/js/jektify.js')
        .pipe(jshint())
        .pipe(rename({ suffix: '.min' }))
        .pipe(babel({
          "presets": ["env"]
        }))
        .pipe(uglify())
        .pipe(gulp.dest('assets/js'))
    });

/* TASKS DEFAULTS
______________________________________________________________________________________ */

    gulp.task('default', ['javascripts']);
