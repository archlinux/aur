# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.16.3
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e4cc4e374e0fb44fc612090c7d410972f90efbe9a13df4cd9852aa63f8b062fc')
sha256sums_aarch64=('354061c464918ed24e17eb11bf30d5764ec27dd9b97d1b7292c92ddf2c88d70a')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
