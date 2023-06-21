# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cometbft
_pkgname=cometbft
pkgname=${_pkgname}-bin
pkgver=0.37.2
pkgrel=1
pkgdesc="CometBFT: A distributed, Byzantine fault-tolerant, deterministic state machine replication engine, and fork of Tendermint Core."
arch=('x86_64' 'aarch64' 'armv6h')
url="https://${_pkgname}.com"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('6d6d3a29dc7b82508d9566efeb8586d4d762880455fbd4d6c519d858097ce697')
sha256sums_aarch64=('c48474fd8f7bb12c1876af445a6781163044a541cc2fdd56ced80523494f0e64')
sha256sums_armv6h=('fd80aab7ae87370673f12f80b2a1cb42bfe230f3a28cb5e94fd506bc452817dc')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
