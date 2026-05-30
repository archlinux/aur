# Contributor: tee < teeaur at duck dot com >
pkgname=wazero-bin
pkgver=1.12.0
pkgrel=1
pkgdesc='wazero: the zero dependency WebAssembly runtime for Go developers'
arch=(x86_64 aarch64)
url="https://github.com/wazero/wazero"
license=(Apache-2.0)
provides=('wazero')
conflicts=('wazero')
source_x86_64=("$url/releases/download/v$pkgver/wazero_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/wazero_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('88019896950340e8839b94af0510b248c3400d8d8f4a9b335dcaad93ac0484ff')
sha256sums_aarch64=('b5e5105a8bc4817a117e52402713f0628ebe13ecec5c4e63d541c430ca9bf259')

package() {
    install -Dm755 wazero -t "$pkgdir/usr/bin"
}
