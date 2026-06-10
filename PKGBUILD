# Maintainer: BenJule <benjamin.luetker@gmail.com>
pkgname=bambu-studio-nightly-bin
pkgver=20260610.7d71b4d
pkgrel=1
pkgdesc="BambuStudio nightly pre-release builds for Bambu Lab 3D printers"
arch=('x86_64')
url="https://github.com/BenJule/BambuStudio"
license=('AGPL3')
depends=('gtk3' 'glib2' 'glibc' 'libsecret' 'webkit2gtk')
source=("BambuStudio.AppImage::https://github.com/BenJule/BambuStudio/releases/download/nightly-20260610-7d71b4d/BambuStudio_ubuntu-24.04_amd64_V02.07.01.11789.AppImage")
sha256sums=('0bfb907e806c84b804b771dddd327e27cb526592e4b4e270e73699a9d397febd')
package() {
  install -Dm755 "$srcdir/BambuStudio.AppImage" "$pkgdir/usr/bin/bambu-studio"
}
