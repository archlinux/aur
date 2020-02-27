# Maintainer: Alexej Kubarev <echo YWxleGVqLmt1YmFyZXZAZ21haWwuY29tCg== | base64 -d>
pkgname=bloomrpc-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="GUI Client for gRPC Services"
arch=('x86_64')
url="https://github.com/uw-labs/bloomrpc"
license=(LGPL3)
depends=('gtk3' 'gconf' 'libxss' 'libxtst')
source=("https://github.com/uw-labs/bloomrpc/releases/download/${pkgver}/bloomrpc_${pkgver}_amd64.deb")
conflicts=('bloomrpc')

sha512sums=('6d291e0564973f9463c19e6976fa0a5e40ea5e9a71e2604255fd1c9d928c82103adfa0ef9dd7c8b1eba92a971cb95f5357ae73d32d50b585ccff6fb586644d2e')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
}