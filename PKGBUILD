# Maintainer: Mitch <ipha00@gmail.com>
pkgname=konsole-monokai
pkgver=1
pkgrel=1
pkgdesc="Monokai theme for konsole"
arch=("any")
url="https://github.com/nareshv/kde-konsole-colorschemes"
license=('MIT')
groups=()
depends=("konsole")
source=("https://raw.githubusercontent.com/nareshv/kde-konsole-colorschemes/master/Monokai.colorscheme")
sha256sums=("74581f74f10bb54d6aca2aba8f8da5e3a16779b23c7dfbd8086e9fac3d22cd77")

package() {
    install -Dm644 Monokai.colorscheme "$pkgdir/usr/share/konsole/Monokai.colorscheme"
}