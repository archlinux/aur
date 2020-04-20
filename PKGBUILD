# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.18.4
pkgrel=1
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz")
sha256sums=('c98e4140ec4bd8e1da8565bae66302ea56929c075607fbc18059abc6e7c29a13')

package() {
  cd oxygen-$pkgver
  install -d "${pkgdir}/usr/share/sounds"
  for file in sounds/*.ogg;do
    install -m 644 "$file" "${pkgdir}/usr/share/sounds"
  done
}
