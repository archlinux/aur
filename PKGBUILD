# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.73.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64')
url="https://www.rust-lang.org/"
license=('Apache' 'MIT')
options=('docs')
source=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('829de9c3e808ec8dcc731fbb5e12050b51a76afe3d70e5e40f2791f629de8b6c')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${pkgname}/share/doc/"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r rust/html "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
}
# vim:set ts=4 sw=4 et:
