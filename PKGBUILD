# Maintainer: Murat Çileli <murat.cileli@gmail.com>

pkgname=paselect
pkgver=1.0
pkgrel=1
pkgdesc="Select Pulse Audio profile and output easily."
url="https://github.com/murat-cileli/$pkgname"
arch=('any')
depends=('pulseaudio')
license=('MIT')
source=("https://github.com/murat-cileli/paselect/archive/1.0.tar.gz")
sha256sums=('c8ec994520c328b3f5c05301e7815526cf90739dcd009d3afc41aa91dfca1eca')

package() {
    cd $pkgname-$pkgver
    find paselect.sh -type f -exec \
        install -Dm755 {} "$pkgdir/usr/local/bin/$pkgname" \;
}
