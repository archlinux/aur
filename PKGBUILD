# Maintainer: Incognitux <incognitux at proton mail dot com>

pkgname=nvibrant-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Nvidia Digital Vibrance on Wayland (binary release)"
arch=(x86_64)
url="https://github.com/Tremeschin/nVibrant"
license=('GPL-3.0')
provides=("nvibrant")
conflicts=("nvibrant")
_filename="nvibrant-linux-amd64-v$pkgver.bin"
source=($_filename::"https://github.com/Tremeschin/nVibrant/releases/download/v$pkgver/$_filename")
sha256sums=('SKIP')

package(){
  install -Dm755 $_filename "$pkgdir/usr/bin/nvibrant"
}
