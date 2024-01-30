# Maintainer: Revincx <revincx233@gmail.com>

pkgname='koyeb-cli-bin'
pkgver=3.7.0
pkgrel=1
pkgdesc="koyeb cli binary"
arch=(
  x86_64
)
license=('Apache-2.0')
url="https://github.com/koyeb/koyeb-cli"
source=("https://github.com/koyeb/koyeb-cli/releases/download/v$pkgver/koyeb-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=("f582e071aca985284e905793b4baa751a16f235d458aa9375877d65521003231")

package() {
    install -Dm755 koyeb ${pkgdir}/usr/bin/koyeb
}
