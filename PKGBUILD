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
source_x86_64=("https://github.com/jesseduffield/horcrux/releases/download/v0.2/horcrux_0.2_Linux_x86_64.tar.gz")
source_i686=("https://github.com/jesseduffield/horcrux/releases/download/v0.2/horcrux_0.2_Linux_32-bit.tar.gz")
source_armv6h=("https://github.com/jesseduffield/horcrux/releases/download/v0.2/horcrux_0.2_Linux_armv6.tar.gz")
source_aarch64=("https://github.com/jesseduffield/horcrux/releases/download/v0.2/horcrux_0.2_Linux_arm64.tar.gz")
md5sums_x86_64=("619f6b101bff7a00570d028d1cea7d95")
md5sums_i686=("1a790442363f0739f0a5c117365b3ec8")
md5sums_armv6h=("8751bbbb60e70925773f3075b7122776")
md5sums_aarch64=("2b874076bd22158b9199b664041db2bd")

package() {
 install -Dm755 "$srcdir/horcrux" "$pkgdir/usr/bin/horcrux"
}

 
