# Maintainer: BenJule <benjamin.luetker@gmail.com>
pkgname=bambu-studio-bin
pkgver=02.07.01.11820.bj.0
pkgrel=1
pkgdesc="BambuStudio slicer for Bambu Lab 3D printers"
arch=('x86_64')
url="https://github.com/BenJule/BambuStudio"
license=('AGPL3')
provides=('bambu-studio')
conflicts=('bambu-studio')
depends=('gtk3' 'glib2' 'glibc' 'libsecret' 'webkit2gtk')
source=("BambuStudio.AppImage::https://github.com/BenJule/BambuStudio/releases/download/v02.07.01.11820-bj.0/BambuStudio_ubuntu-24.04_amd64_V02.07.01.11820.AppImage")
sha256sums=('3d5d7e86c04b91cfec4af7cb439f21ddbc848ba306a1470696fb984293fa43a8')
package() {
  install -Dm755 "$srcdir/BambuStudio.AppImage" "$pkgdir/usr/bin/bambu-studio"
}
