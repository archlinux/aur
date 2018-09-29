# Maintainer: Amal Karunarathna <nasashinega@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Nabil Freij <nabil.freij@gmail.com>

pkgname=gnome-shell-extension-workspaces-to-dock
_gitname=workspaces-to-dock
pkgver=49_3.30
pkgrel=1
pkgdesc="Gnome shell extension, Workspaces to Dock, Transform Gnome Shell's overview workspaces into an intelligent dock."
arch=('any')
url="https://github.com/passingthru67/workspaces-to-dock"
license=('GPL3')
depends=('gnome-shell>=3.30')
conflicts=("${pkgname}-git")
source=("https://github.com/passingthru67/${_gitname}/archive/${_gitname}.v${pkgver}.tar.gz")
sha256sums=('ad2829a2f1910b6da3beb6b78f43915ba3185d6e4edabec296704dc8fc7f29f3')

package() {
  cd "${srcdir}/${_gitname}-${_gitname}.v${pkgver}"
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -a "workspaces-to-dock@passingthru67.gmail.com" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
