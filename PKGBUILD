pkgname=pass-web
_npmpkgver=1.0.0-beta.15
pkgver=1.0.0.beta.15
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
md5sums=('a95355a56ebea86fdf5b66c295841472')
