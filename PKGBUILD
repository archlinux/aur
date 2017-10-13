# Maintainer: Matthias Loibl <mail at matthiasloibl dot com>

pkgname=gopass
pkgver=1.4.1
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
sha256sums_x86_64=('6c46e9f76d760be2d709b7d3561260dd6e908cff406cf590a62ac5e6a00e16a9')

package() {
  cd "$srcdir"
  install -Dm755 gopass-"$pkgver"-linux-amd64/gopass "$pkgdir"/usr/bin/gopass
}
