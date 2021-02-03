# Owner: Mahmoud Ramadan <mahmoud.r.hashad@gmail.com>
pkgname=passtools
pkgver=0.1
pkgrel=1
pkgdesc="A small script that helps you generate a password and check for the password strength"
arch=('any')
url="https://github.com/Mahmoud-Hashad/passtools"
license=('GPL')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mahmoud-Hashad/passtools/archive/v$pkgver.tar.gz")
sha256sums=('2245f8efa37963558cb925c6515a790033f87bc694a7baee5c32af1c29291e10')


package() {
   cd "${srcdir}/passtools-$pkgver"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
} 
