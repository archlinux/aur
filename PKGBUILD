# Maintainer: Matthias Loibl <mail at matthiasloibl dot com>

pkgname=gopass
pkgver=1.5.1
pkgrel=1
pkgdesc="The slightly more awesome standard unix password manager for teams."
arch=('x86_64')
url="https://github.com/justwatchcom/gopass"
license=('MIT')
depends=('xclip' 'bash' 'gnupg')
optdepends=('dmenu: for dmenu support'
	'xdotool: for typing passwords selected by dmenu')
provides=("gopass=${pkgver}")
source_x86_64=("gopass-${pkgver}-${pkgrel}-x86_64.tar.xz::https://www.justwatch.com/gopass/releases/${pkgver}/gopass-${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('b35837d958c115c108be6e897dc5d7e5db069a278db854c251298e7b208e2d0b')

package() {
  cd "$srcdir"
  install -Dm755 gopass-"$pkgver"-linux-amd64/gopass "$pkgdir"/usr/bin/gopass
}
