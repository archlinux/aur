# Maintainer: queinu (ZzEdovec) <zzedovec@yahoo.com>
pkgname=onlinefix-linux-launcher-bin
pkgver=2.7.1
pkgrel=1
pkgdesc="OnlineFix Linux Launcher - play games with community multiplayer fixes on Linux!"
arch=('x86_64')
url="https://github.com/ZzEdovec/onlinefix-linux"
license=('AGPL3')
depends=('icoextract' 'unrar' 'jre8' 'winetricks' 'steam' 'ffmpeg' 'gtk3')
provides=('onlinefix-linux')

source=(
  "onlinefix-linux-launcher"
  "onlinefix-linux-launcher.png"
  "onlinefix-linux-launcher.desktop"
  "OFMELauncher-${pkgver}.jar::https://github.com/ZzEdovec/onlinefix-linux/releases/download/v2.7.1/OFMELauncher.jar"
)
sha256sums=(
  'bae845134d033ae38b16374efce8a21e65e8e4e07fedf3ff0090570872b89e28'
  '4262abfe7db3a930b75790772e774b8cdb11e9d224608751f608aed2689c1d40'
  '410c837f645d4a82f9ceabe9eb7b16f6f3c30929bb772c40ddeeaa25011c3b20'
  '9cae4f2cc06669ec1a1477102d1d25acf96f8393c9c1d61c3728424d2edca5d1'
)

package() {
  install -Dm755 "$srcdir/onlinefix-linux-launcher" "$pkgdir/usr/bin/onlinefix-linux-launcher"
  install -Dm644 "$srcdir/onlinefix-linux-launcher.png" "$pkgdir/usr/share/pixmaps/onlinefix-linux-launcher.png"
  install -Dm644 "$srcdir/onlinefix-linux-launcher.desktop" "$pkgdir/usr/share/applications/onlinefix-linux-launcher.desktop"
  install -Dm644 "$srcdir/OFMELauncher-${pkgver}.jar" "$pkgdir/usr/share/java/OFMELauncher.jar"
}

