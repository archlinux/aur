
pkgname=backlight-openrc
pkgver=2
pkgrel=1.1
pkgdesc="Restore the screen brightness at system startup (OpenRC)"
url="https://github.com/alium/backlight-openrc"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('openrc')
source=("git+https://github.com/alium/backlight-openrc.git")
install="$pkgname.install"


package() {
    cd "$srcdir/$pkgname"
    install -Dm=755 backlight "$pkgdir/etc/init.d/backlight"
}
sha256sums=('SKIP')
