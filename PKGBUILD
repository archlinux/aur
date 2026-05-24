# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.19.21
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f2249010767c264837823b30479a9f5838c88b14b80337264c2c7d11fe6f9b7d')
sha256sums_aarch64=('83740165a9c81d98935295acb73c8a62e48a269c9133263d8bf6e5988d2e5bb8')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
