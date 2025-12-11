pkgname=zep-bin
pkgver=0.7
pkgrel=1
pkgdesc="Fast package manager for Zig (binary release)"
arch=('x86_64')
url="https://github.com/XerWoho/zeP"
license=('GPLv3')
provides=('zep')
conflicts=('zep')
source=("https://zep.run/releases/${pkgver}/zep_x86_64-linux_${pkgver}.tar.xz")
sha256sums=('eb349a36c9705f157d1722dc0ea082e11a28569e9c32b6835b642e0cf1b5f598')

package() {
    install -Dm755 "$srcdir/zeP" "$pkgdir/usr/bin/zeP"
}

post_install() {
    echo "--- ZEP CONFIG REQUIRED ---"
    echo " ==> Run 'zeP setup' to configure zeP"
    echo " ==> Then run: zeP zep install 0.7"
}
