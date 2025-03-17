# Maintainer: Revincx <revincx233@gmail.com>

pkgname='koyeb-cli-bin'
pkgver=5.4.3
pkgrel=1
pkgdesc="koyeb cli binary"
arch=(
  x86_64
)
license=('Apache-2.0')
url="https://github.com/koyeb/koyeb-cli"
source=("https://github.com/koyeb/koyeb-cli/releases/download/v$pkgver/koyeb-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=("4841163552f8e6facd68a308e78a186f5044391c087e1f681d3cb1eee55ac855")

package() {
    install -Dm755 koyeb ${pkgdir}/usr/bin/koyeb
}
