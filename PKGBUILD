# Maintainer: Wenyin Root <wenyin.community@outlook.com>
pkgname=zedg
pkgver=1.24.3
pkgrel=2
pkgdesc="Zed editor with globalization support (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/WenYin-Community/zed-globalization"
license=('AGPL-3.0-or-later' 'Apache-2.0' 'GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'glib2' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11')
provides=('zedg')
conflicts=('zedg')
options=('!debug')

source_x86_64=("https://github.com/WenYin-Community/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/WenYin-Community/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-aarch64-v${pkgver}.tar.gz")

sha256sums_x86_64=('95c986e06c20e98c37859354f47b1b71b6b2f5aae3e09cc35f517dfd0c147aa3')
sha256sums_aarch64=('0e9a88d6e0c082fb5bc00c2d984dd49f464804d64a1b9c70ceaca81c5c17e299')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/zedg"
}
