# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=nucleus-bin
pkgver=0.2.7
pkgrel=1
pkgdesc='Nucleus CLI'
url='https://github.com/nucleuscloud/cli'
source_x86_64=(https://github.com/nucleuscloud/cli/releases/download/v$pkgver/nucleus_${pkgver}_linux_amd64.tar.gz)
source_aarch64=(https://github.com/nucleuscloud/cli/releases/download/v$pkgver/nucleus_${pkgver}_linux_arm64.tar.gz)
source_i686=(https://github.com/nucleuscloud/cli/releases/download/v$pkgver/nucleus_${pkgver}_linux_386.tar.gz)
arch=('x86_64' 'i686' 'aarch64')
license=('Apache-2.0')
conflicts=('nucleus')
provides=('nucleus')
sha256sums_x86_64=('fb2a1aa97865c044524d22d3ec8d45672508132486d8e7b4731bc804c1454c88')
sha256sums_i686=('93b59d57555e8ea204659c414e6bd49c6d8a93937629a463d115a137ff59ae71')
sha256sums_aarch64=('331ae053db38f82593c8359b5c610f89f4017ebbeab1716fdfe55d1bf79b0b35')

package() {
	cd "$srcdir/"
	install -Dm755 nucleus "$pkgdir/usr/bin/nucleus"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nucleus/LICENSE"
}
