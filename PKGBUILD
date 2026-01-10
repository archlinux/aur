# Maintainer: Dominik Korsa <29484605+dominik-korsa at users dot noreply dot github dot com>
pkgname=(otf-huta ttf-huta-variable)
pkgbase=huta-font
pkgver=1.000
pkgrel=1
epoch=
pkgdesc="A decorative typeface inspired by old street signs in Nowa Huta by Dominika Langosz"
arch=(any)
url="https://zzm.krakow.pl/aktualnosci/1240-nowohucki-wzor-liternictwa-juz-dostepny-do-pobrania.html"
license=('OFL-1.1')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("dominik-korsa-fonts::git+https://github.com/dominik-korsa/fonts.git#commit=5e1164dc330a129b50fd09eefcf176c8313cda89")
noextract=()
sha256sums=('75ddd5852f4bf6f8523c995c9c85d4b37e584fc7b254611759b32f2a9dd1f721')
validpgpkeys=()

package_otf-huta() {
	pkgdesc+=' (7 static cuts)'
	cd "dominik-korsa-fonts/huta"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" otf/*.otf
}

package_ttf-huta-variable() {
	pkgdesc+=' (variable ttf font)'
	cd "dominik-korsa-fonts/huta"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "ttf/Huta Variable.ttf" 
}
