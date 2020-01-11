# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.17.5
pkgrel=1
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz")
sha256sums=('58954374a4b9067365ee5d50b32b1986b2e7dd31e73cbf79fda8d978949943be')

package() {
  cd oxygen-$pkgver
  install -d "${pkgdir}/usr/share/sounds"
  for file in sounds/*.ogg;do
    install -m 644 "$file" "${pkgdir}/usr/share/sounds"
  done
}
