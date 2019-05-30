# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=npm-fzf
pkgver=1.1.4
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

sha256sums=('42b7cbce5f261ec6c3d110d3d96b6ce02601c659bf4f3e787a001ba5e4c4dd11')
