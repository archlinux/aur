# Maintainer: Robert Buchberger <robert@buchberger.cc>
pkgname=airbrake-cli
pkgver=1.2.9
pkgrel=1
pkgdesc="The offical command line interface for interacting with Airbrake."
arch=("x86_64")
url="https://github.com/airbrake/airbrake-cli"
license=('unknown')
source=(
  "https://github.com/airbrake/airbrake-cli/releases/download/v${pkgver}/airbrake_${pkgver}_linux_x86_64.tar.gz"
)
sha256sums=('4e8466b2f382f9ac137622badd0d223bfbbc71da40ad1111de2da50393ce5dff')

package() {
	install -Dm755 airbrake "$pkgdir/usr/bin/airbrake"
}
