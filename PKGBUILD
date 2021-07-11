# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: PQCraft <0456523@gmail.com>

pkgname=clibasic-bin
pkgver=0.15.8
pkgrel=3
pkgdesc="A BASIC interpreter for the terminal written in C"
arch=('x86_64')
url="https://github.com/PQCraft/clibasic"
license=('GPL3')
depends=('readline')
provides=('clibasic')
conflicts=('clibasic')
source=("clibasic-$pkgver.zip::$url/releases/download/$pkgver/clibasic-linux-x64.zip")
sha256sums=('fd2f867b4c525dc9593cfb1ef6634464224dc45889a5a8890dd7aea1f1619bfb')
validpgpkeys=('4AEE18F83AFDEB23')

package() {
	install -Dm 755 clibasic -t "$pkgdir/usr/bin/"
}
