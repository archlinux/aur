# Maintainer: envolution
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ZaZam <zazaamm ät gmail döt com>
# Contributor: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna
pkgver=1
pkgrel=3
pkgdesc='Meta package for packages enabling forwarding Pulseaudio/Pipewire-Pulse streams to DLNA devices'
arch=('any')
url='https://gitlab.com/xdegaye/pa-dlna'
license=('MIT')
depends=('pa-dlna' 'python-libpulse')
source=(pulseaudio-dlna.service)
install=pulseaudio-dlna.install
sha256sums=('7dc9b30725ad9285605d21dbf9ddafc4ce85d222622c4b049bc8b407b44ed890')

package() {
  install -Dm644 pulseaudio-dlna.service "$pkgdir/usr/lib/systemd/user/pulseaudio-dlna.service"
}

# vim:set ts=2 sw=2 et:
