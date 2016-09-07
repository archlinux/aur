# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Romanos Skiadas <rom.skiad@gmail.com>
# Contributor: Melik Ludwig Manukyan <melik@archlinux.us>

pkgname="jordyn-system-info-git"
pkgver=0.3.2
pkgrel=1
pkgdesc="Jordyn-system-info is a system infomation tool written in python 2, And is also a fork of archey."
url="https://github.com/jcjordyn130/jordyn-system-info"
license=('GPL')
source=("git://github.com/jcjordyn130/jordyn-system-info.git")
sha512sums=('SKIP')
arch=('any')
depends=('python2' 'lsb-release')
makedepends=('git')
optdepends=('scrot: for taking screenshots of the output')
provides=("jordyn-system-info")

package() {
  cd "${srcdir}/jordyn-system-info"
  git pull origin aur
  install -D -m755 jordyn-system-info ${pkgdir}/usr/bin/jordyn-system-info
}

# vim:set et sw=2 sts=2 tw=80:
