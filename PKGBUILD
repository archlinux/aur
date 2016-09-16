# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jkazip
pkgver=2.3.1
pkgrel=2
pkgdesc="A suite to compress and decompress tar, xz, gzip, bzip2, zip, rar and 7zip"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
depends=('p7zip' 'unrar' 'unzip' 'zip' 'lzip')
provides=('jkazip')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/jkazip"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/i18n/jkazip/es.mo")
md5sums=('4fbe80e3a25746d78c26e7110c093c53'
         '60bb5d465748ace2b3db7a471d92a1d0')
PKGEXT=".pkg.tar.xz"
package() {
  install -Dm755 $srcdir/jkazip "$pkgdir/usr/bin/jkazip" 
  install -Dm644 $srcdir/es.mo "$pkgdir/usr/share/locale/es/LC_MESSAGES/jkazip.mo"
}
