# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.21.12
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5717b8282c8d579fd0ee149a3674209fe5c3ef2fccdc422c1245ff96d0260ddb')
sha256sums_aarch64=('41e69575ab22e12db7aedd492933c606421ba9a14650dda57f0acafafcfbef3c')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
