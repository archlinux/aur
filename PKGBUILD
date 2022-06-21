# Maintainer: isXander <xander@isxander.dev>

pkgname=pacman-chrome-dark-ui-hook
pkgver=1.0
pkgrel=1
pkgdesc='hook to modify chrome .desktop files to force dark ui'
arch=(any)
depends=(python)
makedepends=(git)
source=(
    chrome-dark-ui.hook
    "git+https://github.com/isXander/ChromeLinuxDark")
sha256sums=(
    '32b8bd288c2348f8d006ad11de0b5d639d567de2451903930ebb95e855a48789'
    'SKIP')

package() {
    install -Dm0644 -t "$pkgdir/usr/bin/" "$srcdir/ChromeLinuxDark/chrome_linux_dark.py"
    install -Dm0644 -t "$pkgdir/etc/pacman.d/hooks/" ${source[0]}
}
