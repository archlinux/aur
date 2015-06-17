# Maintainer: M0Rf30 < morf3089 at gmail dot com >

pkgname=kdeplasma-applets-actos-soundmenu-git
pkgver=4.b6d5fa2
pkgrel=1
pkgdesc="Very simple Sound Menu plasmoid with volume and playback (MPRIS) controls for the current media player"
url="https://github.com/ghinda/actos-soundmenu"
license=('GPL3')
depends=('kdebase-plasma' 'kdemultimedia-kmix')
source=('actos-soundmenu::git://github.com/ghinda/actos-soundmenu')
arch=('any')

package() {
  cd actos-soundmenu
  mkdir -p $pkgdir/usr/share/apps/plasma/plasmoids/actos-soundmenu
  cp -r * $pkgdir/usr/share/apps/plasma/plasmoids/actos-soundmenu
}

pkgver() {
  cd actos-soundmenu
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

md5sums=('SKIP')
