# Maintainer: tee < teeaur at duck dot com >
pkgname=diskusage-bin
pkgver=1.2.8
pkgrel=1
pkgdesc='💥A tool for showing disk usage'
arch=(x86_64 aarch64)
url='https://github.com/chenquan/diskusage'
license=('Apache-2.0')
provides=('diskusage')
conflicts=('diskusage')
source_x86_64=("$url/releases/download/v$pkgver/diskusage-v$pkgver-linux-amd64.tar.gz"
"$url/releases/download/v$pkgver/diskusage-v$pkgver-linux-amd64.tar.gz.md5")
source_aarch64=("$url/releases/download/v$pkgver/diskusage-v$pkgver-linux-arm64.tar.gz"
"$url/releases/download/v$pkgver/diskusage-v$pkgver-linux-arm64.tar.gz.md5")
sha256sums_x86_64=('e8acb09981182e9a865c55aa664a36b7a139a335ba9d02592be08990213e2580'
                   '18749e83f57264c864d640dd6b31f0361ecae36f9bd467bc07acecb329da1f78')
sha256sums_aarch64=('9e69ebfa8aa35c5c5ef1b3f6a5cd8fedfa52ff943a5faeee872829d88a14f078'
                    'f1b4b06a6a2485509916b843a510d6bc245109f9174e55a0c1cd4c95c61d5f13')

package() {
    install -Dm755 diskusage -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
