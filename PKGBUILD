# Maintainer: BenJule <benjamin.luetker@gmail.com>
pkgname=bambu-studio-bin
pkgver=02.07.01.11790.bj.0
pkgrel=1
pkgdesc="BambuStudio slicer for Bambu Lab 3D printers"
arch=('x86_64')
url="https://github.com/BenJule/BambuStudio"
license=('AGPL3')
provides=('bambu-studio')
conflicts=('bambu-studio')
depends=('gtk3' 'glib2' 'glibc' 'libsecret' 'webkit2gtk')
source=("BambuStudio.AppImage::https://github.com/BenJule/BambuStudio/releases/download/v02.07.01.11790-bj.0/BambuStudio_ubuntu-24.04_amd64_V02.07.01.11790.AppImage")
sha256sums=('6af4b758c033e0569bc0ef806e51a9b4dee0b1ae267c4c0d8a8537010f09d657')
package() {
  install -Dm755 "$srcdir/BambuStudio.AppImage" "$pkgdir/usr/bin/bambu-studio"
}
