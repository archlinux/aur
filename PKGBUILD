# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=skillshare-bin
pkgver=0.20.24
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
provides=('skillshare')
conflicts=('skillshare')
source_x86_64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/skillshare_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('bed077a4556a4e05e7513409fc65d44c0cfbcb28f427f3adf79944c84b4d3ddc')
sha256sums_aarch64=('0c3fe8000156fe1b341d65a05dd44b5f84918901cb16ca2b3158c024e3ec2f00')

package() {
    install -Dm755 skillshare "$pkgdir/usr/bin/skillshare"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
