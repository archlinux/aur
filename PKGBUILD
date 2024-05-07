# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.17
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
_arch=('arm64' 'armhf' 'x64')
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Enter-tainer/typstyle"
license=('Apache-2.0')
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-linux-x64")
source_armv7h=("$url/releases/download/v$pkgver/$_pkgname-linux-armhf")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-linux-arm64")
sha256sums_aarch64=('916b1d4783177498b1ea992dd97949567f4a3d86e08df4815452e09b42639fef')
sha256sums_armv7h=('e05492204727a2a485f23fd8a208679df87e18a7861fc97d5707a520fc3b3a7a')
sha256sums_x86_64=('f15bbc5160a62f154c46da94e6add9bd84babba2c723882e753aa73ace248209')

package_x86_64() {
	install -Dm755 "$srcdir/$_pkgname-linux-x64" "$pkgdir/usr/bin/$_pkgname"
}

package_armv7h() {
	install -Dm755 "$srcdir/$_pkgname-linux-armhf" "$pkgdir/usr/bin/$_pkgname"
}

package_aarch64() {
	install -Dm755 "$srcdir/$_pkgname-linux-arm64" "$pkgdir/usr/bin/$_pkgname"
}
