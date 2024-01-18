# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cometbft
_pkgname=cometbft
pkgname=${_pkgname}-bin
pkgver=0.38.3
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
sha256sums_x86_64=('d9246306bc3e5c31b4fae7f1e4f67d9aec920e348882d2c71bd0251e68225d81')
sha256sums_aarch64=('1c51a425ba9fafe6fb5cc7272801f5b8b5aadf7fd9b85ca828067cf27242638d')
sha256sums_armv6h=('3172ea6e0936dbecb8ee0876c5be795d8fe168282d45c075a881739fadbaa927')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
