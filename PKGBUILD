# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=midi2grub
pkgver=0.0.1
pkgrel=1
pkgdesc="Creates files or argument strings for the “play” function of GRUB."
arch=('any')
url="https://gitlab.com/lukasfink1/midi2grub"
license=('MIT')
depends=('python-mido')
makedepends=('python-setuptools')
_commit="d9ff80689a2dc5141a6c75464b7c534298be12e0"
source=("${pkgname}::git+${url}#commit=${_commit}")
md5sums=(SKIP)

package() {
  cd $pkgname
  install -Dm755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
