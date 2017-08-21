# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=3.1.4
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('a7c6542a8dd7f596a7ac49ce7a93fcbf758243f8e16299c1c9a14faff8e39f1940da6e976952349f9b457d1b06a906377c5f992ced71444279d426a6f8d7906f'
            '38f01b04e7e04335c0f4012d003e9c8a118e65a61fa6d0e288a547a9a63377d911dad14fc26ef559c1354629f86df0f9a16457fb105089c7ea364fc426db475c')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
