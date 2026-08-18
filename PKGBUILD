# Maintainer: Vyrnexis

pkgname=nimlaunch-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="NimLaunch in SDL3 for native X11 and Wayland (keyboard-first launcher) - Pre-built binary"
arch=('x86_64')
url="https://github.com/Vyrnexis/NimLaunch"
license=('MIT')
depends=('sdl3' 'sdl3_ttf' 'sdl3_image' 'ttf-dejavu')
provides=("nimlaunch")
conflicts=("nimlaunch" "nimlaunch-git")
source=("nimlaunch-${pkgver}::https://github.com/Vyrnexis/NimLaunch/releases/download/v${pkgver}/nimlaunch"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Vyrnexis/NimLaunch/v${pkgver}/LICENSE")
sha256sums=('6e56d0395c8a886528c88212e29e38bc6b408a11abc48c49b744c5e15b4863d9'
            'e034e1daf773989e34bacd11dc3a7014109b08d3c5b430089e7e4fa0c1ab12d2')

package() {
  install -Dm755 "nimlaunch-${pkgver}" "$pkgdir/usr/bin/nimlaunch"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
