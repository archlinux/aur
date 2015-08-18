# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Pável Varela Rodríguez [NeOnsKuLL] <neonskull@gmail.com>
pkgname=pybgsetter
pkgver=0.5
pkgrel=4

pkgdesc="Multi-backend GUI/CLI tool to set the desktop wallpaper."
url="http://bbs.archlinux.org/viewtopic.php?id=88997"
arch=('any')
license=('GPL')

depends=('python2' 'pygtk' 'imagemagick')
optdepends=(
  'hsetroot: to activate support for Hsetroot'
  'esetroot: to activate support for Esetroot'
  'habak: to activate support for Habak'
  'feh: to activate support for Feh'
)

source=(git+https://github.com/stefanhusmann/pybgsetter)
sha256sums=('SKIP')
install=pybgsetter.install

package() {
  cd "$pkgname"
  ./install.sh "$pkgdir"/
}

