# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cometbft
_pkgname=cometbft
pkgname=${_pkgname}-bin
pkgver=0.38.6
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
sha256sums_x86_64=('89ae8dad6f87ccd73ea5f81ca9dac61b0286999c4ba35125fd1ca8bf5d5a05d3')
sha256sums_aarch64=('bd8006f3a67936c986f7f71f312852d4731c6e6674fb3da5de95b3f66830ecde')
sha256sums_armv6h=('7b4dfc01fe24c150582390a221b5c5e87794420c1fa8786f464777b6a147d111')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
