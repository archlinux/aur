pkgname=libqwt6
pkgver=6.0.0
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications"
arch=('i686' 'x86_64')
url="http://qwt.sourceforge.net/"
depends=('qt4')
conflicts=('qwt')
license=('custom')
source_i686=("http://mirror.yandex.ru/ubuntu/pool/universe/q/qwt/libqwt6_${pkgver}-1.2_i386.deb")
sha256sums_i686=('cf428514d351db51ed5e168bb49f85069259053774cfb69e205ef1716f2be71d')
source_x86_64=("http://mirror.yandex.ru/ubuntu/pool/universe/q/qwt/libqwt6_${pkgver}-1.2_amd64.deb")
sha256sums_x86_64=('8c17ae6f691ecb5fc73c65576657b45ab4eecbd4a10bdb443a67df3739071e0d')

package() {
  cd "${srcdir}"

  tar -xzC "${pkgdir}" -f data.tar.gz
}
