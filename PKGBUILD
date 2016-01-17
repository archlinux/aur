pkgname=pass-web
_npmpkgver=1.0.0-beta.7
pkgver=1.0.0.beta.7
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
sha256sums=('d19d2452224a2b44d1ff893ff52400473373951ffd3e9d500c13b957820a6ec7')
