# Maintainer: Franck Stauffer <franck.stauffer@protonmail.ch>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.19.0
pkgrel=1
arch=('x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz")
b2sums=('cb3aa56b1f4ea043e8a8580898603038bb61a494ec3b4c26ecaf65c35772d5fa482a58758110714cba9d710663758c8c6423d04920db63dd2d23348682fa0bb3')

package() {
  cd oxygen-$pkgver
  install -d $pkgdir/usr/share/sounds
  for file in sounds/*.ogg;do
    install -m 644 $file $pkgdir/usr/share/sounds
  done
}
