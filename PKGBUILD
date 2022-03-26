# Maintainer: Guillaume Boehm <guillaumeboehm@hotmail.fr>
pkgname=lightdm-web-greeter-theme-arch
pkgver=0.1.0
pkgrel=1
epoch=1
pkgdesc="Minimal theme for web-greeter using humorous wallpapers about Arch Linux."
arch=('any')
url="https://github.com/guillaumeboehm/lightdm-web-greeter-theme-arch"
license=('WTFPL')
depends=('web-greeter')
source=("$pkgname-$pkgver::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5f35d3dbf94338fdba1c44a9bf176458dd4f5fe75d5208198ae491611c69d1e3')

package() {
    install -dm755 "$pkgdir/usr/share/web-greeter/themes/arch"
    cp -r "$srcdir/${pkgname}-${pkgver}/"* "$pkgdir/usr/share/web-greeter/themes/arch"
}
