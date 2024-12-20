# Maintainer: Revincx <revincx233@gmail.com>

pkgname='koyeb-cli-bin'
pkgver=5.3.1
pkgrel=1
pkgdesc="koyeb cli binary"
arch=(
  x86_64
)
license=('Apache-2.0')
url="https://github.com/koyeb/koyeb-cli"
source=("https://github.com/koyeb/koyeb-cli/releases/download/v$pkgver/koyeb-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=("581eeccaf24e1b24e887ebafd49582e48525355fd0a8ac30159d3181b667e7ec")

package() {
    install -Dm755 koyeb ${pkgdir}/usr/bin/koyeb
}
