# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=auto
pkgver=4.1
pkgrel=1
pkgdesc='Auto/ArchLinux bootstrap and partitioning script, with a selection of WM and DEs'
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
install="auto.install"
license=('MIT')
depends=(dialog)
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('956399a4e574d558a4a646228a6366edf1811cfcb163dc2ea6bad8db30c02551')

package() {
    install -Dm755 ${pkgname}/{auto,autoCleanInstall,autoInstall,autoPart} -t "${pkgdir}/usr/bin"
    install -Dm644 ${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 ${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
