# PKGBUILD: 18-Jun-2015
# Maintainer:  dysphr <>

# Contributor: Jonathan Schaeffer <Joschaeffer@gmail.com>

pkgname=cgoban3
pkgver=3.5.20
pkgrel=2
pkgdesc="Kiseido Go and SGF client"
url="http://gokgs.com/"
arch=('any')
license=('Freeware')
depends=('desktop-file-utils' 'java-runtime' 'bash')
install='cgoban3.install'
source=("http://files.gokgs.com/javaBin/cgoban.jar"
        'cgoban3'
        'cgoban3.png'
        'cgoban3.desktop'
        'cgoban3-edit.desktop')
sha256sums=('fcc158cbb9cf1c7e3b70fda21ff3f58980fec2be2e7a4e3440cf529b36c928a6'
            '117e5499b05496eb8814a41081aa4792832aa3c841e03dd1edb7a3a936bec7bc'
            'a87ecc7d285cf19ab176a437dfb22ab8841eff2f64348cc432557d879347d510'
            'f333aac0bfef3243390c5d989e5d7e674eb1d65ebd3a7bb84d391bdfd0fa869f'
            '929d48903510bd346f27522b1273be4f18bf36be23077611a3afb1d45d354c69')

package() {
  cd $srcdir
  install -D -m644 cgoban.jar  "$pkgdir/usr/share/java/cgoban3/cgoban.jar"
  install -D -m644 cgoban3.desktop "$pkgdir/usr/share/applications/cgoban3.desktop"
  install -D -m644 cgoban3-edit.desktop "$pkgdir/pkg/usr/share/applications/cgoban3-edit.desktop"
  install -D -m644 cgoban3.png "$pkgdir/usr/share/pixmaps/cgoban3.png"
  install -D -m755 cgoban3 "$pkgdir/usr/bin/cgoban3"
}
