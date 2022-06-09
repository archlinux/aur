# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=xterm-alacritty-symlink
pkgver=2
pkgrel=1
pkgdesc="symlink to alacritty from xterm, required by gtk-launch for terminal applications"
arch=("any")
license=('GPL')
depends=("neovim")
provides=("xterm")
conflicts=("xterm")

package() {
    mkdir -p "${pkgdir}"/usr/bin
    cd "${pkgdir}"/usr/bin
    ln -s alacritty xterm
}
