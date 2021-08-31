# Maintainer: OrkenWhite <orkenwhite@disroot.org>
pkgname=ytfe
pkgver=1.7.2
pkgrel=1
pkgdesc="YouTube frontend"
arch=('x86_64' 'i686')
url="http://oscomp.hu"
license=('custom')
depends=('gtk2')
makedepends=('xz')
source=('http://oscomp.hu/depot/ytfe.png' 'ytfe.desktop' 'LICENSE')
source_x86_64=('http://oscomp.hu/depot/ytfe_linux_x86_64.xz')
source_i686=('http://oscomp.hu/depot/ytfe_linux_i686.xz')
sha256sums=( '29220d99cb0e33675e2d349a023eea0877a3befefc61b19f4d901db29f7d1698' '44bc1c569ae7829e65bc5ec3525ad260a2dc64d340da0f9912c4395552134eae' 'bf8e1295602992c618eacbc43a36c201293c8a159f49dd42a724c72f5e8a5267')
sha256sums_x86_64=('a23d79298bee389742c2a433251db57951413568452198f53c0d9a4edb39826d')
sha256sums_i686=('2ed9acd0c57a7e713245695311c846d5377fc1fc91e620c87b5aa29c43c0f700')
optdepends=('youtube-dl: default downloader' 
	'mpv: default player'
	'vlc: compatible video player')
package() {
	install -Dm755 ${pkgname}_linux_${arch} $pkgdir/usr/bin/$pkgname
	install -Dm644 ${pkgname}.png $pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png
	install -Dm644 ${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
