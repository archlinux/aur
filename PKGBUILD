# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-all
_pkgname=wikt-en-ALL
pkgver=2023_07_27
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='English Wiktionary All Languages for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
depends=('stardict')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('7bd918d5699c4b2d4ea655c0030f4cbf7ba2040c7310e5fb9840e7e563f0222b316bad23f70b57bf258b0eaa7fab0c21a2bb43529410398db0a58de1ec71770c')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
