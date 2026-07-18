# Maintainer: BenJule <benjamin.luetker@gmail.com>
pkgname=bambu-studio-nightly-bin
pkgver=20260718.b11db8f
pkgrel=1
pkgdesc="BambuStudio nightly pre-release builds for Bambu Lab 3D printers"
arch=('x86_64')
url="https://github.com/BenJule/BambuStudio"
license=('AGPL3')
depends=('gtk3' 'glib2' 'glibc' 'libsecret' 'webkit2gtk')
source=("BambuStudio.AppImage::https://github.com/BenJule/BambuStudio/releases/download/nightly-20260718-b11db8f/BambuStudio_ubuntu-24.04_amd64_V02.07.01.11814.AppImage")
sha256sums=('a6f92121d7a73adb39dfd85744ddc2a53edff45d039c7b46f8b2d6d947f3fedc')
package() {
  install -Dm755 "$srcdir/BambuStudio.AppImage" "$pkgdir/usr/bin/bambu-studio"
}
