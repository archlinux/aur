# Maintainer: Amal Karunarathna <nasashinega@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Nabil Freij <nabil.freij@gmail.com>

pkgname=gnome-shell-extension-workspaces-to-dock
_gitname=workspaces-to-dock
_urlversion=52_334
pkgver=52_3.34
pkgrel=1
pkgdesc="Gnome shell extension, Workspaces to Dock, Transform Gnome Shell's overview workspaces into an intelligent dock."
arch=('any')
url="https://github.com/passingthru67/workspaces-to-dock"
license=('GPL3')
depends=('gnome-shell>=3.34')
conflicts=("${pkgname}-git")
source=("https://github.com/passingthru67/${_gitname}/archive/${_gitname}.v${_urlversion}.tar.gz")
sha256sums=('cda2690138b28d0cee579b84d68dab4e82dc0ab656a9e2ae79e82976af1a3c3d')

package() {
  cd "${srcdir}/${_gitname}-${_gitname}.v${_urlversion}"
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -a "workspaces-to-dock@passingthru67.gmail.com" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
