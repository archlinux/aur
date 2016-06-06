# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jkazip
pkgver=1.0.0
pkgrel=1
pkgdesc="A Package Wrapper - package wrapper for pacman (and more)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
depends=('p7zip' 'unrar' 'unzip' 'zip')
provides=('jkazip')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/jkazip"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/i18n/jkazip/es.mo")
md5sums=('d03e1b8e1af423eb72e23aaa7a5373c7'
         '5a677c201df0958da43d991f4a246a9e')
PKGEXT=".pkg.tar.xz"
package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/locale/es/LC_MESSAGES/es
  install -Dm755 $srcdir/jkazip "$pkgdir/usr/bin/" 
  install -Dm644 $srcdir/es.mo "pkgdir/usr/share/locale/es/LC_MESSAGES/jkazip.mo"
}
