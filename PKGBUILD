# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-pengliwenkai
pkgname=(ttf-lxgw-pengliwenkai)
pkgdesc="彭蠡文楷 / Pengli WenKai 基于《霞鹜文楷》系列字体衍生，参考《古籍印刷通用字规范字形表》（GB/Z 40637-2021）收字和调整字形的开源字体。"
provides=(${pkgname})
conflicts=(${pkgname})
pkgver=1.032
pkgrel=1
url="https://github.com/lxgw/Pengli"
makedepends=('fontconfig')
license=("OFL-1.1")
arch=(any)
source=("PengliWenKai-Regular_$pkgver.ttf::${url}/releases/download/v${pkgver}/PengliWenKai-Regular.ttf")
sha256sums=('1b99d18e19433c1b24cf0fb5b93197da2fab8ffb5885897ca2e83980ef55becd')

package() {
    install -vDm644 ${srcdir}/PengliWenKai-Regular_$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/PengliWenKai-Regular.ttf"
}
