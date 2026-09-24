# Maintainer: Wenyin Root <wenyin.community@outlook.com>
pkgname=zedg
pkgver=1.21.0
pkgrel=1
pkgdesc="Zed editor with globalization support (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/WenYin-Community/zed-globalization"
license=('AGPL-3.0-or-later' 'Apache-2.0' 'GPL-3.0-or-later')
provides=('zedg')
conflicts=('zedg')
options=('!debug')

source_x86_64=("https://github.com/WenYin-Community/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/WenYin-Community/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-aarch64-v${pkgver}.tar.gz")

sha256sums_x86_64=('dad9024e05c7e3f6e0e548f09d5aa62eb1db3b7048c3e9f20b14112a96ba8650')
sha256sums_aarch64=('f9ab739aad14f9658eac3d8f8166302158f354caf50d2c374ff7ff09307fe34d')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/zedg"
}
