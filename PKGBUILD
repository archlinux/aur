# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=npm-fzf
pkgver=1.1.5
pkgrel=1
pkgdesc="Fuzzy search npm modules with fzf"
arch=(any)
url="https://github.com/hankchanocd/npm-fzf"
license=('MIT')
depends=('nodejs' 'fzf')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

sha256sums=('1cedca12974d4c62dd0e7035fe20bd4c85101c20f702e7eb3a91d24614b2343e')
