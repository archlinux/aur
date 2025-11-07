pkgdesc="FLIR GenTL producer interface that enables the user to enumerate, communicate and stream from FLIR GigE Vision and USB3 Vision devices in a generic way independent from the underlying transport technology. This package contains shared libraries."
url='https://www.flir.com/'

pkgname='libgentl'
pkgver='4.2.0.88'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

source=("${pkgname}-${pkgver}.deb::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinnaker-${pkgver}-amd64/libgentl_${pkgver}_amd64.deb")
sha256sums=('a3d654fa861359b5e1d01ee3f13d06fcc87138b7b0b9b04d314352a6cceab1ee')

package() {
    # Extract data
    bsdtar -xf data.tar.zst -C "$pkgdir/"
    rm -rf "$pkgdir/usr/share/doc"
}
