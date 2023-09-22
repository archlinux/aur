# Maintainer: RogueGirl <3a33oxx40 at mozmail dot com>

pkgname=womic
pkgver=1.0
pkgrel=1
pkgdesc="WO Mic can turn your phone to be a microphone for your computer."
arch=(x86_64)
url="https://wolicheng.com/womic/wo_mic_linux.html"
license=(unknown)
source=("micclient-x86_64.AppImage::https://wolicheng.com/womic/softwares/micclient-x86_64.AppImage")
options=('!strip')
optdepends=('bluez: Bluetooth support')
install=$pkgname.install

package() {
  install -Dm755 "${srcdir}/micclient-x86_64.AppImage" "${pkgdir}/opt/womic/micclient-x86_64.AppImage"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/womic/micclient-x86_64.AppImage" "${pkgdir}/usr/bin/womic"
}

md5sums=('875c5b18af2ddc2cfff2adcf52f39f92')
