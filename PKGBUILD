# Maintainer: Franck Stauffer <franck.stauffer@protonmail.ch>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.19.2
pkgrel=1
arch=('x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz")
b2sums=('bc34cbd6591050eb426dca48d92b0fb26bf5e9982125c5d98d5a7cf609395f02f6b7eb61bc2c8192fd5c5d59bb9abe7b279835654c3400766019e7c291c0edc4')

package() {
  cd oxygen-$pkgver
  install -d $pkgdir/usr/share/sounds
  for file in sounds/*.ogg;do
    install -m 644 $file $pkgdir/usr/share/sounds
  done
}
