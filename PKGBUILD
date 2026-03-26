# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.18.0
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('dfbe567be2f050a0f8c17f2505d62845c58d1503de516d5cd342a8caf9373ae9')
sha256sums_aarch64=('0412d6633b04af30511eab7eba7e3d2ad9238bf71ca871e4ec9a9f3ccf474a1d')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
