# Maintainer: Vniverse77 <vniverse77@gmail.com>
pkgname=start-messenger-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Start Messenger Desktop - Arch Linux Version"
arch=('x86_64')
url="https://github.com/Vniverse77/start-messenger-arch"
license=('GPL-3.0-or-later')
depends=('libutil-linux' 'nss' 'nspr' 'alsa-lib' 'atk' 'cups' 'gtk3' 'libxss' 'libxtst')
options=('!strip')

source=("https://github.com/Vniverse77/start-messenger-arch/releases/download/${pkgver}/start_messenger_arch.tar.zst")
sha256sums=('e72c7205da9f43aa7ffaf8ea9cb861a22fcd72508aacfdbe452c548422680f09')

package() {
  # Tar.zst icindeki usr klasorunu sisteme yukler
  cp -r "${srcdir}/usr" "${pkgdir}/"
}
