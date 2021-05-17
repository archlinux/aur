# Maintainer: Cvolton < cvolton at cvolton dot eu >

pkgname=pb2launcher-bin
pkgver=1.0
pkgrel=1
pkgdesc="Plazma Burst 2 is a tactical slidescrolling shooter game developed by Eric Gurt."
arch=( 'x86_64' )
url="https://www.plazmaburst2.com/"
license=('custom')
provides=('pb2launcher')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=('https://www.plazmaburst2.com/pb2/PB2Launcher-1.deb')
sha512sums=('b6e440c643c31df4ae0acca4f79f5f9c3ef23ebfa2dfc4a9b200778ac2164f1a2fa1cdd76b8f14a0124799f64c3e2107aa43e264e60a76d9046625934f921019')

package() {

	tar xf data.tar.xz -C "${pkgdir}"

}