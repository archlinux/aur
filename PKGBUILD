# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=enginesound-bin
pkgver=1.3.0
pkgrel=3
pkgdesc="Procedural engine sound generator controlled via GUI or CLI"
arch=('x86_64')
url="https://github.com/DasEtwas/enginesound/"
license=('MIT')
provides=('enginesound')
depends=('sdl2')
source=("enginesound::${url}releases/download/v${pkgver}/enginesound-x86_64-linux")
noextract=('enginesound')
md5sums=('e0280323349440bbd8eb348b1a4aff50')

package() {
	install -Dm755 enginesound -t "${pkgdir}/usr/bin/"
}