# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.74.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64')
url="https://www.rust-lang.org/"
license=('Apache' 'MIT')
options=('docs')
source=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('b7d4ec862689467fe4de170edcb8e8e737a2ae749d265122cbdaf9f46c539b8e')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${pkgname}/share/doc/"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r rust/html "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
}
# vim:set ts=4 sw=4 et:

