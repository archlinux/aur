# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.18.0
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('bc4ac50894f4d42283de3deb436f84e3e7d6a6e07801cef7dcf110e19b9bd0c7')
sha256sums_aarch64=('3f8f123ed1fe4569e0e0feedb43e455fd31e1bb8750b82004a4b12d030c127a4')

build() {
	return 0
}

package() {
	conflicts=("solv")

	install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
