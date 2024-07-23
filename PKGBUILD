# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
# Contributor: jackreeds

pkgname=gobuster-bin
pkgver=3.6.0
pkgrel=3
pkgdesc="A Directory/File, DNS and VHost busting tool"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/OJ/gobuster"
provides=('gobuster')
license=('Apache-2.0')
conflicts=('gobuster')
source_x86_64=(
	"gobuster-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/gobuster_Linux_x86_64.tar.gz"
)
source_i686=(
	"gobuster-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/gobuster_Linux_i386.tar.gz"
)
source_aarch64=(
	"gobuster-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/gobuster_Linux_arm64.tar.gz"
)
sha256sums_x86_64=(
	'871be404ce5f80c96b864586b3caa90f894598d1a8222ae316c19e5f70e04cfc'
)
sha256sums_i686=(
	'c46ff7f2194fae3aca1e4dca9a6ffd10e9ef3eb2d82751b4410534e9515f57ad'
)
sha256sums_aarch64=(
	'9d6c93ea27fa0477a8f7b57a4c495c8c91490d76805180c18b9d77bfc4f61b55'
)

package(){
	install -Dm755 "gobuster" "$pkgdir/usr/bin/gobuster"
}
