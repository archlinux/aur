# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=rawbit
pkgver=0.1.15
pkgrel=2
pkgdesc='A camera RAW photo preprocessor and importer'
arch=('x86_64')
url="https://github.com/cartercanedy/$pkgname"
license=('MIT')
source=(
 "${url}/releases/download/v${pkgver}/${pkgname}-x86_64-unknown-linux-gnu.tar.gz"
 "https://raw.githubusercontent.com/cartercanedy/${pkgname}/refs/heads/master/LICENSE.txt")
sha256sums=('d27d4599e834a2a9aa1cf03a655d9cc08848909f8699bb6bca4761cc67b57b58'
            '2771f32e4af957d2bfff91d25d2102e04fe0adf1d08280427091cab807d4c2cf')
depends=('libiconv' 'gcc-libs')

package() {
    install -Dm0755 "rawbit" -t "$pkgdir/usr/bin"
    
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
