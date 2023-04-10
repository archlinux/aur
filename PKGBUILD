# Maintainer: Hao Cheng <ch1994@outlook.com>


pkgname=freewb
pkgver=1.1.0
pkgrel=1
pkgdesc="Jidian Wubi for Linux"
arch=("x86_64")
url="http://www.freewb.org/"
license=("custom")
depends=("fcitx" "fcitx-qt5" "fcitx-configtool")

source=("https://d.store.deepinos.org.cn//store/tools/freewb/freewb_${pkgver}_amd64.deb")
sha256sums=('a71912f2ea3bd243a5e93e0b15a981c9862d4f75f0bf123e4bfb5bcc5b009485')

package(){
    cd ${srcdir}

    tar -xJvf data.tar.xz -C "${pkgdir}"

    mv "$pkgdir"/usr/lib/*-linux-gnu/fcitx "$pkgdir"/usr/lib/
    rmdir "$pkgdir"/usr/lib/*-linux-gnu
}
