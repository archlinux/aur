# Maintainer: Amal Karunarathna <nasashinega@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Nabil Freij <nabil.freij@gmail.com>

pkgname=gnome-shell-extension-workspaces-to-dock
_gitname=workspaces-to-dock
pkgver=51_3.32
pkgrel=1
pkgdesc="Gnome shell extension, Workspaces to Dock, Transform Gnome Shell's overview workspaces into an intelligent dock."
arch=('any')
url="https://github.com/passingthru67/workspaces-to-dock"
license=('GPL3')
depends=('gnome-shell>=3.32')
conflicts=("${pkgname}-git")
source=("https://github.com/passingthru67/${_gitname}/archive/${_gitname}.v${pkgver}.tar.gz")
sha256sums=('e6da3d9798c99e3072ead9662c6dab126dbf4a864a3330e0271391096c1c2ad5')

package() {
  cd "${srcdir}/${_gitname}-${_gitname}.v${pkgver}"
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -a "workspaces-to-dock@passingthru67.gmail.com" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
