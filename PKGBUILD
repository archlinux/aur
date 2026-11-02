# Contributor: Aleksander Mietinen <aleksander at mietinen dot net>
# Maintainer: tee < teeaur at duck dot com >

pkgname=pspy-bin
_pkgbase=pspy
pkgver=1.2.1
pkgrel=1
pkgdesc="Monitor linux processes without root permissions."
arch=(x86_64)
url="https://github.com/DominicBreuker/pspy"
license=('GPL-3.0-or-later')
conflicts=("$_pkgbase")
provides=("$_pkgbase")

source=(
	"${_pkgbase}32::$url/releases/download/v$pkgver/${_pkgbase}32"
	"${_pkgbase}32s::$url/releases/download/v$pkgver/${_pkgbase}32s"
	"${_pkgbase}64::$url/releases/download/v$pkgver/${_pkgbase}64"
	"${_pkgbase}64s::$url/releases/download/v$pkgver/${_pkgbase}64s"
)
b2sums=('837006b78dd35ba778d4263c2baba2574f7357a58e4b6b169ee6ae04d7b919244894c14c836bdf279de3ffbe57efcf23043b16c644fcd6791fd92ad7bb054957'
        'f248f7799ca2606311a4ee82f686fd27f949111bb442c4cb40549fcdc83cc7a7809a9ab226f68256146a190eca707f689f177e5efe25d83a893274b09432e890'
        '34f5a1cee8d841b0591e6cb128173b019f62ac659994642856ba7ecf1338f0ef0cd667768271a1916986efc50f0bb8c05a78e0d118d951940477e723f343111e'
        '2996b81579fa24e0306f41d005bd489160b0ad18b25426f0d9b9840628c89b237a3c001e5e4c317234b9daa39532515d4bf4a5d6dd15c0ee9b364fd012547add')

package() {
	install -Dm755 "${_pkgbase}"*  -t "$pkgdir/usr/bin/"
}
