# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=3.3.1
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('2f664c9d3fc8abd23f5920a9d1f569dfc4930f0b30d196994475779eee27887aa3dc2f8157fbece8b98cc272e954f248dbc4b236763a48d3cd7a3bb1b6ca3c0c'
            '5317cf5da1142ed83b1b11c60ee4a70ad74d21f6f98c59b0ec45ad4026d4db4952fe061fb493e3a92675e6bb558ea059677db2bcf42b620cb71d5b772b288008')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
