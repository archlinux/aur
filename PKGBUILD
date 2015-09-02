# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=google-cli
pkgname=google-cli
pkgver=1.2
pkgrel=1
pkgdesc="Google Search from command line"
arch=('any')
url="https://github.com/jarun/google-cli"
license=('GPL3')
depends=('python')
conflicts=('google-cli-git')
source=("https://github.com/jarun/google-cli/archive/v$pkgver.tar.gz")
md5sums=('f3a6ea17e81ad8741a6614276dc9a22d')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 google "${pkgdir}/usr/bin/google"
  install -Dm644 google.1 "${pkgdir}/usr/share/man/man1/google.1"
}
