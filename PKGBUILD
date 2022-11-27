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
        "PortX_latest_amd64.deb"::https://cdn.netsarang.net/0ac7ea20/PortX-latest-amd64.deb
    )
sha256sums=('5ddc419968baec5b238d44cffbfb5fb548b9e295f9e5af976001d3909626349b')

package(){
    cd "${srcdir}"
    tar -xvf data.tar.xz -C "${pkgdir}"
}
