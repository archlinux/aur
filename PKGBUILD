pkgname=portx-bin
_pkgname=portx
pkgver=2.2.5
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
        "PortX_latest_amd64.deb"::https://cdn.netsarang.com/0ac7ea20/PortX-latest-amd64.deb
    )
sha256sums=('51eba45d1826f5fbe283aaea3f3d621e8dc7c9767425c18091f4cbb0a6e4fbac')
package(){
    cd "${srcdir}"
    tar -xvf data.tar.xz -C "${pkgdir}"
}
