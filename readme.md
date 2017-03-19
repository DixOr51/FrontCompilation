##FRONT COMPILATION

  - gulp : - Watch files and compile (.scss in .css and .coffee in .js).
           - Sprite all icons in img/icons/@2x (Folder for normal images because they are resize (/2) in img/icons/ for retina  screens).
           - Open a a new tab(browserSync) which is refreshed has every update of line of code

  - gulp sprite :Ssprite icons.

  - gulp sass : Transform .scss en css.

  - gulp coffee : Transform .coffee en js.

  - gulp copyNoRetina : Resize images for retina screens.

  - gulp export : - compile all file .css in .min.css (dist/css)
                  - Minify images (dist/img)
                  - Update links in .html
