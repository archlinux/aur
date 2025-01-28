pkgname=srb2kart-bin
pkgver=1.6
pkgrel=2
pkgdesc="SRB2Kart is a kart racing mod based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2, based on a modified version of Doom Legacy."
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2kart-data" 'libopenmpt' 'miniupnpc' 'libpng' 'nasm' 'libgme')
url='https://gitlab.com/linuxbombay/srb2-kart'
_pkgrel_i686=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums=('da2d229d493d7731c063280bae6e99184a7be3d93338f733288e5037d6305b3c'
            '3cbdbbb041589d58342a1d7bd3d94664a8f22198cec4a7daa755510dfa6e511d')
sha256sums_i686=('8a4f6a42f463bcace69bff3c02c828a0ef4021ab2170fa7439cc0b5e5eaa7dcc')
sha256sums_x86_64=('06b5f6dae674eba3d9acb450d649d35d8b9b0745051cd960b7a7147fb1414f1b')
sha256sums_aarch64=('72f9c921c0553f209cbaf52037f9e83caaf773c92ff5f99597800863788084d5')

source=("srb2kart.desktop" "srb2kart.png")
source_i686=("$url/binaries/$pkgver/-/raw/main/srb2kart-linux-i686.tar.xz")
source_x86_64=("$url/binaries/$pkgver/-/raw/main/srb2kart-linux-x64.tar.xz")
source_aarch64=("$url/binaries/$pkgver/-/raw/main/srb2kart-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"
    
    install -Dm655 "$srcdir/srb2kart.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/srb2kart.desktop" "$pkgdir/usr/share/applications"
    install -m775 "$srcdir/srb2kart" "$pkgdir/usr/bin"
}
