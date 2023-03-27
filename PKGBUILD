# Maintainer: Gannon Koenig <dabewodactowluwu@gmail.com>
pkgname=eww-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='EWW - Widgets for everyone!'
url='https://github.com/elkowar/eww'
source=("https://github.com/TheBearodactyl/eww-bin/releases/download/$pkgver/eww")
arch=('x86_64')
license=('MIT')
depends=('gtk3' 'pango' 'cairo' 'glibc')
optdepends=('')
conflicts=('eww' 'eww-git' 'eww-wayland')
provides=('eww')
sha256sums=('ba430d798b8ef1b2e0a66796fa363046e55ad43e4a05ca787ef5d2bb87e22809')

package() {
  cd "$srcdir/"
  sudo install -Dm755 eww "/usr/bin/eww"
}
