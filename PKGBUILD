# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=2.0.2
pkgrel=1
pkgdesc='ArchLinux bootstrap scripts, with optional riced configs for the AutoLinux platform'
arch=(x86_64)
url="https://gitlab.com/qYp/${_pkgname}"
license=('MIT')
depends=(dialog)
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('9b620d48396f0d0e2f691a6831b01e1bde753842fe68b0e43d98712afdb493c8')

package() {
    install -Dm755 ${pkgname}/{AutoLinux.sh,pre-install.sh} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${pkgname}/AutoLinux.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
