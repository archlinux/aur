# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=3.1.1
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('1185818cc14df9e935a808f5b7f7a1ba25c0f1bfcb4bb7fe6d28ddad288a651003bb9a1b2faa4d25d91f11cfc0f45c37d532e01d3709c55810d04d88c80f0182'
            '38f01b04e7e04335c0f4012d003e9c8a118e65a61fa6d0e288a547a9a63377d911dad14fc26ef559c1354629f86df0f9a16457fb105089c7ea364fc426db475c')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
