# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=docui-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="TUI Client for Docker"
url="https://github.com/skanehira/docui"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/skanehira/docui/releases/download/2.0.4/docui_2.0.4_Linux_x86_64.tar.gz")
arch=('x86_64')
sha256sums=('8f87769b99e63f58fb77561fa9eb0f1913214aef3f1f9955e57df43bbfc3bbfa')
depends=('go')
conflicts=('docui-git')

package() {
    cd $srcdir
    install -Dm755 docui "${pkgdir}/usr/bin/docui"
}

#vim: syntax=sh
