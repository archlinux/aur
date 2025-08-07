# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>
pkgname=mkinitcpio-cmdline-pacman-hook
pkgver=1.0.0
pkgrel=3
pkgdesc="Pacman hook to trigger mkinicpio when /etc/cmdline, /etc/cmdline.d/* or /etc/kernel/cmdline is modified by packages. Useful when booting an Unified Kernel Image directly."
arch=('any')
url="https://github.com/trijpstra-fourlights/mkinitcpio-cmdline-pacman-hook"
license=('MIT')
depends=('pacman' 'mkinitcpio')
source=("91-mkinitcpio-cmdline.hook")
sha256sums=('fb4c186025094d85fc54c81ce6c1aff2ff3645e6c1e888c0303d57362ea33b23')

package() {
    install -Dm644 "$srcdir/91-mkinitcpio-cmdline.hook" "$pkgdir/usr/share/libalpm/hooks/91-mkinitcpio-cmdline.hook"
}

