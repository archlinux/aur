pkgname=fcitx-sogouime
pkgver=2.4.0.3469
_time=1612260778
pkgrel=1
pkgdesc="SogouIME for Linux"
arch=("x86_64")
url="https://pinyin.sogou.com/linux/"
license=("custom")
depends=("fcitx" "opencc" "libidn11" "lsb-release" "xorg-xprop" "qt5-declarative" "qt5-svg" "fcitx-qt5")

source=("https://ime.sogoucdn.com/dl/index/${_time}/sogoupinyin_${pkgver}_amd64.deb")
sha256sums=("792c1f6b8945db15c085db47d3d36a2a926f1c1f2ce0620ec3b0c9aa656f7700")

package(){
    cd ${srcdir}

    tar -xJvf data.tar.xz -C "${pkgdir}"

    mv "$pkgdir"/usr/lib/*-linux-gnu/fcitx "$pkgdir"/usr/lib/
    rmdir "$pkgdir"/usr/lib/*-linux-gnu
}
