# Maintainer: David Holland <info (at) dustvoice.de>

# You have to
#  login to https://backstage.renoise.com
#  download your copy
#  place it into same DIR as this file

pkgname="tal-sampler"
pkgver="3.2.9"
pkgrel="1"
pkgdesc="A sampler VST plugin from TAL"
arch=("x86_64")
url="https://tal-software.com/products/tal-sampler"
license=()
depends=()
optdepends=()
makedepends=()
options=("!strip")
conflicts=()

source=("file://TAL-Sampler_64_linux.zip")
md5sums=('SKIP')

prepare() {
    bsdtar xf "$srcdir/TAL-Sampler_64_linux.zip"
}

package() {
    install -Dm 755 "TAL-Sampler.so" "$pkgdir/usr/lib/vst/tal-sampler.vst/TAL-Sampler.so"
}
