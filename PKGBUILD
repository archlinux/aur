# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-en
_pkgname=wikt-en-en
pkgver=2024_10_05
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Wiktionary English-English Dictionary for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('f9f89920cb208521279b8d53e37bc913d44677cfca35d4dd850ea35edfd08e8685f922335508bf3a5720b5540ddc912901fab3dc70221b95b692f23b922e416a')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
