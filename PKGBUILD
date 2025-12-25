pkgname=portx-bin
_pkgname=portx
pkgver=2.2.15
pkgrel=1
pkgdesc="lightweight cross-platform SSH Client"
arch=("x86_64")
license=("Proprietary")
url="https://portx.online/"
depends=('gtk3' 
    'libnotify' 
    'nss'
    'libxss' 
    'libxtst' 
    'xdg-utils' 
    'at-spi2-core' 
    'util-linux-libs' 
    'libappindicator-gtk3' 
    'libsecret')
    provides=("$_pkgname")
    source=(
        "PortX_${pkgver}_amd64.deb"::https://cdn.netsarang.com/0ac7ea20/PortX-latest-amd64.deb
    )
sha256sums=('dcf4e9ab00f293979c6af283b56e68734bc6da8813ee28e2654d09c52bda03fb')
package(){
    cd "${srcdir}"
    tar -xvf data.tar.xz -C "${pkgdir}"
}
