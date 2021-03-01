# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>

pkgname=wait4x-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Waiting for a port to enter into specify state"
arch=('x86_64')
url="https://github.com/atkrad/wait4x"
license=('Apache')
provides=('wait4x')
conflicts=('wait4x')
depends=('glibc')
source=("${pkgname}-$pkgver::https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-amd64")
sha256sums=('8ccbf0e4457afdacc20dbef09bb8509f169459fe8040c56e5253183ce0541385')

package() {
        install -Dm 755 "${pkgname}-$pkgver" "$pkgdir/usr/bin/wait4x"
}
