pkgname=pass-web
_npmpkgver=1.0.0-beta.10
pkgver=1.0.0.beta.10
pkgrel=1
pkgdesc="A web interface for pass (password-store)"
arch=('any')
url="https://github.com/BenoitZugmeyer/pass-web"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$_npmpkgver.tgz")
noextract=($pkgname-$_npmpkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$_npmpkgver.tgz
}
sha256sums=('8d3c7aaef91d779c879f655e73bd2d6aa8617f424ee5c09224a12fc113d6c6a8')
