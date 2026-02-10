# Maintainer: Keithsel <keithsel@disroot.org>
# Original author: Gabriel Volpe (gvolpe)
pkgname=niri-scratchpad
pkgver=0.0.2
pkgrel=1
pkgdesc='Scratchpad support for Niri: a scrollable-tiling Wayland compositor'
arch=('any')
url='https://github.com/gvolpe/niri-scratchpad'
license=('Apache-2.0')
depends=('python')
source=("nscratch::https://raw.githubusercontent.com/Keithsel/niri-scratchpad/shlex-spawn-command/src/ns.py"
         "LICENSE::https://raw.githubusercontent.com/Keithsel/niri-scratchpad/shlex-spawn-command/LICENSE")
sha256sums=('261712e7ffe6973af2e0146c4da90d780342c0a9e9d930378ff0d43d498eb960'
            'a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae')

package() {
    install -Dm755 nscratch "$pkgdir/usr/bin/nscratch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}