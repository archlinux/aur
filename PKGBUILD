# Maintainer: Wenyin Root <wenyin.community@outlook.com>
pkgname=zedg
pkgver=1.10.2
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

sha256sums_x86_64=('cb8b258b423a87eb443bdba9dec6e77c246cdfed79b64566e94c2d335029dfda')
sha256sums_aarch64=('a22253e7a5da99e2422a491adf528c2b9b2658a3b77b3603717c6ca141318c1b')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/zedg"
}
