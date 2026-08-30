# Maintainer: Bruno do Nascimento <eusouobn@gmail.com>
pkgname=sddm-astronaut-theme-bin
pkgver=62.8f41a83
pkgrel=1
pkgdesc="Series of modern looking themes for SDDM (versão binária pré-compilada)"
arch=('any')
url="https://github.com/Keyitdev/sddm-astronaut-theme"
license=('GPL-3.0-or-later')
depends=('sddm')
provides=('sddm-astronaut-theme')
conflicts=('sddm-astronaut-theme' 'sddm-astronaut-theme-git')
install="${pkgname}.install"
options=(!debug)

source=("https://github.com/eusouobn/sddm-astronaut-theme-bin-releases/releases/download/v62.8f41a83/sddm-astronaut-theme-full-${pkgver}-any.tar.gz")
sha256sums=('b9b0f65aba5be8974ed87837455d0f88583f2db51bdeeb5bd37cf6470d42ceb2')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
