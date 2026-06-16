# Maintainer: BenJule <benjamin.luetker@gmail.com>
pkgname=bambu-studio-nightly-bin
pkgver=20260616.574a6e1
pkgrel=1
pkgdesc="BambuStudio nightly pre-release builds for Bambu Lab 3D printers"
arch=('x86_64')
url="https://github.com/BenJule/BambuStudio"
license=('AGPL3')
depends=('gtk3' 'glib2' 'glibc' 'libsecret' 'webkit2gtk')
source=("BambuStudio.AppImage::https://github.com/BenJule/BambuStudio/releases/download/nightly-20260616-574a6e1/BambuStudio_ubuntu-24.04_amd64_V02.07.01.11814.AppImage")
sha256sums=('f8309250857acbff3a90eb93c228576aae821a1bb07031580e80f0da9d413636')
package() {
  install -Dm755 "$srcdir/BambuStudio.AppImage" "$pkgdir/usr/bin/bambu-studio"
}
