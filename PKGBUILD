# Maintainer: Matthew Charlston

pkgname="horizontallyspinningrat"
pkgver=2.0.1
pkgrel=1
makedepends=(vim)
depends=()
optdepends=("lolcat: rainbow mode")
pkgdesc="The horizontally spinning rat - now on your desktop!"
url="https://github.com/mcharlsto/rat"
arch=("x86_64")
license=("GPL3")
source=("https://github.com/mcharlsto/rat/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('36b53db519c65b791e32e73708e008e3d0186944e2c70edf7074b3ecbae4d967')

package() {
    cd $srcdir/rat-$pkgver
    make linux_audio
    install -Dm755 ./bin/rat -t "${pkgdir}/usr/bin/"
}
