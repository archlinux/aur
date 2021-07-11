# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: PQCraft <0456523@gmail.com>

pkgbase=clibasic-bin
pkgname=('clibasic-bin' 'clibasic-i686-bin')
pkgver=0.15.8
pkgrel=2
pkgdesc="A BASIC interpreter for the terminal written in C"
url="https://github.com/PQCraft/clibasic"
license=('GPL3')
source_x86_64=("clibasic-$pkgver-x86_64.zip::$url/releases/download/$pkgver/clibasic-linux-x64.zip")
source_i686=("clibasic-$pkgver-i686.zip::$url/releases/download/$pkgver/clibasic-linux-x86.zip")
sha256sums_x86_64=('fd2f867b4c525dc9593cfb1ef6634464224dc45889a5a8890dd7aea1f1619bfb')
sha256sums_i686=('36c8b7af2c38031e6e1bdc2a4814e04a5eb25b7a8b42dd68058957e9f340ae89')
validpgpkeys=('4AEE18F83AFDEB23')

package_clibasic-bin() {
	arch=('x86_64')
	depends=('readline')
	provides=('clibasic')
	conflicts=('clibasic')

	install -Dm 755 clibasic -t "$pkgdir/usr/bin/"
}

package_clibasic-i686-bin() {
	arch=('i686')
	depends=('lib32-readline')
	provides=('clibasic')
	conflicts=('clibasic')

	install -Dm 755 clibasic -t "$pkgdir/usr/bin/"
}
