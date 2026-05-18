pkgname=zeldaladxhd-bin
pkgver=v1.8.3
pkgrel=1
scriptver=1.0.0
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Open source and unofficial Links Awakening DX HD PC port"
arch=('x86_64' 'aarch64')
url="https://github.com/BigheadSMZ/Zelda-LA-DX-HD-Updated"
license=('GPL')
makedepends=('unzip')
sha256sums=('4e019d16c8aad96145aae659e86df7f291e043c0e72d21280c4a0b59d26dd540')
sha256sums_x86_64=('3344f5817bdc74f5da5b0c7d734fcdc27126e0915a02eb3616870fb157ab13ab')
sha256sums_aarch64=('0dcd4d8dd48df655d615524e75dd7fde4c85507a86eb034eed35096da9855a9c')
source=("https://gitlab.com/linuxbombay/zeldaladxhd/-/archive/$scriptver/zeldaladxhd-$scriptver.tar.bz2")
source_x86_64=("https://github.com/BigheadSMZ/Zelda-LA-DX-HD-Updated/releases/download/v1.8.3/LADXHD.Patcher."$pkgver"_Linux-x64.zip")
source_aarch64=("https://github.com/BigheadSMZ/Zelda-LA-DX-HD-Updated/releases/download/v1.8.3/LADXHD.Patcher."$pkgver"_Linux-Arm64.zip")


package() {
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/share/games/Zeldaladxhd"
   install -dm755 "$pkgdir/usr/share/applications"
   install -dm755 "$pkgdir/usr/share/pixmaps"
   
   #rm -rf "${srcdir}"/*.zip
   install -Dm755 "$srcdir/LADXHD.Patcher.$pkgver.bin" "$pkgdir/usr/bin"
   install -Dm755 "$srcdir/zeldaladxhd" "$pkgdir/usr/bin"
   install -Dm755 "$srcdir/zeldaladxhd" "$pkgdir/usr/bin"
   cp -r "$srcdir/zeldaladxhd.svg" "$pkgdir/usr/share/pixmaps"
   install -Dm755 "$srcdir/zeldaladxhd.desktop" "$pkgdir/usr/share/applications"
}
