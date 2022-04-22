# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=auto
pkgver=4.1
pkgrel=1
pkgdesc='ArchLinux bootstrap and partitioning script, with a selection of WM and DEs'
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
install="auto.install"
license=('MIT')
depends=(dialog)
source=(
  "https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig")
sha256sums=('5c7b3c33ac4f9c231606a948f47fa9ebbf1ba9952759535108b8d40b2bd2d761'
            'SKIP')

package() {
    install -Dm755 usr/bin/{auto,autoCleanInstall,autoInstall,autoPart} -t "${pkgdir}/usr/bin"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
