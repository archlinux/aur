# Maintainer: hanasaki <hanasakayui2022@gmail.com>

pkgname=matcha-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="A mock chat interaction development tool"
arch=('x86_64')
url="https://github.com/A-kirami/matcha"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1-imgpaste')
makedepends=('binutils')
provides=('matcha')
conflicts=('matcha')
source=("$pkgname-$pkgver.deb::https://github.com/A-kirami/matcha/releases/download/v${pkgver}/matcha_${pkgver}_amd64.deb")
sha256sums=('064c591e7ac3ff9b48aae469a6b86d0a329b2a0b92f6258434dc02df94875564')

package() {
    cd "$srcdir"
    ar x "$pkgname-$pkgver.deb"
    tar xf data.tar.gz -C "$pkgdir"
} 