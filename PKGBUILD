# Maintainer: karnage42 karnage42.hatbox448@aleeas.com

#
# SPDX-FileCopyrightText: Arch Linux Contributors
#
# SPDX-License-Identifier: 0BSD
#

pkgname=checkupdates-notify
pkgdesc="Sends a notification if package updates are available"
pkgver=0.1
pkgrel=5
url="https://codeberg.org/karnage42/checkupdates-notify"
arch=("any")
license=("0BSD")
depends=("bash")
makedepends=()
install=
changelog=
source=('checkupdates-notify-v0.1-5.tar.xz')
sha256sums=('c562b32d93aabf21d70c6c1ea5d8f0e2e328e493f7e33112f985bffe14013b4c')

package() {
	depends=("pacman-contrib" "bash")

	./_install.sh "$pkgdir"
}
