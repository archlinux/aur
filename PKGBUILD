# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.69.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64')
url="https://www.rust-lang.org/"
license=('Apache' 'MIT')
options=('docs')
source=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('6b01910ac884d2aa66d6a061d3e5608860d507797ae0339714374985b258b0cf')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${pkgname}/share/doc/"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r rust/html "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
}
# vim:set ts=4 sw=4 et:
