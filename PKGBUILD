pkgname=relive-bin
pkgver=1.0.4687
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
pkgdesc="An Open-Source Engine Replacement for Oddworld: Abe's Oddysee and Oddworld: Abe's Exoddus."
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/relive"
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_i686=('b538f9b71ef1660c08a333bbb1062397019fad4b273f905651c401265e7ad86d')
sha256sums_x86_64=('9da63d6d27458fcd11202076fa1a34283c6f571806b55c5e7e08565f13490455')
sha256sums_aarch64=('9ab9007e75e91c4032dc02fe4fd127e4858836fa464459df4c93b03028d1e768')
source_x86_64=("$url/1.0.4687/-/raw/main/relive-linux-x64.tar.xz")
source_aarch64=("$url/1.0.4687/-/raw/main/relive-linux-arm64.tar.xz")
source_i686=("$url/1.0.4687/-/raw/main/relive-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/relive" "$pkgdir/usr/bin"
}
