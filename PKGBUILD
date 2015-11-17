pkgname=pass-web
_npmpkgver=1.0.0-beta.3
pkgver=1.0.0.beta.3
pkgrel=1
pkgdesc="A web interface for pass (password-store)"
arch=('any')
url="https://github.com/BenoitZugmeyer/pass-web"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$_npmpkgver.tgz")
noextract=($pkgname-$_npmpkgver.tgz)
sha256sums=('8b2c95761c354848853a3d6918bc79e07b542b8f258801205e88bf8c161e2946')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$_npmpkgver.tgz
}
