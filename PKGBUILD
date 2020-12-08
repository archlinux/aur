# Maintainer: Kevin Del Castillo Ramirez <quebin31@gmail.com>
pkgname=gnome-shell-extension-pop-shell-bin
pkgdesc="Pop Shell - Tiling window management in Gnome (WIP, precompiled)"
pkgver=1.0.0
pkgrel=1
arch=(any)
url="https://github.com/pop-os/shell"
license=("GPLv3")
optdepends=('gnome-shell-extensions: native-window extension for improved window placement')
conflicts=("gnome-shell-extension-pop-shell")
depends=("gnome-shell" "pop-shell-shortcuts-git")

_gitorg=pop-os
_gitname=shell
_dir="${_gitorg}-${_gitname}-${pkgver}"
source=("${_dir}.zip::https://github.com/${_gitorg}/${_gitname}/releases/download/${pkgver}/pop-shell@system76.com_${pkgver}.zip")
sha256sums=("69a09a1a317689c6361f3d42396d7a7e310245e72b5d7c3d91358927303260f6")

package() {
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
    cp -r "${srcdir}" "${pkgdir}/usr/share/gnome-shell/extensions/pop-shell@system76.com"
}
