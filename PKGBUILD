# Maintainer: archelinux maintainers (https://github.com/archelinux/arch-tools/issues)
# SPDX-License-Identifier: 0BSD
pkgname=arche-waybar-status
pkgver=2.0.1
pkgrel=1
pkgdesc='Conditional disk, VPN and GPU indicators for Waybar'
arch=('any')
url='https://github.com/archelinux/arch-tools'
license=('GPL-3.0-only')
depends=('python')
optdepends=('waybar: display the modules' 'iproute2: WireGuard discovery' 'networkmanager: VPN connection names' 'nvidia-utils: NVIDIA GPU readings')
source=("$pkgname-$pkgver::https://raw.githubusercontent.com/archelinux/arch-tools/v$pkgver/bin/$pkgname")
sha256sums=('cf3ad728ab1c1a5dd126ff44124dd6a12a576082844fe6bafca0a68943892f30')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
