# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=google-cli
pkgname=google-cli
pkgver=1.7
pkgrel=1
pkgdesc="Google Search from command line"
arch=('any')
url="https://github.com/jarun/google-cli"
license=('GPL3')
depends=('python')
conflicts=('google-cli-git')
source=("https://github.com/jarun/google-cli/archive/v$pkgver.tar.gz")
md5sums=('3fcdfd59cf89f802b9c9d36a59b4c71e')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 googler "${pkgdir}/usr/bin/googler"
  install -Dm644 googler.1 "${pkgdir}/usr/share/man/man1/googler.1"
}
