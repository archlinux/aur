# Maintainer: Wenyin Root <wenyin.community@outlook.com>
pkgname=zedg
pkgver=1.29.3
pkgrel=1
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

sha256sums_x86_64=('e6c6fa2507fd9b93fc7b0fdd14b7f4485842ff2b66f59183e92cb9fe5c8ea148')
sha256sums_aarch64=('7924930d799d2ea376cf19018f98c8ef7700678dc4e89d9699fb00be10d29119')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/zedg"
}
