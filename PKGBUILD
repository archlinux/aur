pkgname=zelda3-bin
_pkgname=Zelda3-bin
pkgver=0.3
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
pkgdesc="A reverse engineered implementation engine for Legend Of Zelda: Link to the Past."
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/zelda3"
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_i386=('74d7796f146fdbcd0c70de445286f91c6dd4d4615b717eeabc4801808c34ecef')
sha256sums_i686=('74d7796f146fdbcd0c70de445286f91c6dd4d4615b717eeabc4801808c34ecef')
sha256sums_x86_64=('91d335f388b59f7db2047dd69022aa71b58c9a033b8760425fd0ba753c8e84b2')
sha256sums_aarch64=('cff1287cd2849f75cc10b152018c473690988f375f5fce0ed110bc86dfec2868')
source_x86_64=("$url/$pkgver/-/raw/main/zelda3-linux-x64.tar.xz")
source_aarch64=("$url/$pkgver/-/raw/main/zelda3-linux-arm64.tar.xz")
source_i386=("$url/$pkgver/-/raw/main/zelda3-linux-i686.tar.xz")
source_i686=("$url/$pkgver/-/raw/main/zelda3-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/zelda3" "$pkgdir/usr/bin"
}
