# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jkazip
pkgver=2.3.0
pkgrel=1
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
md5sums=('eb5bc2197d77ecb2d0d812cf1fb7b3a8'
         '60bb5d465748ace2b3db7a471d92a1d0')
PKGEXT=".pkg.tar.xz"
package() {
  install -Dm755 $srcdir/jkazip "$pkgdir/usr/bin/jkazip" 
  install -Dm644 $srcdir/es.mo "$pkgdir/usr/share/locale/es/LC_MESSAGES/jkazip.mo"
}
