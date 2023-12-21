# Maintainer: Mizuki Nguyen <temppart01 at gmail dot com>
_pkgname1=breeze-dark
_pkgname2=breeze-light
pkgname=breeze-lxqt-theme
pkgver=1.0
pkgrel=1
pkgdesc="An extensive LXQt theme inspired by KDE/Plasma and Breeze 5.24 and later."
arch=('any')
url="https://gitlab.com/M4he/lxqt-theme-breeze"
license=('LGPL2.1')

source=("$pkgname-$pkgver.zip::https://gitlab.com/M4he/lxqt-theme-breeze/-/jobs/3253264747/artifacts/download")
sha256sums=('53f21eea4bd217d62ce836da40e61fcea0094ad879cc941c6b6bd5a4969fbb7d')

package() {
	install -dm 755 "${pkgdir}"/usr/share/lxqt/themes/${_pkgname1} "${pkgdir}"/usr/share/lxqt/themes/${_pkgname2}
	cp -a --no-preserve='ownership' "${srcdir}/Dark Breeze/." "${pkgdir}"/usr/share/lxqt/themes/${_pkgname1}
	cp -a --no-preserve='ownership' "${srcdir}/Light Breeze/." "${pkgdir}"/usr/share/lxqt/themes/${_pkgname2}
}
