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
sha256sums=('f5328c5457484477280ec822debb2f002df449d38e9820050b324fa07ac7c576')

package(){
    cd "${srcdir}"
    tar -xvf data.tar.xz -C "${pkgdir}"
}
