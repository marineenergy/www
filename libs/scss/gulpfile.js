var gulp = require('gulp'),
    compass = require('compass-importer'),
    sass = require('gulp-sass'),
    postcss = require('gulp-postcss'),
    autoprefixer = require('autoprefixer'),
    cssnano = require('cssnano'),
    sourcemaps = require('gulp-sourcemaps'),
    cleanCSS = require('gulp-clean-css'),
    imagemin = require('gulp-imagemin'),
    concat = require('gulp-concat'),
    rename = require('gulp-rename'),
    uglify = require('gulp-uglify'),
    strip = require('gulp-strip-comments'),
    browserSync = require('browser-sync').create();

var paths = {
    styles: {
        watch: './src/**/*',
        src: './src/*.scss',
        dest: '../'
    },
};

var sassOptions = {
  errLogToConsole: true,
  outputStyle: 'compressed',
  importer: compass
};

function styles() {
    return gulp
        .src(paths.styles.src)
        // .pipe(sourcemaps.init())
        .pipe(sass({
          errLogToConsole: false,
          outputStyle: 'expanded',
          importer: compass
        }))
        .on('error', sass.logError)
        .pipe(postcss([autoprefixer(), cssnano()]))
        .pipe(cleanCSS())
        // .pipe(sourcemaps.write())
        .pipe(gulp.dest(paths.styles.dest))
        .pipe(browserSync.stream());
}

function reload() {
    browserSync.reload({ stream: true });
}

function watch() {
    // browserSync.init({
    //     proxy: 'mhk:8888'
    // });
    gulp.watch(paths.styles.watch, styles);
}
 
exports.watch = watch;
exports.style = styles;

var build = gulp.parallel(watch);
 
gulp.task('default', build);