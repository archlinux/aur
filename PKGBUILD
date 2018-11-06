# Maintainer: Martin Fracker, Jr. <martin.frackerjr@gmail.com>

pkgname=nodejs-ynab-cli
_pkgname=cli
pkgver=1.2.2
pkgrel=1
pkgdesc="CLI tool for YNAB budgeting software"
arch=("any")
url="https://github.com/towerism/ynab-cli"
license=("GPL3")
depends=()
provides=("ynab")
makedepends=("npm")
source=("https://registry.npmjs.org/@ynab-cli/cli/-/$_pkgname-$pkgver.tgz")
sha256sums=('667acd633b3a9058c9f7f3ec76c956146c8a49dc808e65485ccdec2ae3cc3e13')

package() {
  npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir"/usr $_pkgname-$pkgver.tgz

  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
# vim:set ts=2 sw=2 et:
