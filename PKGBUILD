# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.19.4
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d4b12d920c5d6895e9c373c4526bdd17b58a686bedcdd997241b9e0e3c70adbc')
sha256sums_aarch64=('5a7301d87a55cc9ccc4dd6c4d3262add05802bdaba13983b8ab26f1239a02a3f')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
