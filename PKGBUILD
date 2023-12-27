# Maintainer: Matthew Charlston

pkgname="horizontallyspinningrat"
pkgver=2.0
pkgrel=1
depends=()
optdepends=("lolcat: rainbow mode")
pkgdesc="The horizontally spinning rat - now on your desktop!"
url="https://github.com/mcharlsto/rat"
arch=("x86_64")
license=("GPL3")
source=("https://github.com/mcharlsto/rat/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("ec01924d55793617c49cf7043695d3b1b1dafd70b4f18aae33d1b566990ffabc")

package() {
    cd $srcdir/rat-$pkgver
    make linux_audio
    install -Dm755 ./bin/rat -t "${pkgdir}/usr/bin/"
}
