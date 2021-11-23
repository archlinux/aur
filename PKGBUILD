# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=tickeys-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Instant audio feedback when typing."
arch=('x86_64')
url="https://github.com/BillBillBillBill/Tickeys-linux"
license=('MIT')
depends=('python-xlib' 'python-sounddevice' 'python-soundfile')
source=('https://github.com/Brx86/yun/releases/download/2/tickeys.tar.xz')
md5sums=('b41599942f188bab23895f6c0649a28d')
noextract=()

prepare() {
    mkdir "$pkgname-$pkgver"
    cp -r opt "$pkgname-$pkgver"/opt
    cp -r usr "$pkgname-$pkgver"/usr
}

package() {
    cd "$pkgname-$pkgver"
    cp -r opt ${pkgdir}
    cp -r usr ${pkgdir}
}