# Maintainer: Matthias Loibl <mail at matthiasloibl dot com>

pkgname=gopass
pkgver=1.0.2
pkgrel=1
pkgdesc="The slightly more awesome standard unix password manager for teams."
arch=('x86_64')
url="https://github.com/justwatchcom/gopass"
license=('MIT')
depends=('xclip' 'bash' 'gnupg')
optdepends=('dmenu: for dmenu support'
	'xdotool: for typing passwords selected by dmenu')
provides=("gopass=${pkgver}")
source_x86_64=("gopass-${pkgver}-${pkgrel}-x86_64.tar.xz::https://www.justwatch.com/gopass/releases/${pkgver}/gopass-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz")
sha256sums_x86_64=('81048ee8d19b5e41fd29ca183ceb23332b5eac5260eae7f8c0c00226fb0a6b12')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/gopass "$pkgdir"/usr/bin/gopass
}
