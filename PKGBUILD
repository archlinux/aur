# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-all
_pkgname=wikt-en-ALL
pkgver=2021_05_02
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='English Wiktionary All Languages for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
depends=('stardict')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('dc78b8c0a7ea99a8339336210cfcf8cfd8a41d66703e7079af42209eaa6647f2dbf3cff7471847aefec269f82ea5cc27f184c9538af26b4a5c30f2a4103eaef5')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
