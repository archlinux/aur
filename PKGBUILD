# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.66.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64')
url="https://www.rust-lang.org/"
license=('Apache' 'MIT')
options=('docs')
source=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('7255b6cd4104d98e75c27b16a7b6c07bc4bf1524d4d497f36040617373e5a783')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${pkgname}/share/doc/"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r rust/html "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
}
# vim:set ts=4 sw=4 et:
