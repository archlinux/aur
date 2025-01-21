# Maintainer: Revincx <revincx233@gmail.com>

pkgname='koyeb-cli-bin'
pkgver=5.4.0
pkgrel=1
pkgdesc="koyeb cli binary"
arch=(
  x86_64
)
license=('Apache-2.0')
url="https://github.com/koyeb/koyeb-cli"
source=("https://github.com/koyeb/koyeb-cli/releases/download/v$pkgver/koyeb-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=("6e9b2dc089bc298d72e59c7b21c53807806209e937b25de4e2fcd02a953a6e40")

package() {
    install -Dm755 koyeb ${pkgdir}/usr/bin/koyeb
}
