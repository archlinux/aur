# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=xcursor-pinux
pkgver=0.3
pkgrel=14
pkgdesc="Pinux's Tux Cursors Theme"
arch=('any')
url="https://store.kde.org/p/999945/"
license=('GPL')
source=("https://distribute.kde.org/khotnewstuff/mousethemes/downloads/19506-pinux's-tux-cursors-theme-$pkgver.tar.bz2"
	pArch.tar.bz2)
sha256sums=('1b2c86df479adaa77f4b7574649118f3744d6774997beab4604ca0134b21b363'
            '5fc55497a9c50a62699d0c63a2c2fceb13b5684a781665de58e848f28357bfaa')

package() {
  mkdir -p "$pkgdir"/usr/share/icons
  cp -R "$srcdir"/cursors/* "$pkgdir"/usr/share/icons/
}
