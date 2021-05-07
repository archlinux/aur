# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=ffdesktop
pkgver=1.0
pkgrel=1
pkgdesc="Emulate a webcam with V4L2"
arch=('x86_64')
url="https://github.com/Benni3D/ffdesktop"
license=('MIT')
depends=('ffmpeg' 'v4l2loopback-dkms')
source=("https://github.com/Benni3D/ffdesktop/archive/v${pkgver}.tar.gz")
md5sums=('526d0244129acc7b88bd7ddc827d61a2')

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm755 ffdesktop.sh "${pkgdir}/usr/bin/ffdesktop"
}

