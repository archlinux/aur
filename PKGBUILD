# Maintainer: Vitaliy Berdinskikh <ur6lad at tuta dot io>
pkgname=sway-keyboard-layout 
pkgver=1.0.0
pkgrel=2
pkgdesc='Show keyboard layout in the status bar.'
arch=('i686' 'x86_64')
url='https://gitlab.com/racy/sway-keyboard-layout'
license=('Apache2')
depends=('sway' 'i3status' 'xkblayout')
install=sway-keyboard-layout.install
source=(https://gitlab.com/racy/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('f29bddd169f4103750bc74d90f98f5520b07c7352c657440afe5ace91c72e3dc')

package() {
	cd "$srcdir"/$pkgname-$pkgver

	install -d "$pkgdir"/usr/bin
	install -m 755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
