# Maintainer:Erwin-Iosef erwiniosef@gmail.com
pkgname=breeze-dark-red-cursor-git
pkgver=1.0
pkgrel=1
pkgdesc="Breeze Dark Red Cursor Theme by fbm224."
arch=('any')
url="https://store.kde.org/p/2075700"
license=('GPL-3.0-or-later')
source=("git+https://github.com/Erwin-Iosef/Breeze-Dark-Red.git")
makedepends=('git')
sha256sums=('SKIP')

pkgver() {
  cd "Breeze-Dark-Red"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/Breeze-Dark-Red"
    install -dm755 "${pkgdir}/usr/share/icons"
	cp -dr --no-preserve=ownership Breeze_Dark_Red $pkgdir/usr/share/icons/Breeze_Dark_Red
}
