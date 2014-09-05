# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/wp-boilerplate

pkgname=wp-boilerplate
pkgver=1.0
pkgrel=1
pkgdesc="Download and customize WordPress Plugin Boilerplate in one go http://wppb.io/"
arch=('any')
url="https://github.com/matt-h/wp-boilerplate"
license=('MIT')
depends=('wget')
source=(
  "https://github.com/matt-h/${pkgname}/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '31a999f245ab8b317bcee88ad15badf898d2da4fc4e1219345ddf8b8ec62c395'
)

package() {
  install -d "$pkgdir/usr/bin"

  msg "Installing files"
  install -Dm755 "$srcdir/${pkgname}-${pkgver}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  msg2 "Done installing files"
}

# vim:set ts=2 sw=2 et:
