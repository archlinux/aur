# Maintainer: Franck Stauffer <franck.stauffer@protonmail.ch>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.19.1
pkgrel=1
arch=('x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz")
b2sums=('9ec3528aa8f6482fd3edd4270493e20ef010ded06d71eb2b37e359bae708c72dab4c4d4390662facb50c14c0481bb1227c21d420b673a0d0af80ac661dfbdb50')

package() {
  cd oxygen-$pkgver
  install -d $pkgdir/usr/share/sounds
  for file in sounds/*.ogg;do
    install -m 644 $file $pkgdir/usr/share/sounds
  done
}
