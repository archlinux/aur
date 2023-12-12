# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=0.1
pkgrel=6
pkgdesc="Collection of mkinitcpio install hooks to integrate Tailscale into initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
depends=("mkinitcpio")
source=("sd-tailscale" "setup-initcpio-tailscale")
sha256sums=(SKIP SKIP)

package() {
  install -m 755 -D ${srcdir}/setup-initcpio-tailscale ${pkgdir}/usr/bin/setup-initcpio-tailscale
  install -m 644 -D ${srcdir}/sd-tailscale ${pkgdir}/usr/lib/initcpio/install/sd-tailscale
}
