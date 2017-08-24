# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>
pkgname=docker-hook
_pkgname=docker
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Pacman hook to restart docker"
arch=('any')
url="https://aur.archlinux.org/packages/docker-hook"
license=('CC0')
depends=('docker')

source=("${_pkgname}.hook")
md5sums=('c88a2183af92372d327d6d69b37dc306')

package() {
  cd "${pkgdir}"
  install -dm755 usr/share/libalpm/hooks
  install -m644 "${srcdir}/${_pkgname}.hook" usr/share/libalpm/hooks/${_pkgname}.hook
}
