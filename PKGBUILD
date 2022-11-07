# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=firefox-wayland-mode-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to enable Wayland mode on Firefox (enables navigation gestures)"
arch=(any)
license=(GPL3)
depends=('firefox')
source=(firefox-wayland-mode.hook firefox-wayland-mode)
sha256sums=('e9830786f9c1a5f0bd04d2c47a9fe26dfa2d8856cbff57740df0c2c94cd60abd'
            'bc1133b206f65a89f32402c1d02a80343e547d5049fbda0ae86fb28592a3db5a')

package() {
 install -Dm644 firefox-wayland-mode.hook -t "$pkgdir"/usr/share/libalpm/hooks
 install -Dm775 firefox-wayland-mode -t "$pkgdir"/usr/share/libalpm/scripts
}
