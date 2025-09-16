# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=zigdown-bin
pkgver=1.0.2
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
sha256sums_x86_64=('9331f3f05afc8127a35f9e80a3a8db3d881cf2da337e7963c0a72dc66444eb10')
sha256sums_aarch64=('4146c1c497867ae2c503e78c62b5b1efc17d3c650b9709f54a4ef8af0fbcc33a')

package() {
  install -Dm755 "${srcdir}/zigdown" "${pkgdir}/usr/bin/zigdown"
}
