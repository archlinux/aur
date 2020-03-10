# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=xmm7360-usb-modeswitch
pkgname=xmm7360-usb-modeswitch-git
pkgver=1
pkgrel=1
pkgdesc='Tools for the Fibocom L850-GL / Intel XMM7360 LTE modem'
arch=('x86_64')
url="https://github.com/xmm7360/xmm7360-usb-modeswitch"
license=('')
depends=('acpi_call')
source=("git+$url")
sha256sums=(SKIP)

package() {
  cd $_pkgname
  install -Dm755 xmm2usb "$pkgdir"/usr/bin/$_pkgname
}

# vim:set ts=2 sw=2 et:
