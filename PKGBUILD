# Maintainer: Matthias Loibl <mail at matthiasloibl dot com>

pkgname=gopass
pkgver=1.0.0
pkgrel=1
pkgdesc="The team password manager. Written in Go."
arch=('x86_64')
url="https://github.com/justwatchcom/gopass"
license=('MIT')
depends=('xclip' 'bash' 'gnupg')
provides=("gopass=${pkgver}")

source_x86_64=("gopass-${pkgver}-${pkgrel}-x86_64.tar.xz::https://www.justwatch.com/gopass/releases/${pkgver}/gopass-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz")
sha256sums_x86_64=('d1d012a80a7bfca02bc49bfb59fcf1f8f7f1ca2b61278d96d4b89cabbd65bb01')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/gopass "$pkgdir"/usr/bin/gopass
}
