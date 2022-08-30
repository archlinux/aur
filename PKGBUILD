pkgname=portx-bin
_pkgname=portx
pkgver=2.1.2
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
        "PortX_latest_amd64.deb"::https://cdn.netsarang.com/0ac7ea20/PortX_latest_amd64.deb
    )
sha256sums=('da8b1d933deac86cf9b123c146a639c473909590ddc69de89e31f3f48b5b4559')

package(){
    cd "${srcdir}"
    tar -xvf data.tar.xz -C "${pkgdir}"
}
