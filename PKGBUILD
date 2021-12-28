# Maintainer: Ranadeep B < mail at rnbguy dot at >

_reponame=bech32
_organization=input-output-hk
_pkgname=${_reponame}-cli
pkgname=${_pkgname}-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Haskell implementation of the Bech32 address format (BIP 0173)"
arch=('x86_64')
url="https://github.com/${_organization}/${_reponame}"
provides=("${_pkgname}")
source=(
    "https://github.com/${_organization}/${_reponame}/releases/download/v${pkgver}/${_reponame}-v${pkgver}-linux64.tar.gz"
)
sha256sums=(
	'f6301a7451dda76535f5015302bbe3bf5b5ae6d4456520d5db4298f5158985b2'
)

package() {
	install -Dt "$pkgdir/usr/local/bin" "$_reponame"
}
