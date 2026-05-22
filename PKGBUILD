# Maintainer: BenJule <benjamin.luetker@gmail.com>
pkgname=bambu-studio-bin
pkgver=02.07.00.55.fork.1
pkgrel=1
pkgdesc="BambuStudio slicer for Bambu Lab 3D printers"
arch=('x86_64')
url="https://github.com/BenJule/BambuStudio"
license=('AGPL3')
provides=('bambu-studio')
conflicts=('bambu-studio')
depends=('gtk3' 'glib2' 'glibc' 'libsecret' 'webkit2gtk')
source=("BambuStudio.AppImage::https://github.com/BenJule/BambuStudio/releases/download/v02.07.00.55-fork.1/Bambu_Studio_ubuntu-24.04_V02.07.00.55.AppImage")
sha256sums=('c68dd2c75bfa45227651045e83adffbe4a9b55c7975eba9e2511a79d65113887')
package() {
  install -Dm755 "$srcdir/BambuStudio.AppImage" "$pkgdir/usr/bin/bambu-studio"
}
