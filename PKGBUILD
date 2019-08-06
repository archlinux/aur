# Maintainer: <trash@ps3zone.org>
# Contributer: Rikles <style.boubou@gmail.com>
# Contributer: N30N <archlinux@alunamation.com>

pkgname="lightzone"
pkgver=4.1.8
pkgrel=2
pkgdesc="A professional photo browser and editor, like Aperture or Lightroom"
url="http://lightzoneproject.org/"
license=("custom:BSD-3-Clause")
arch=("x86_64")
depends=('jre7-openjdk'
         'javahelp2'
         'lcms2'
         'libjpeg-turbo'
         'libtiff'
         'libxml2')

source=("https://download.opensuse.org/repositories/home:/ktgw0316:/LightZone/Arch_Extra/x86_64/${pkgname}-${pkgver}-0-x86_64.pkg.tar.xz")
md5sums=('563a2a43982c88d1c9be7b56f20cb124')

build() {
  cd "${srcdir}"
  tar -I xz -xf lightzone-4.1.8-0-x86_64.pkg.tar.xz
}

package() {
  cd "${srcdir}"
  # Install
  cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
}
