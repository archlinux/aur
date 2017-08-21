# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=3.1.3
pkgrel=2
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('59d0338b213683ae1a76375a6c8ba08a8cc57114a3b359c0948ee421d799c110a44dade474c337fc9daf6eb475729cde1f20db395e75c7c1d908855516668501'
            '38f01b04e7e04335c0f4012d003e9c8a118e65a61fa6d0e288a547a9a63377d911dad14fc26ef559c1354629f86df0f9a16457fb105089c7ea364fc426db475c')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
