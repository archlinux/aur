# Maintainer: oleerik <elo@tuta.io>
# Contributor: shinnova

pkgname=comptray
pkgver=r25.1e03525
_gitrel=0
pkgrel=1
pkgdesc="Compton toggle for the tray"
arch=('any')
url="http://github.com/oleerik/comptray"
license=('GPL')
depends=('python2'
	'gtk2'
	'pygtk'
	'compton')
optdepends=('compton-conf: GUI configuration for Compton')
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$pkgname
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
} 
