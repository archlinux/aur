# Maintainer: BenJule <benjamin.luetker@gmail.com>
pkgname=bambu-studio-nightly-bin
pkgver=20260624.9321064
pkgrel=1
pkgdesc="BambuStudio nightly pre-release builds for Bambu Lab 3D printers"
arch=('x86_64')
url="https://github.com/BenJule/BambuStudio"
license=('AGPL3')
depends=('gtk3' 'glib2' 'glibc' 'libsecret' 'webkit2gtk')
source=("BambuStudio.AppImage::https://github.com/BenJule/BambuStudio/releases/download/nightly-20260624-9321064/BambuStudio_ubuntu-24.04_amd64_V02.07.01.11820.AppImage")
sha256sums=('a7ca31f1d767c8a5e123eeeb473d5b027ed7e86f8e0e1e4776c9cede01c5f10e')
package() {
  install -Dm755 "$srcdir/BambuStudio.AppImage" "$pkgdir/usr/bin/bambu-studio"
}
