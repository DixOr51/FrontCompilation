#FRONT COMPILATION (lang: FR)

  - gulp : -{ Permet de watch les fichiers et les updates (Build des fichier .scss + .coffee en .css ou .js).
           -{ Permet de sprite les icons dans img/icons/@2x (Taille normal car size / 2 pour les écrans retina).
           -{ Permet d'ouvrir un onglet(browserSync) pour l'update du navigateur lors d'une update de fichier.

  - gulp sprite : -{ Permet de sprite les icons dans img/icons/@2x.

  - gulp sass : -{ Permet de build les fichiers .scss en css.

  - gulp coffee : -{ Permet de build les fichiers .coffee en js.

  - gulp copyNoRetina : -{ Permet de resize les imgs pour les écrans retina.

  - gulp export : -{ Permet de compiler les fichiers .css en .min.css
                  -{ Minifie les images
                  -{ Update des links dans .html
