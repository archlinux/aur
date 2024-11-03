# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-all
_pkgname=wikt-en-ALL
pkgver=2024_10_05
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='English Wiktionary All Languages for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('6d59591fa812595c9afed658ce9eef9e83f8ddb8ecdc2a3e0b41f4928f9568fd46f1ddff6f9deb05df470c26a9484fb443dd4096ff6fd42d27363ef68174cb7e')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
