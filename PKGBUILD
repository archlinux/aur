# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jkazip
pkgver=1.0.3
pkgrel=2
pkgdesc="A Package Wrapper - package wrapper for pacman (and more)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
depends=('p7zip' 'unrar' 'unzip' 'zip' 'lzip')
provides=('jkazip')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/jkazip"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/i18n/jkazip/es.mo")
md5sums=('fb40e1f423357152cf423390e862a058'
         '00f4d66914797abba37fdec272687d9e')
PKGEXT=".pkg.tar.xz"
package() {
  install -Dm755 $srcdir/jkazip "$pkgdir/usr/bin/jkazip" 
  install -Dm644 $srcdir/es.mo "$pkgdir/usr/share/locale/es/LC_MESSAGES/jkazip.mo"
}
