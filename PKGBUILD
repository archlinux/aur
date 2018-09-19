# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.13.5
pkgrel=1
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz")
sha256sums=('cd1f5539a31a0eae0c43eb5612fa5c13eca605ad023dd437a6603d009fada272')

package() {
  cd oxygen-$pkgver
  install -d "${pkgdir}/usr/share/sounds"
  for file in sounds/*.ogg;do
    install -m 644 "$file" "${pkgdir}/usr/share/sounds"
  done
}
