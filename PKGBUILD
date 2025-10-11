# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-all
_pkgname=wikt-en-ALL
pkgver=2025_10_05
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='English Wiktionary All Languages for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('0e31fd36d8fc709af83aaf6144197fd5948c7db92a511bcda2c16e5be072657a9a298b0e8f102fba0bcce50413768f061c09702cfaccdd0ad43a9d4ecaea878d')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
