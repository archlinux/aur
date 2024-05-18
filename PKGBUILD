# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.21
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
sha256sums_aarch64=('78609bc155daa09ab044095168d0465a4fd1d6115a83103ad97cee5007175260')
sha256sums_armv7h=('054f73cdd22fc90009a0973a109283c298609873643e86436e4fc8060fe4fdf2')
sha256sums_x86_64=('ab79fdfac5ddb85a236f4483edfbcc261fca8735b3d9961e124c009e1434c8a4')

package_x86_64() {
	install -Dm755 "$srcdir/$_pkgname-linux-x64" "$pkgdir/usr/bin/$_pkgname"
}

package_armv7h() {
	install -Dm755 "$srcdir/$_pkgname-linux-armhf" "$pkgdir/usr/bin/$_pkgname"
}

package_aarch64() {
	install -Dm755 "$srcdir/$_pkgname-linux-arm64" "$pkgdir/usr/bin/$_pkgname"
}
