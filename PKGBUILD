# Maintainer: taotieren <admin@taotieren.com>
_pkgname=NetWorker
pkgname=networker
pkgver=1.0.0
pkgrel=1
pkgdesc="A TCP/UDP debugging tool."
arch=('x86_64')
url="https://bbs.deepin.org/zh/post/216113"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=()
makedepends=()
backup=()
options=('!strip')
# install=${pkgname}.install
source=("${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha256sums=('10d762ad80dc25ee1303f77d4d7c63628c53fe266c32ac243b403d3f1fab2d83')

# prepare() {
#     tar xf ${srcdir}/ -C ${srcdir}
# }

package() {
    cp -rv ${srcdir}/usr ${pkgdir}
}
