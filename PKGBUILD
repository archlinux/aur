# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.24
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Enter-tainer/typstyle"
license=('Apache-2.0')
depends=("gcc-libs" "glibc")
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source_aarch64=("$_pkgname-$CARCH::$url/releases/download/v$pkgver/$_pkgname-linux-arm64")
source_armv7h=("$_pkgname-$CARCH::$url/releases/download/v$pkgver/$_pkgname-linux-armhf")
source_x86_64=("$_pkgname-$CARCH::$url/releases/download/v$pkgver/$_pkgname-linux-x64")
sha256sums_aarch64=('7954dccf738131e0fd42e2c6e2b4f174b175b9beff6beaa0d46fee738eb48f60')
sha256sums_armv7h=('659b6c163eee833ec5e765eb92db106f1bf8258a12a466bf7fce0eedcea6811d')
sha256sums_x86_64=('b1a2a1a29f5bd57f8822cddd7c54df25b9c1da3bd9793f29851a50fd0c680685')

package() {
	install -Dm755 "$_pkgname-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}
