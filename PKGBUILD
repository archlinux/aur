# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=3.4
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('05a53ee03dcbd89b8ecc3a4d8483b4f95b8715295a52669882a7ca10465d50a2ca9eaa1fd158cb7071236ccf5cf3c68ee8e92eec4b3016d68bd82fa48a65b243'
            '5317cf5da1142ed83b1b11c60ee4a70ad74d21f6f98c59b0ec45ad4026d4db4952fe061fb493e3a92675e6bb558ea059677db2bcf42b620cb71d5b772b288008')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
