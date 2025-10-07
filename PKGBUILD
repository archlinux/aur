# Maintainer: Revincx <revincx233@gmail.com>

pkgname='koyeb-cli-bin'
pkgver=5.7.0
pkgrel=1
pkgdesc="koyeb cli binary"
arch=(
  x86_64
)
license=('Apache-2.0')
url="https://github.com/koyeb/koyeb-cli"
source=("https://github.com/koyeb/koyeb-cli/releases/download/v$pkgver/koyeb-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=("7d1185286304264a2dad7a86066e52a079b63bbb67ba03c3bce2af2cc1c7a1a6")

package() {
    install -Dm755 koyeb ${pkgdir}/usr/bin/koyeb
}
