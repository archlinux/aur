# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-pengliwenkai
pkgname=(ttf-lxgw-pengliwenkai)
pkgdesc="彭蠡文楷 / Pengli WenKai 基于《霞鹜文楷》系列字体衍生，参考《古籍印刷通用字规范字形表》（GB/Z 40637-2021）收字和调整字形的开源字体。"
provides=(${pkgname})
conflicts=(${pkgname})
pkgver=1.033
pkgrel=1
url="https://github.com/lxgw/Pengli"
makedepends=('fontconfig')
license=("OFL-1.1")
arch=(any)
source=("PengliWenKai-Regular_$pkgver.ttf::${url}/releases/download/v${pkgver}/PengliWenKai-Regular.ttf")
sha256sums=('4ef70f5ba372d2da3a6767302cca516768f8c75c5c0a9b3e455216f3a8156edc')

package() {
    install -vDm644 ${srcdir}/PengliWenKai-Regular_$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/PengliWenKai-Regular.ttf"
}
