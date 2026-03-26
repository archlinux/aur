pkgname=linux-tool-bin
pkgver=0.2.2
pkgrel=3
pkgdesc="AUR and Pacman package manager helper with Slint UI"
arch=('x86_64')
url="https://github.com/Enzo415611/linux-tool"
license=('GPL-3.0-only')
depends=('glibc')

source=("https://github.com/Enzo415611/linux-tool/releases/download/v$pkgver/linux-tool"
        "https://raw.githubusercontent.com/Enzo415611/linux-tool/main/ui/assets/app-icon.png"
        "linux-tool.desktop")

sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 linux-tool "$pkgdir/usr/bin/linux-tool"

  install -Dm644 app-icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/linux-tool.png"

  install -Dm644 linux-tool.desktop \
    "$pkgdir/usr/share/applications/linux-tool.desktop"
}
sha256sums=('d20e3bc92785e82589811284b28b9c63f37d2509bda8003fee7257ad4237ce3b'
            '332a561ec2a70ac62de122413ea169d8de2fd001ddac5f63420146409fa97374'
            'f783a0898d89ce584e54916d7b6689127b38b6e492b92ff346a5f02c4c1e7211')
sha256sums=('d20e3bc92785e82589811284b28b9c63f37d2509bda8003fee7257ad4237ce3b'
            '332a561ec2a70ac62de122413ea169d8de2fd001ddac5f63420146409fa97374'
            '49c2be15a00cd72159b76113800adf11d47f4ab625ad5d1981498c76f8b3a0a3')
