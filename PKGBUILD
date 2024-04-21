pkgname=smw-bin
_pkgname=SMW-bin
pkgver=0.1
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
pkgdesc="A reverse engineered implementation engine for Super Mario World."
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/smw"
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_i386=('91015887f18e346c33c662deafc758195b5a9c41459c306dd07f7c366ccc768e')
sha256sums_i686=('91015887f18e346c33c662deafc758195b5a9c41459c306dd07f7c366ccc768e')
sha256sums_x86_64=('b639890c108dc9c3ed0ddb26e0f618e86b731e96ad315f5060f49160f670dc2c')
sha256sums_aarch64=('1b06150cc7f7848aca820280a1e7e94b5f02dda08f38044ee5ccd84bebf590d9')
source_x86_64=("$url/binaries/$pkgver/-/raw/main/smw-linux-x64.tar.xz")
source_aarch64=("$url/binaries/$pkgver/-/raw/main/smw-linux-arm64.tar.xz")
source_i386=("$url/binaries/$pkgver/-/raw/main/smw-linux-i686.tar.xz")
source_i686=("$url/binaries/$pkgver/-/raw/main/smw-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/smw" "$pkgdir/usr/bin"
}
