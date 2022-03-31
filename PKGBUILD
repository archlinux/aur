# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=2.1.1
pkgrel=1
pkgdesc='ArchLinux bootstrap scripts, with optional riced configs for the AutoLinux platform'
arch=(x86_64)
url="https://gitlab.com/qYp/${_pkgname}"
license=('MIT')
depends=(dialog)
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('c03c51aab070049c933c76afc5689d797f71ca203052ee98bf068a284b9eedd2')

package() {
    install -Dm755 ${pkgname}/{AutoLinux.sh,pre-install.sh} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${pkgname}/AutoLinux.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
