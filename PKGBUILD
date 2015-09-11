# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=google-cli
pkgname=google-cli
pkgver=1.6
pkgrel=1
pkgdesc="Google Search from command line"
arch=('any')
url="https://github.com/jarun/google-cli"
license=('GPL3')
depends=('python')
conflicts=('google-cli-git')
source=("https://github.com/jarun/google-cli/archive/v$pkgver.tar.gz")
md5sums=('2740dcba72aba204637ef1382c97c5d3')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 googler "${pkgdir}/usr/bin/googler"
  install -Dm644 googler.1 "${pkgdir}/usr/share/man/man1/googler.1"
}
