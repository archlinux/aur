# Maintainer: queinu (ZzEdovec) <zzedovec@yahoo.com>
pkgname=onlinefix-linux-launcher-bin
pkgver=2.4
pkgrel=3
pkgdesc="OnlineFix Linux Launcher - play games with community multiplayer fixes on Linux!"
arch=('x86_64')
url="https://github.com/ZzEdovec/onlinefix-linux"
license=('AGPL3')
depends=('icoextract' 'unrar' 'aria2' 'jre8')
provides=('onlinefix-linux')

source=(
  "onlinefix-linux-launcher"
  "onlinefix-linux-launcher.png"
  "onlinefix-linux-launcher.desktop"
  "OFMELauncher.jar::https://github.com/ZzEdovec/onlinefix-linux/releases/download/v2.4/OFMELauncher.jar"
)
sha256sums=(
  'b8840cc2b57126f6a3be06a06ab9e580f129ec1388cac1e176a99d156efb162f'
  '4262abfe7db3a930b75790772e774b8cdb11e9d224608751f608aed2689c1d40'
  '3d56abba54acc8c0c5f6a7a65d6dfa2345b9af97dd7adefdfe847ece5abd2ae9'
  '2a733e548a74b8324b458bd6e240355e978afe456cc51bf3a0c2ff261132abd7'
)

package() {
  install -Dm755 "$srcdir/onlinefix-linux-launcher" "$pkgdir/usr/bin/onlinefix-linux-launcher"
  install -Dm644 "$srcdir/onlinefix-linux-launcher.png" "$pkgdir/usr/share/pixmaps/onlinefix-linux-launcher.png"
  install -Dm644 "$srcdir/onlinefix-linux-launcher.desktop" "$pkgdir/usr/share/applications/onlinefix-linux-launcher.desktop"
  install -Dm644 "$srcdir/OFMELauncher.jar" "$pkgdir/usr/share/java/OFMELauncher.jar"
}

