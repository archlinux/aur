_pkgname=orogene
pkgver=0.3.27
# Contributor: Asuka Minato
pkgrel=1
pkgdesc='A next-generation platform and package manager for Node.js-compatible and frontend JavaScript projects'
arch=('x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('APACHE')
provides=(oro)
depends=(gcc-libs glibc openssl-1.1)
source=(https://github.com/orogene/orogene/releases/download/v$pkgver/orogene-x86_64-unknown-linux-gnu.tar.gz)
sha256sums=('ae55be5a89cfe61ae74be7ba4abcef5354481e6228d4880f60648b666aba4670')

package() {
  mv */* ./
  install -Dm755 oro -t "$pkgdir/usr/bin/"
  install -Dm644 README.md CHANGELOG* -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}

