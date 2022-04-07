# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=Nu1LL1nuX
pkgname=nu1ll1nux
pkgver=1.1.190
pkgrel=1
pkgdesc='ArchLinux install scripts, with riced configs for the Nu1LL1nuX platform.'
arch=(x86_64)
url="https://gitlab.com/a4to/$pkgname"
license=('MIT')
depends=(dialog)
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('9fb6dcf037578a822e4e7024e15ed57266727558bff29a47688d2db0bbe85b86')

package() {
    install -Dm755 opt/Nu1LL1nuX/{Nu1LL1nuX.sh,pre-install.sh} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 opt/Nu1LL1nuX/Nu1LL1nuX.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
