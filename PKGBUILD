# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
_pkgname=arandr-indicator
pkgname="${_pkgname}-git"
pkgver=1
pkgrel=2
pkgdesc="Quick and simple tray icon menu for changing the monitor layout."
arch=('any')
url="https://github.com/denilsonsa/${_pkgname}"
license=('BSD-2')
depends=('pygtk' 'libappindicator' 'python2-xdg')
makedepends=('git')
optdepends=('arandr: to configure monitor layouts')
source=("git+https://github.com/denilsonsa/${_pkgname}.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
