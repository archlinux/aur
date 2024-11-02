# Maintainer: Thomas Clarke <colonia_duck@posteo.net>
pkgname="elite-pip-macro-bin"
_pkgname="elite-pip-macro"
pkgver=0.1.0
pkgrel=2
pkgdesc="Elite Dangerous Pip Macros for Linux X11 made with Rust"
arch=("x86_64")
url="https://github.com/CMDR-WDX/elite-pip-macro"
license=('MIT')
depends=('alsa-lib' 'pkgconf' 'libxtst')
makedepends=('cargo')
conflicts=('elite-pip-macro')
source=(
  "$pkgname.tar.gz::https://github.com/CMDR-WDX/elite-pip-macro/releases/download/v${pkgver}/${_pkgname}.tar.gz"
)
sha256sums=("e007680d557d2595ce01decde76896f4aaf81384280b845e6942ff6c896164ce")

package() {

  install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
