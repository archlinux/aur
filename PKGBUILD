# Maintainer: Franck Stauffer <franck.stauffer@protonmail.ch>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.19.3
pkgrel=1
arch=('x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz")
b2sums=('6f21647d7cd05e143319979e6660287213e951d8206ebbb88f86f593767b282455d44e9ff85287b1edfd7eeac39fc428922ab60874ff291687e3583af93a1606')

package() {
  cd oxygen-$pkgver
  install -d $pkgdir/usr/share/sounds
  for file in sounds/*.ogg;do
    install -m 644 $file $pkgdir/usr/share/sounds
  done
}
