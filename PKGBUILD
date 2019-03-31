# Maintainer: Dystechnic <dystechnic@gmail.com>
pkgname=brewbuddy
pkgver=5.4
pkgrel=1
pkgdesc="The best Dutch Open Source software for homebrewers!"
license=()
url="https://github.com/BrewBuddyOrg/BrewBuddy"
arch=("x86_64")
depends=("fann" "qt4pas" "openal")
provides=("BrewBuddy")
source=("https://github.com/BrewBuddyOrg/BrewBuddy/releases/download/5.4-ubuntu/brewbuddy-5.4_amd64.deb")
sha256sums=('SKIP')

prepare() {
   tar -xaf data.tar.xz
}

package() {
  cp -r usr "$pkgdir/"
}
