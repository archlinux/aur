# Maintainer: ant32 <antreimer@gmail.com>

pkgname=quasar-server
pkgver=2.2.1
pkgrel=2
pkgdesc="Business accounting software (Server)"
url="http://www.linuxcanada.com"
arch=('x86_64' 'i686')
license=('Commercial')
depends=('qt3' 'xinetd' 'postgresql')
optdepends=('polymer: KDE QT style Plastik')
source_i686=(ftp://linuxcanada.com/pub/Quasar/${pkgver}/binaries/i386-i586/Kubuntu-14.04/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(ftp://linuxcanada.com/pub/Quasar/${pkgver}/binaries/x86_64/Kubuntu-14.04/${pkgname}_${pkgver}-1_amd64.deb)
md5sums_x86_64=('ee09da2848529e8ec6604ca668e1b593')
md5sums_i686=('701f46fce465c5785bd6b0066e9c1abf')
install="$pkgname.install"

package() {
  cd "${srcdir}"
  tar xJf data.tar.xz
  cp -al opt "$pkgdir"
  install -Dm644 usr/share/doc/$pkgname/copyright "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
