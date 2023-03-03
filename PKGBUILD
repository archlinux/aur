# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-en
_pkgname=wikt-en-en
pkgver=2023_02_19
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Wiktionary English-English Dictionary for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
depends=('stardict')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('ece8e610eb48a2d7a353602acff4d3f4e023584431d8efe7bd5a521057e02884bcde069788eeaf2655f85705df134eb37c2b7fab90b3c4af455520a9fe3c4303')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
