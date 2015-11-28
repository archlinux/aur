pkgname=pass-web
_npmpkgver=1.0.0-beta.4
pkgver=1.0.0.beta.4
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
sha256sums=('fc2a197a403840981b69eb9eae6b8df7a86b409ae30d3dcec53256d17bd5e360')
