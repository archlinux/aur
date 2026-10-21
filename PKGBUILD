# Maintainer: Wenyin Root <wenyin.community@outlook.com>
pkgname=zedg
pkgver=1.24.4
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

sha256sums_x86_64=('f5b325655b0eafe5200cbf8cae6e557ff1f201fd744849cd893121e5f52db492')
sha256sums_aarch64=('52a857a3754497f1616ed202b91585b57bedf432e3a75074411652a226e3aa2c')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/zedg"
}
