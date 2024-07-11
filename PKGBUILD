# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cometbft
_pkgname=cometbft
pkgname=${_pkgname}-bin
pkgver=0.38.9
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
sha256sums_x86_64=('9bfe28cc37521ab24c8b0ae02cc5fd7c22272548a5c22da89d3fbfafd33cbde5')
sha256sums_aarch64=('bab9f567e5190a7de428095eebacf7d8e79089f441663f0ff3429f0246999ee5')
sha256sums_armv6h=('b909cf95d5a1de0ae94486deeb77480c03db8e535310a90a8680c86bda7419da')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
