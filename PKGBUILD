# Contributor: WinnerWind <contact@winnerwind.in>

pkgname=gruvvy-sound-theme-git
pkgdesc='Gruvvy Sound Theme, aiming to be a freedesktop alternative'
pkgver=1.0.0
pkgrel=1
arch=(any)
url='https://winnerwind.in'
license=(GPL-3.0-or-later)
depends=()
makedepends=()
source=(git+https://github.com/WinnerWind/gruvvy-sound-theme.git)
sha256sums=('SKIP')

conflicts=('gruvvy-sound-theme')
provides=('gruvvy-sound-theme')

package() {
	local destdir="${pkgdir}/usr/share/sounds/gruvvy"
	mkdir -p "${destdir}"
	cd "${srcdir}/gruvvy-sound-theme"
	cp -rt "${destdir}" index.theme stereo
}

