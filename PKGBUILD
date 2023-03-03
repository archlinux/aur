# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-all
_pkgname=wikt-en-ALL
pkgver=2023_02_19
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='English Wiktionary All Languages for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
depends=('stardict')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('c298d372ea3fb0cabc7653ea1d991820e847c620d7d5a1bbe9806244d3471ccc2c53aea6fe6e855ebaa2d4e56e3918ea80ecbcdbcb1d8733bef3bdadadcb756e')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
