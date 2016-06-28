# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jkazip
pkgver=2.0.3
pkgrel=1
pkgdesc="A script which use the differents zip and unzip programs"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
depends=('p7zip' 'unrar' 'unzip' 'zip' 'lzip' 'tar')
provides=('jkazip')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/jkazip"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/i18n/jkazip/es.mo")
md5sums=('c9af26225bd54e04925e8dd134dd2cec'
         '60bb5d465748ace2b3db7a471d92a1d0')
PKGEXT=".pkg.tar.xz"
package() {
  install -Dm755 $srcdir/jkazip "$pkgdir/usr/bin/jkazip" 
  install -Dm644 $srcdir/es.mo "$pkgdir/usr/share/locale/es/LC_MESSAGES/jkazip.mo"
}
