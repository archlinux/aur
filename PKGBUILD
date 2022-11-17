# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=checkupdates-with-aur
pkgver=1.0
pkgrel=1
pkgdesc="Helper script to check updates, including AUR updates"
arch=('any')
license=('Unlicense')
depends=('pacman-contrib' 'aurutils')
source=("${pkgname}.sh")
sha256sums=('7dc7d98367e6c929a291346eae286509132f4a46f5561b4cff4c69e98360034b')
noextract=()

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
