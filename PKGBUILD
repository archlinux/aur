# Maintainer: lomonosow <lomonosow93@gmail.com>
pkgname=secureboot
pkgver=0.0.2
pkgrel=3
pkgdesc="This package contains script, which helps to manage secureboot. It can generate keys, enroll it to UEFI and sign images"
arch=('any')
url="https://github.com/lomonosow/secureboot"
license=('MIT')
depends=('bash' 'openssl' 'efitools' 'util-linux' 'sbsigntools')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('7616730c14624f8a8713f7a3f64afd1c')


package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver"/secureboot.sh "${pkgdir}"/usr/bin/secureboot
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
