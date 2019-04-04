
# Maintainer: rollingpanda0 <rollingpanda0 at gmail dot com>
pkgname=nzb-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A beautiful CLI front-end for Nozbe written in Rust."
arch=('x86_64')
url="https://gitlab.com/reisub0/nzb"
license=('MIT')
source=('LICENSE'
        "$pkgname-$pkgver.zip::https://gitlab.com/reisub0/nzb/-/jobs/artifacts/v${pkgver}/download?job=linux-x86_64")
md5sums=("3c87776c3d12e38215b96b2803959de5"
         "418fda24914446effa007d650b54d44d")

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/target/release/nzb" "${pkgdir}/usr/bin"
}
