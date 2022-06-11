# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-urban
_pkgname=stardict-Urban_Dictionary
pkgver=2.4.2
pkgrel=1
pkgdesc='Urban Dictionary (English) for StarDict'
arch=('any')
url='http://download.huzheng.org/'
license=('unknown')
depends=('stardict')
source=("http://download.huzheng.org/bigdict/${_pkgname}_P1-$pkgver.tar.bz2"
		"http://download.huzheng.org/bigdict/${_pkgname}_P2-$pkgver.tar.bz2")
b2sums=('465ce5c5566332d1afade8c0f0fff02c3f0b2960e530147c0c189f0012ee16cedbce6005a186a5f1471bfb4b582ec6916a8e66431f3280d611e149cb3b36d4ee'
		'eb1df865de76578b688713df4e4ee04d75c8079143937b2f120edb25d19cd026b5fca087453a08b978f3fa785dbbf27def1ff43d2b47692531f775081c91eb45')

package()
{
	cd "${_pkgname}_P1-$pkgver"
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
	cd ../"${_pkgname}_P2-$pkgver"
	install -Dm644 *.dz *.idx *.ifo -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
