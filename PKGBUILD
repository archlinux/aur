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

source_x64_64=("gopass-${pkgver}-linux-amd64.tar.gz::https://www.justwatch.com/gopass/releases/${pkgver}/gopass-${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('9bf3d0e438270e72649b70446b9d71ebd6258c00fe180db4419ddf6ab48eab04')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/gopass "$pkgdir"/usr/bin/gopass
}
