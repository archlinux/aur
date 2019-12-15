# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=obs-ndi-bin
_pkgname=obs-ndi
pkgver=4.7.1
pkgrel=1
_pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('LGPL2.0')
url="https://github.com/Palakis/obs-ndi"
provides=('obs-ndi')
conflicts=('obs-ndi-git')
depends=('obs-studio' 'avahi')

source=(https://github.com/Palakis/"$_pkgname"/releases/download/"$pkgver"/obs-ndi_"$pkgver"-"$_pkgrel"_amd64.deb)
sha256sums=('de9e4382ec7d490752ddaaa16f7f1042607bfe29da884c54967e058d3691b0b7')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
