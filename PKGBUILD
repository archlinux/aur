# Maintainer: EvilChuck <https://github.com/Evilchuck666>

pkgname=klondikecli-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Klondike solitaire in your terminal, written in plain C++17"
arch=('x86_64')
url="https://github.com/Evilchuck666/KlondikeCLI"
license=('GPL-3.0-only')
depends=('glibc' 'hicolor-icon-theme')
provides=('klondikecli')
conflicts=('klondikecli')
options=('!strip' '!debug')
source=("KlondikeCLI-linux-x64-$pkgver.tar.gz::$url/releases/download/v$pkgver/KlondikeCLI-linux-x64.tar.gz"
        'klondikecli.desktop'
        'klondikecli.svg')
sha256sums=('ac9b61e2456bf3d18a28c024628c7d3c17c4046fc7ca78f2dddf93b5a270c48f'
            '318b364e29a9c73d284c6a28fdfcbfee7a2dd90eb13c7acfd2adf0c9a65b563a'
            '3f3170eb9f4401de697359581138f2ede3602491648933a733f91e15552d5549')

package() {
  install -Dm755 KlondikeCLI-linux-x64/KlondikeCLI "$pkgdir/usr/bin/KlondikeCLI"
  install -Dm644 klondikecli.desktop "$pkgdir/usr/share/applications/klondikecli.desktop"
  install -Dm644 klondikecli.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/klondikecli.svg"
}
