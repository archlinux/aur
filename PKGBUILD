pkgname=pass-web
_npmpkgver=1.0.0-beta.18
pkgver=1.0.0.beta.18
pkgrel=1
pkgdesc="A web interface for pass (password-store)"
arch=('any')
url="https://github.com/BenoitZugmeyer/pass-web"
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$_npmpkgver.tgz")
noextract=($pkgname-$_npmpkgver.tgz)

package() {
  yarn global add --no-default-rc --no-bin-links --non-interactive \
    --global-folder "$pkgdir/usr/lib/node_modules/$pkgname" \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$pkgname-$_npmpkgver.tgz
}
md5sums=('24a0534f2d019eb80a8c22899c8db088')
