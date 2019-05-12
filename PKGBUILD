# Maintainer: Sasha Khamkov <sanusart@gmail.com>
# Maintainer: xgdgsc <xgdgsc at gmail dot com>
pkgname=gisto
pkgver=1.11.3
pkgrel=1
epoch=
pkgdesc="Cross-platform gist snippets management desktop application that allows you and your team share code snippets fast and easily. Based on GitHub Gist Infrastructure which means you can use all your existing snippets by connecting your GitHub account."
arch=("x86_64")
url="http://www.gistoapp.com/"
license=("MIT")
groups=()
options=(!strip)
depends=("nss" "gtk3" "libxss")
# PKGEXT=.tar
install=${pkgname}.install
source=("https://github.com/Gisto/Gisto/releases/download/v$pkgver/Gisto-$pkgver-amd64.deb")
md5sums=('3d7c847f8f021674a8c76d09e731d5c4')
package() {
    tar xf data.tar.xz -C "${pkgdir}"
}
