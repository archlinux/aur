# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-wikt-en-en
_pkgname=wikt-en-en
pkgver=2023_07_27
# source https://wiki.archlinux.org/title/PKGBUILD#pkgver
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Wiktionary English-English Dictionary for StarDict'
arch=('any')
url='https://www.dictinfo.com/'
license=('cc-by-sa-3.0')
depends=('stardict')
source=("https://www.dictinfo.com/stardict/$_pkgname-$_pkgver.7z")
b2sums=('c5c7d51aae0e0e7308b7227e822b5bf37133d2fcb9a2a928b85f17f874fc403a59eff9641fdd03ff7326566408647113842ab5230bee392ebd949d7896ffe94c')

package()
{
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
