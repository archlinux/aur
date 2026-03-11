# Maintainer: Mike Simpson <zohovault-cli-bin.uqv7k@aleeas.com>
pkgname=zohovault-cli-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Zoho Vault CLI Tool"
arch=('x86_64')
url="https://www.zoho.com/vault/"
license=('unknown')
options=('!strip') # will not function if makepkg is allowed to strip chars from binary
source=("https://downloads.zohocdn.com/vault-cli-desktop/linux/zv_cli.zip")
sha256sums=('3dd8fea0cead60725113765cf62632f17a3b345076badf7c38465b652c97bc1a')

prepare() {
  bsdtar -xf "${srcdir}/zv_cli.zip"
}

package() {
  install -Dm755 "${srcdir}/zv" "${pkgdir}/usr/bin/zv"
}
