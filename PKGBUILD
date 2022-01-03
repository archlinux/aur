# Maintainer: Hao Cheng <ch1994@outlook.com>


pkgname=freewb
pkgver=0.1.3
pkgrel=1
pkgdesc="Jidian Wubi for Linux"
arch=("x86_64")
url="http://arm-ai.org/forum.php?mod=viewthread&tid=93"
license=("custom")
depends=("fcitx" "fcitx-qt5" "fcitx-configtool")

source=("https://d.store.deepinos.org.cn//store/tools/freewb/freewb_${pkgver}_amd64.deb")
sha256sums=('a7d6663f9c3c2562b86dd8b4227452eee1884392d744b21e0ce9b0beae6bae16')

package(){
    cd ${srcdir}

    tar -xJvf data.tar.xz -C "${pkgdir}"

    mv "$pkgdir"/usr/lib/*-linux-gnu/fcitx "$pkgdir"/usr/lib/
    rmdir "$pkgdir"/usr/lib/*-linux-gnu
}
