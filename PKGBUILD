# Maintainer: Dani Burke <dburke@addictmud.org>
pkgname=go-envsubst-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Go-powered envsubst with full template logic"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/dwburke/go-envsubst"
license=('MIT')
provides=('go-envsubst')
conflicts=('go-envsubst')
source_x86_64=("${url}/releases/download/v${pkgver}/go-envsubst_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/go-envsubst_Linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/go-envsubst_Linux_armv7.tar.gz")

# Update these checksums after each release
# Download the checksums.txt from the GitHub release and copy the appropriate SHA256 values
sha256sums_x86_64=('aab9612ef284c6e507c8086cb184296fad5455d0296631a2e12e25a1820b3e14')
sha256sums_aarch64=('f7f5c729b4f5cc7bda2cc32b9ac1658e4330d0e9ce8a853d95c4815e4d83783f')
sha256sums_armv7h=('ffff82e99d81c4d9a8dada22ca12819e3599d67873eadb063e1dcba42e2693d6')

package() {
    install -Dm755 go-envsubst "${pkgdir}/usr/bin/go-envsubst"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
