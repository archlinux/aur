# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cometbft
_pkgname=cometbft
pkgname=${_pkgname}-bin
pkgver=0.38.0
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
sha256sums_x86_64=('18c6c9794264d6bdce917cbc453e0d1c716656549349bbe0bb10a3a4b4036787')
sha256sums_aarch64=('77cddc144f0025e0806d0e656f48c6a32e94ee6864f54b275c3c3d7146c8dc73')
sha256sums_armv6h=('59e59ad507499dbb48ebd5de58c156b51ac232b133d8b8ef935080551e7eb633')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
