# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.16.14
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6ca33cff07ffe6e5c505c8dbde5df647369cd1d9046b1ca852e24683fc9109fa')
sha256sums_aarch64=('e2dd7eae297371e520472db38fe69c48a4f8a8680c8152dadb2aeb03246511a4')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
