# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.20
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
sha256sums_aarch64=('1031b0482d6c82c88c980f39bab062cf3aa2f1ce2e043d20866c5fd58fca3bf5')
sha256sums_armv7h=('b5fa71ba920eac9504c62a53436b47cdf6c23e004ead3e4d9d8c053f9490cb1c')
sha256sums_x86_64=('965427c9e4005e2eace563d497e5af91da4954ca246b9ae076d09c8a1013c2f5')

package_x86_64() {
	install -Dm755 "$srcdir/$_pkgname-linux-x64" "$pkgdir/usr/bin/$_pkgname"
}

package_armv7h() {
	install -Dm755 "$srcdir/$_pkgname-linux-armhf" "$pkgdir/usr/bin/$_pkgname"
}

package_aarch64() {
	install -Dm755 "$srcdir/$_pkgname-linux-arm64" "$pkgdir/usr/bin/$_pkgname"
}
