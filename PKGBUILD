pkgname=pass-web
_npmpkgver=1.0.0-beta.9
pkgver=1.0.0.beta.9
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
sha256sums=('fe71761183b69e37f04fe4df9008ec27f05f189de0c08e0159d0ceca9f26475f')
