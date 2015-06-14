# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100 foldmarker={,}: expandtab

pkgbase=gimp-elsamuko-scripts
# AUR workaround
pkgname=gimp-elsamuko-scripts
true && pkgname=(
gimp-elsamuko-scripts
gimp-script-error-level-analysis
gimp-script-up-down
gimp-script-antique-border
gimp-script-che-guevara
gimp-script-color-tint
gimp-script-cyanotype
gimp-script-difference-layers
gimp-script-erosion-sharpen
gimp-script-escape-lines
gimp-script-glass-displacement
gimp-script-film-grain
gimp-script-lomo
gimp-script-movie-300
gimp-script-national-geographic
gimp-script-obama-hope
gimp-script-first-photo-border
gimp-script-photochrom
gimp-script-rainy-landscape
gimp-script-sprocket-hole
gimp-script-sunny-landscape
gimp-script-technicolor-2-color
gimp-script-technicolor-3-color
gimp-script-white-balance-puzzle
gimp-script-vintage-look
gimp-script-split-tone
)
pkgver=0.24
pkgrel=1
pkgdesc='Varoius Gimp scripts made by elsamuko'
arch=(any)
url='https://sites.google.com/site/elsamuko/gimp'
license=('GPL')
depends=(gimp)
options=(!strip)
source=(
"elsamuko-scripts.zip::https://sites.google.com/site/elsamuko/gimp/elsamuko.zip"
https://sites.google.com/site/elsamuko/forensics/up-down-curve/elsamuko-up-down.scm
https://sites.google.com/site/elsamuko/forensics/up-down-curve/up-down
https://sites.google.com/site/elsamuko/forensics/ela/elsamuko-error-level-analysis.scm
)
# env
_scriptsdir_eval='_scriptsdir="$pkgdir"/usr/share/gimp/2.0/scripts'
package_gimp-elsamuko-scripts (){
  true && pkgdesc='Varoius Gimp scripts made by elsamuko, transition package to split build'
}
package_gimp-script-error-level-analysis (){
  true && pkgdesc='Detect image manipulations by Error Level Analysis'
  true && url='https://sites.google.com/site/elsamuko/forensics/ela'
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko-error-level-analysis.scm $_scriptsdir/elsamuko-error-level-analysis.scm
}
package_gimp-script-up-down (){
  true && pkgdesc='Detect cloning in homogenous areas is to apply a curve with extreme contrasts'
  true && url='https://sites.google.com/site/elsamuko/forensics/up-down-curve'
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko-up-down.scm $_scriptsdir/elsamuko-up-down.scm
  install -Dm644 up-down "$pkgdir"/usr/share/gimp/2.0/curves/up-down
}
package_gimp-script-antique-border (){
  true && pkgdesc='A yellowed and slightly jagged border like these of old photographies'
  true && url='https://sites.google.com/site/elsamuko/gimp/antique-border'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-antique-border.scm $_scriptsdir/elsamuko-antique-border.scm
}
package_gimp-script-che-guevara (){
  true && pkgdesc='Generates a poster like the famous Che Guevara'
  true && url='https://sites.google.com/site/elsamuko/gimp/fitzpatrick'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-che-guevara.scm $_scriptsdir/elsamuko-che-guevara.scm
}
package_gimp-script-color-tint (){
  true && pkgdesc='Filters one color and doubles it on top'
  true && url='https://sites.google.com/site/elsamuko/gimp/color-tint'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-color-tint.scm $_scriptsdir/elsamuko-color-tint.scm
}
package_gimp-script-cyanotype (){
  true && pkgdesc='Simulates a printing process from 1842'
  true && url='https://sites.google.com/site/elsamuko/gimp/cyanotype'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-cyanotype.scm $_scriptsdir/elsamuko-cyanotype.scm
}
package_gimp-script-difference-layers (){
  true && pkgdesc='Generates two difference layers from the two layers on the top'
  true && url='https://sites.google.com/site/elsamuko/gimp/difference'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-difference-layers.scm $_scriptsdir/elsamuko-difference-layers.scm
}
package_gimp-script-erosion-sharpen (){
  true && pkgdesc='Sharpens an image with the built-in GIMP plugins erode and dilate'
  true && url='https://sites.google.com/site/elsamuko/gimp/erosion-sharpen'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-erosion-sharpen.scm $_scriptsdir/elsamuko-erosion-sharpen.scm
}
package_gimp-script-escape-lines (){
  true && pkgdesc='Creates escaping lines from any point'
  true && url='https://sites.google.com/site/elsamuko/gimp/escape-line'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-escape-lines.scm $_scriptsdir/elsamuko-escape-lines.scm
}
package_gimp-script-glass-displacement (){
  true && pkgdesc='Creates a glass gravure from two layers'
  true && url='https://sites.google.com/site/elsamuko/gimp/glass'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-glass-displacement.scm $_scriptsdir/elsamuko-glass-displacement.scm
}
package_gimp-script-film-grain (){
  true && pkgdesc='Simulates the typical film grain of high ISO pictures'
  true && url='https://sites.google.com/site/elsamuko/gimp/grain'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-grain.scm $_scriptsdir/elsamuko-grain.scm
}
package_gimp-script-lomo (){
  true && pkgdesc='Simulates the Lomo effect'
  true && url='https://sites.google.com/site/elsamuko/gimp/lomo'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-lomo.scm $_scriptsdir/elsamuko-lomo.scm
  install -Dm644 elsamuko/elsamuko-lomo-batch.scm $_scriptsdir/elsamuko-lomo-batch.scm
}
package_gimp-script-movie-300 (){
  true && pkgdesc='Simulates the color style of the movie "300"'
  true && url='https://sites.google.com/site/elsamuko/gimp/300'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-movie-300.scm $_scriptsdir/elsamuko-movie-300.scm
}
package_gimp-script-national-geographic (){
  true && pkgdesc='Simulates a high quality (portrait) photo like these from the National Geographic'
  true && url='https://sites.google.com/site/elsamuko/gimp/ng'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-national-geographic.scm $_scriptsdir/elsamuko-national-geographic.scm
  install -Dm644 elsamuko/elsamuko-national-geographic-batch.scm \
    $_scriptsdir/elsamuko-national-geographic-batch.scm
}
package_gimp-script-obama-hope (){
  true && pkgdesc='Generates a poster like the famous Obama "HOPE"'
  true && url='https://sites.google.com/site/elsamuko/gimp/fairey'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-obama-hope.scm $_scriptsdir/elsamuko-obama-hope.scm
}
package_gimp-script-first-photo-border (){
  true && pkgdesc='Simulates the cut-off of the first picture of a film roll of cheap cameras'
  true && url='https://sites.google.com/site/elsamuko/gimp/cut-off'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-photo-border.scm $_scriptsdir/elsamuko-photo-border.scm
}
package_gimp-script-photochrom (){
  true && pkgdesc="Simulates a photochrom image, a lithographic printing process from the 1890's"
  true && url='https://sites.google.com/site/elsamuko/gimp/photochrom'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-photochrom.scm $_scriptsdir/elsamuko-photochrom.scm
  install -Dm644 elsamuko/elsamuko-photochrom-batch.scm \
    $_scriptsdir/elsamuko-photochrom-batch.scm
}
package_gimp-script-rainy-landscape (){
  true && pkgdesc='Changes a dry landscape to a wet one'
  true && url='https://sites.google.com/site/elsamuko/gimp/rain'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-rainy-landscape.scm $_scriptsdir/elsamuko-rainy-landscape.scm
}
package_gimp-script-sprocket-hole (){
#slide-with-sprockets
  true && pkgdesc='Simulates complete exposed 35mm film strips with frame numbers'
  true && url='https://sites.google.com/site/elsamuko/gimp/sprocket'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-slide-with-sprockets.scm $_scriptsdir/elsamuko-slide-with-sprockets.scm
}
package_gimp-script-sunny-landscape (){
  true && pkgdesc='Changes a rainy landscape to a sunny one'
  true && url='https://sites.google.com/site/elsamuko/gimp/sunny'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-sunny-landscape.scm $_scriptsdir/elsamuko-sunny-landscape.scm
}
package_gimp-script-technicolor-2-color (){
  true && pkgdesc='Simulates the 2 Color Technicolor effect'
  true && url='https://sites.google.com/site/elsamuko/gimp/technicolor2'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-technicolor-2-color.scm $_scriptsdir/elsamuko-technicolor-2-color.scm
  install -Dm644 elsamuko/elsamuko-technicolor-2-color-batch.scm \
    $_scriptsdir/elsamuko-technicolor-2-color-batch.scm
}
package_gimp-script-technicolor-3-color (){
  true && pkgdesc='Simulates the 3 Color Technicolor effect'
  true && url='https://sites.google.com/site/elsamuko/gimp/technicolor3'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-technicolor-3-color.scm $_scriptsdir/elsamuko-technicolor-3-color.scm
}
package_gimp-script-white-balance-puzzle (){
  true && pkgdesc='Creates small rectangular selections and auto-white-balances them'
  true && url='https://sites.google.com/site/elsamuko/gimp/wb-puzzle'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/elsamuko-wb-puzzle.scm $_scriptsdir/elsamuko-wb-puzzle.scm
}
package_gimp-script-vintage-look (){
  true && pkgdesc='Simulates a 70s vintage look'
  true && url='https://sites.google.com/site/elsamuko/gimp/vintage'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/mm1-vintage-look.scm $_scriptsdir/mm1-vintage-look.scm
}
package_gimp-script-split-tone (){
  true && pkgdesc='Modification of the split tone script with edge detection'
  true && url='https://sites.google.com/site/elsamuko/gimp/split-tone-ed'
  true && depends=(gimp-elsamuko-scripts)
  eval $_scriptsdir_eval
  cd "$srcdir"
  install -Dm644 elsamuko/tuxcomputers-split-tone.scm $_scriptsdir/tuxcomputers-split-tone.scm
}
md5sums=('98e744676f0cff65ed9a0a7b45b06cee'
         '0fd5e89b6c247026f83233e69fa9bca7'
         '25e4391f2b85b35e0e0ebf5c797916b4'
         'e93607bf48438f77d2e53dda4bc19408')
