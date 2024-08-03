# Maintainer: Revincx <revincx233@gmail.com>

pkgname='koyeb-cli-bin'
pkgver=4.3.0
pkgrel=1
pkgdesc="koyeb cli binary"
arch=(
  x86_64
)
license=('Apache-2.0')
url="https://github.com/koyeb/koyeb-cli"
source=("https://github.com/koyeb/koyeb-cli/releases/download/v$pkgver/koyeb-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=("5967ecb2d3e56213ab4606a30e02f70312f27d671dcd059bb4ee9e2970af3512")

package() {
    install -Dm755 koyeb ${pkgdir}/usr/bin/koyeb
}
