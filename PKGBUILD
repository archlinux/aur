# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.18.7
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3cbff8d36dbd32a77ff53f9dbba2dd8feaf04bdf47c1ae1bc549d0100fc6fd59')
sha256sums_aarch64=('bb52a5270710e6787f1975c4a9f17d5db9849f72568f9a2f6e43d94701f541ed')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
