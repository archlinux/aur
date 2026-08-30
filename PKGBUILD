# Maintainer: Bruno do Nascimento <eusouobn@gmail.com>
pkgname=sddm-astronaut-theme-bin
pkgver=88.292c87b
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

source=("https://github.com/eusouobn/sddm-astronaut-theme-bin-releases/releases/download/v${pkgver}/sddm-astronaut-theme-full-${pkgver}-any.tar.gz")
sha256sums=('6cd2392fe409e614e8dd85f1cead365625ddf382f6b29f8f1d8eb006f7a0cbb0')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
