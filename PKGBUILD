# Contributor: tee < teeaur at duck dot com >
pkgname=wazero-bin
pkgver=1.11.0
pkgrel=1
pkgdesc='wazero: the zero dependency WebAssembly runtime for Go developers'
arch=(x86_64 aarch64)
url="https://github.com/wazero/wazero"
license=(Apache-2.0)
provides=('wazero')
conflicts=('wazero')
source_x86_64=("$url/releases/download/v$pkgver/wazero_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/wazero_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cb61ba01f493f889180e7a79b1683313dc5fdabf7e63a62fee7154085ffac9f5')
sha256sums_aarch64=('59951f6060aed1e35c7260b96d88b0e77db3fb44744ecab045d572a1617c1b1a')

package() {
    install -Dm755 wazero -t "$pkgdir/usr/bin"
}
