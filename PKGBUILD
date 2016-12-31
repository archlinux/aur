# # Maintainer: joel <aullidolunar at gmai1 d0t c0m>
# Contributor: Daniel J. Campos <dcampos2015 at my dot fit dot edu>
# Contributor: Pall Andrei <andreipall at yahoo dot com>

_themeid=1460767044
_themename=darkcold-xfce-theme
_themeurl=148515
_themeurlfull=https://dl.opendesktop.org/api/files/download/id/${_themeid}/${_themeurl}-DarkCold-OriginalSeed-xfwm.tar.gz

pkgname=${_themename}
pkgver=20160416
pkgrel=0
pkgdesc="A simple and clean dark theme for Xfce/xfwm4"
arch=('any')
url="https://www.xfce-look.org/content/show.php/DarkCold?content=${_themeurl}"
license=('GPL')
depends=('xfwm4')
source=(theme.tar.gz::${_themeurlfull})
sha256sums=('996a9c823521101f47f84ea3cb48870c8baa0f0a1d63e20a237febb95604c42e')

package() {
	cd "DarkCold-OriginalSeed-xfwm"
	rm "DarkCold.png"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

