pkgname=portx-bin
_pkgname=portx
pkgver=2.1.10
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
        "PortX_latest_amd64.deb"::https://cdn.netsarang.net/0ac7ea20/PortX-latest-amd64.deb
    )
sha256sums=('755ee2d65c476c55a751376b2e25d991b1074e4e5c8c72ba43bee7dab80b35a9')

package(){
    cd "${srcdir}"
    tar -xvf data.tar.xz -C "${pkgdir}"
}
