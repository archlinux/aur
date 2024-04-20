pkgname=rsdkv4-bin
_pkgname=RSDKv4-bin
pkgver=1.3.2
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="RSDKv4 engine for Sonic 1 and Sonic 2."
arch=('x86_64' 'aarch64' 'i386' 'i686')
url=""
license=('GPL')
depends=('wget' 'sdl2' 'sdl2_ttf' 'sdl2_mixer' 'glew')
makedepends=('unzip')
sha256sums_x86_64=('44901c0a59bff89ea8eafc83bc0fc110184c6b1c051cd5f41f2ba7e0f9fb6bba')
sha256sums_aarch64=('93e3c4f7d6fb29b4a1a7bf3ebb0e7cde231bfc0cb43371f7b2c98d432f102426')
sha256sums_i386=('8c915335ec7e0fd587732f7ff0cf76279e46c504d1921449d174678293ffb2ed')
sha256sums_i686=('8c915335ec7e0fd587732f7ff0cf76279e46c504d1921449d174678293ffb2ed')
source_x86_64=("https://gitlab.com/linuxbombay/SonicRSDK/binaries/$pkgver/-/raw/main/RSDKv4-linux-x64.tar.xz")
source_i386=("https://gitlab.com/linuxbombay/SonicRSDK/binaries/$pkgver/-/raw/main/RSDKv4-linux-i386.tar.xz")
source_i686=("https://gitlab.com/linuxbombay/SonicRSDK/binaries/$pkgver/-/raw/main/RSDKv4-linux-i386.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/SonicRSDK/binaries/$pkgver/-/raw/main/RSDKv4-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/RSDKv4" "$pkgdir/usr/bin"
}
