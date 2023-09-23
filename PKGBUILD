# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.72.1
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64')
url="https://www.rust-lang.org/"
license=('Apache' 'MIT')
options=('docs')
source=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('78dd94cc79f75d84f85b2cef9067d208c473992c5c87db4f598b71a35eca8f18')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${pkgname}/share/doc/"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r rust/html "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
}
# vim:set ts=4 sw=4 et:
