pkgname=publisher
pkgver=0.0.3
pkgrel=0
pkgdesc="Tool to publish & distribute CLI tools"
arch=('x86_64' 'i686')
url="https://github.com/termapps/publisher"
license=("MIT")
provides=("publisher")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-x86_64-unknown-linux-gnu.zip)
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_x86_64=("b23e6657c19ccf0cd751bd85f8d3b026ec5bebdad34aa3dba712679711893705")
sha256sums_i686=("99544f5934ce9dd93d00ba33731f0b6fadc13d8c6a4151b6062835e7bdec25ed")

package() {
    cd "$srcdir"
    install -Dm755 "publisher" "$pkgdir/usr/bin/publisher"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/publisher/LICENSE"
}
