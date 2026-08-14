# Maintainer: Vyrnexis

pkgname=nimlaunch-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="NimLaunch in SDL3 for native X11 and Wayland (keyboard-first launcher) - Pre-built binary"
arch=('x86_64')
url="https://github.com/Vyrnexis/NimLaunch"
license=('MIT')
depends=('sdl3' 'sdl3-ttf' 'sdl3-image' 'ttf-dejavu')
provides=("nimlaunch")
conflicts=("nimlaunch" "nimlaunch-git")
source=("nimlaunch-${pkgver}::https://github.com/Vyrnexis/NimLaunch/releases/download/v${pkgver}/nimlaunch"
        "LICENSE-${pkgver}::https://github.com/Vyrnexis/NimLaunch/raw/tag/v${pkgver}/LICENSE")
sha256sums=('70adf361f2c25a6ba79bffeec8dc53599d2692129bade7cc6b9ec508efa53379'
            'e034e1daf773989e34bacd11dc3a7014109b08d3c5b430089e7e4fa0c1ab12d2')

package() {
  install -Dm755 "nimlaunch-${pkgver}" "$pkgdir/usr/bin/nimlaunch"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
