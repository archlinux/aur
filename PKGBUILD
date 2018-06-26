# Maintainer: Jannick Hemelhof <mister dot jannick at gmail dot com>

pkgname=node-prune
pkgver=1.0.1
pkgrel=2
pkgdesc="Remove unnecessary files from node_modules"
arch=('x86_64')
url="https://github.com/tj/node-prune"
license=('MIT')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/tj/node-prune/releases/download/v1.0.1/node-prune_1.0.1_linux_amd64.tar.gz"
    )
sha512sums=('db14ed6605a5c300064fe3c1339b8370dd430d3367169e8dba12f75a0b4e309ec4b0dff8abe7eeec3ae1abc1f58c2e97613ae3cf9394736ee04b4a7147cc5ffd')

package() {
    cd "${srcdir}"

    install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}