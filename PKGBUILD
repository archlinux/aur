# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="horcrux-bin"
pkgver="0.2"
pkgrel=1
pkgdesc="Split your file into encrypted horcruxes so that you don't need to remember a passcode"
url="https://github.com/jesseduffield/horcrux/"
license=("MIT")
arch=("x86_64" "i686" "armv6h" "aarch64")
provides=("horcrux")
conflicts=("horcrux")
source_x86_64=("$url/releases/download/v$pkgver/horcrux_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/horcrux_${pkgver}_Linux_32-bit.tar.gz")
source_armv6h=("$url/releases/download/v$pkgver/horcrux_${pkgver}_Linux_armv6.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/horcrux_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('deb9ce75ed5dd461319b99c2b2a82a8d9c5d89d15d834189b57666e08c45f996')
sha256sums_i686=('a683b13da979f36f48b0a93ddd0cdc037e3c5480a660bdc909f09db29c77ab68')
sha256sums_armv6h=('8211fa5d1926d74b6bdf669666c8efc92568b4e19f7e2d91d0c7300b53366e94')
sha256sums_aarch64=('6956d4173ed60632767c35a9285d63751bdb6ca8aabeaaa2f58021a20e1a6449')

package(){
 install -D -m 755 "horcrux" "$pkgdir/usr/bin/horcrux"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
