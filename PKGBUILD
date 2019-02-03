# Maintainer: Aleksei Lissitsin <aleksei.lissitsin 'at' gmail 'dot' com>
_pkgname=awp
pkgname=${_pkgname}-blob
pkgver=5.3.0.18.04.75
pkgrel=1
pkgdesc="AWP: an obscure lib from IDEMIA needed for new ESTEID cards issued since 12/18 (blob from official deb, no source currently exists)"
arch=('x86_64')
url="www.idemia.com"
license=('unknown')
provides=('awp')
options=()
source=("https://installer.id.ee/media/ubuntu/pool/main/a/awp/${_pkgname}_${pkgver}_amd64.deb")
md5sums=('88c2944280bb91af60bfd80dd74c3310')

package() {
	msg2 "Extracting data from the deb file"
	bsdtar -xf data.tar.gz -C "$pkgdir/"
}
