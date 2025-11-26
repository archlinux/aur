# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=zigdown-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='A Markdown toolset in Zig'
url='https://github.com/JacobCrabill/zigdown'
source_x86_64=("zigdown-${pkgver}-${CARCH}.tar.gz::https://github.com/JacobCrabill/zigdown/releases/download/v$pkgver/${CARCH}-linux-gnu.tar.gz")
source_aarch64=("zigdown-${pkgver}-${CARCH}.tar.gz::https://github.com/JacobCrabill/zigdown/releases/download/v$pkgver/${CARCH}-linux-musl.tar.gz")
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=('zigdown')
provides=('zigdown')
sha256sums_x86_64=('6efd61f3e6ef97b7dc05821683b1aa051ce9e5e88f3eeca76d51178053ca68a6')
sha256sums_aarch64=('f9d8ff9b026f8c4f214e684209f92518a2b8b62830cab22bc35a26b49ad59d70')

package() {
  install -Dm755 "${srcdir}/zigdown" "${pkgdir}/usr/bin/zigdown"
}
