# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-en
_pkgname=wikt-en-en
pkgver=2018_10_07
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Wiktionary English-English Dictionary for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
depends=('stardict')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('0c7c5ebc04b754a8fc47210d2de2b8fea69854d5274a60520249e5f0f87d44b07a0e7e53f7023206c2e705e4fbf796796c65c82e554c413b1f76311a11963122')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
