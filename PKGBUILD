# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=3.1.2
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('092e335990dbfc836e619c4acf40477a20a53094ac06e6b455a80376306b2f855a486b52f95a7f293eee3784214a2a21533a1a37b59d351317a7dd911684fcab'
            '38f01b04e7e04335c0f4012d003e9c8a118e65a61fa6d0e288a547a9a63377d911dad14fc26ef559c1354629f86df0f9a16457fb105089c7ea364fc426db475c')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
