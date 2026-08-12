# Maintainer: Vyrnexis

pkgname=nimlaunch-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="NimLaunch in SDL3 for native X11 and Wayland (keyboard-first launcher) - Pre-built binary"
arch=('x86_64')
url="https://codeberg.org/Vyrnexis/NimLaunch"
license=('MIT')
depends=('sdl3' 'sdl3-ttf' 'sdl3-image' 'ttf-dejavu')
provides=("nimlaunch")
conflicts=("nimlaunch" "nimlaunch-git")
source=("nimlaunch-${pkgver}::https://codeberg.org/Vyrnexis/NimLaunch/releases/download/v${pkgver}/nimlaunch"
        "LICENSE-${pkgver}::https://codeberg.org/Vyrnexis/NimLaunch/raw/tag/v${pkgver}/LICENSE")
sha256sums=('488d2b49bf003d84243cccc65247f0a477193e85ac46aafedbd52ae650ced002'
            'e034e1daf773989e34bacd11dc3a7014109b08d3c5b430089e7e4fa0c1ab12d2')

package() {
  install -Dm755 "nimlaunch-${pkgver}" "$pkgdir/usr/bin/nimlaunch"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
