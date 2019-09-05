# Maintainer: Vicente Reyes <vreyesvaldivieso [at] gmail [dot] com>
pkgname=atool-desktop
pkgver=0.2
pkgrel=2
pkgdesc="Desktop Entry for atool-based archive unpacking"
arch=('any')
url="https://git.sr.ht/~vicentereyes/PKGBUILDs"
license=()
depends=('atool'
	 'dmenu')
source=("$pkgname.desktop" "$pkgname")
md5sums=('749254aae821b0c5278cd09ae64f8afd'
         '019970d73f97d7225796fd6c4a0d705b')

package() {
  install  -Dm0755 atool-desktop "${pkgdir}/usr/bin/atool-desktop"
  install  -Dm0644 atool-desktop.desktop "${pkgdir}/usr/share/applications/atool-desktop.desktop"
}
