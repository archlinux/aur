# Maintainer: Matthias Loibl <mail at matthiasloibl dot com>

pkgname=gopass
pkgver=1.0.1
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
sha256sums_x86_64=('b49258e178662f667898030d9635bbbf18fd042fed0195efecfd12d7cdec5789')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/gopass "$pkgdir"/usr/bin/gopass
}
