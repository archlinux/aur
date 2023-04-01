pkgname=clash-meta-tun-hook
provides=('clash-meta-tun-hook')
pkgver=1
pkgrel=1
epoch=
pkgdesc="A hook which automatically runs setcap to enable TUN support"
arch=('any')
url=
license=('MIT')
depends=('bash')
makedepends=()
checkdepends=()
install=${pkgname}.install
source=(
    "clash-meta.hook"
)
md5sums=(
    "SKIP"
)
function package(){
    mkdir -p "${pkgdir}"/usr/share/libalpm/hooks/
    cp "${srcdir}"/clash-meta.hook "${pkgdir}"/usr/share/libalpm/hooks/90-clash-meta.hook
}
