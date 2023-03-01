# Maintainer: Funami
pkgname=fdroidcl-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="F-Droid desktop client"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mvdan/fdroidcl"
license=('BSD')
depends=('android-tools')
provides=('fdroidcl')
conflicts=('fdroidcl')
source=("https://raw.githubusercontent.com/mvdan/fdroidcl/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_amd64")
source_i686=("${pkgname}-${pkgver}-i686::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_386")
source_armv7h=("${pkgname}-${pkgver}-armv7h::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_armv7_gnueabihf")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_arm64")
sha256sums=('6b44db2e2b57c1f8a3b44f105650813bbef494e0472cb76620d4dfbffd96f988')
sha256sums_x86_64=('6fa4c09173eb49d0f46704d63092097f9603168189ee80950dfe86f692f5f6a2')
sha256sums_i686=('d26ea3a7ec2504e3e1be8af7e8ce217b1724ee6d5961989e0c076417988052eb')
sha256sums_armv7h=('d1d35033857f8fe5e10e24a46b789cd28f4f5ca7313ded7dbde96484e89346fd')
sha256sums_aarch64=('d1dabde9d29b4736599e9a1922b23711085c482bfb747a987548dcda911563e1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fdroidcl"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/fdroidcl"
}
