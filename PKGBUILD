# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.14.0
pkgrel=1
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz")
sha256sums=('ca1ec2d002e989bf8dfb676e73303e9245cfe50887876eff6dc1d4293f746a4d')

package() {
  cd oxygen-$pkgver
  install -d "${pkgdir}/usr/share/sounds"
  for file in sounds/*.ogg;do
    install -m 644 "$file" "${pkgdir}/usr/share/sounds"
  done
}
