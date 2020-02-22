# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-creepster
pkgver=1.000
pkgrel=1
pkgdesc='Scary font with capital letters'
arch=(any)
url="https://fonts.google.com/specimen/Creepster"
license=(OFL)
depends=(fontconfig xorg-font-utils)
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Creepster")
sha256sums=('3c2d4c5f63be0a23b4763aa9c17c3c227aaee689004af2eaaec8b1ef6d4203a9')

package() {
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
