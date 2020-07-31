# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.19.4
pkgrel=1
arch=('x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz")
b2sums=('86153365b2499e6cee2f60960f4be70e7fe954ee20dc3bee8f858084996e561bd2908034bff6ea1d7079a8f11adf521f02aa0233af789a46dc567205cbf5af08')

package() {
  cd "oxygen-$pkgver"
  for file in sounds/*.ogg;do
    install -Dm 644 "$file" "$pkgdir/usr/share/sounds"
  done
}
