# Maintainer: OrkenWhite <orkenwhite@disroot.org>
pkgname=ytfe
pkgver=1.27.2
pkgrel=1
pkgdesc="Lightweight YouTube client using the LCL toolkit"
arch=('x86_64' 'i686')
url="http://oscomp.hu"
license=('custom')
depends=('qt5pas')
makedepends=('xz')
source=('http://oscomp.hu/depot/ytfe.png' 'ytfe.desktop' 'LICENSE')
source_x86_64=("${pkgname}_x86_64_${pkgver}.xz::http://oscomp.hu/depot/ytfe_direct/${pkgver}/ytfe_linux_x86_64.xz")
source_i686=("${pkgname}_i686_${pkgver}.xz::hhttp://oscomp.hu/depot/ytfe_direct/${pkgver}/ytfe_linux_i686.xz")
sha256sums=( '29220d99cb0e33675e2d349a023eea0877a3befefc61b19f4d901db29f7d1698' '44bc1c569ae7829e65bc5ec3525ad260a2dc64d340da0f9912c4395552134eae' 'bf8e1295602992c618eacbc43a36c201293c8a159f49dd42a724c72f5e8a5267')
sha256sums_x86_64=('410b88ae9e167ac2d487d625aab1e44194f0e7961f47aa49b6c39391a993cf40')
sha256sums_i686=('dee1f3d9f193cac777adc2b311700dea0f9424324410128b2924163d0cf09b2f')
optdepends=('yt-dlp: default downloader' 
	'mpv: default player'
	'vlc: compatible video player')
install="ytfe.install"
package() {
	install -Dm755 ${pkgname}_${arch}_${pkgver} $pkgdir/usr/bin/$pkgname
	install -Dm644 ${pkgname}.png $pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png
	install -Dm644 ${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
