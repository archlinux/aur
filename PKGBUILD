# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-en
_pkgname=wikt-en-en
pkgver=2025_10_05
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Wiktionary English-English Dictionary for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('4f2270e5ec8ffa0bdb933cfd2232fbb997fcc84eb32ef6ff0df0c3dffa8ced1b718ea521d5fdd710c7761c2baf197edb6f2bd80069cc26d332dbc940628b8c06')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
