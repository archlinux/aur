# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.19.13
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ba8c4a2888d17a85af2ba7ea3f4faf48dca6d22e660c465554ea7cbb1461590b')
sha256sums_aarch64=('3bebdb0228edaba67952783096a07790065fe6eb6a15c1dde4fe8e0fceb84def')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
