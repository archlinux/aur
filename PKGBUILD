# Maintainer: karnage42 karnage42.hatbox448@aleeas.com

#
# SPDX-FileCopyrightText: Arch Linux Contributors
#
# SPDX-License-Identifier: 0BSD
#

pkgname=checkupdates-notify
pkgdesc='Sends a notification if package updates are available'
pkgver=0.1
pkgrel=6
url='https://codeberg.org/karnage42/checkupdates-notify'
arch=('any')
license=('0BSD')
depends=('bash')
makedepends=()
install="$pkgname.install"
changelog=
source=("$pkgname-v0.1-6.tar.xz")
sha256sums=('89e0664272f556c0c010bb7cc55f5090eb7a5d3765a842f0d96ad9584ed17a35')

package() {
	depends=('pacman-contrib' 'bash')

	./_install.sh "$pkgdir" $pkgname
}
