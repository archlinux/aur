# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.21.0
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ee26062a1e525b195f4a82bb16de5a1952337a1113e6cf3b21f39ec6d11f2fd0')
sha256sums_aarch64=('baaf672efa36afdf02a1e5bce1a6a2d5e604a65a905bc65cde1f980bc22ac12b')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
