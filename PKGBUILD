# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=Nu1LL1nuX
pkgname=nu1ll1nux
pkgver=1.1.189
pkgrel=1
pkgdesc='ArchLinux install scripts, with riced configs for the Nu1LL1nuX platform.'
arch=(x86_64)
url="https://gitlab.com/qYp/$pkgname"
license=('MIT')
depends=(dialog)
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('3a4f35713a2043ddc7f4b187a870c631f41b9116c9cbc4fa6ccf6fc0a69fbfbf')

package() {
    install -Dm755 opt/Nu1LL1nuX/{Nu1LL1nuX.sh,pre-install.sh} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 opt/Nu1LL1nuX/Nu1LL1nuX.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
