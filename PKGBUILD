# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='inputmodule-rs'
pkgname='inputmodule-udev'
pkgver='0.2.0'
pkgrel='1'
pkgdesc='Udev rules for Framework Laptop 16 input modules'
arch=('any')
url="https://github.com/FrameworkComputer/$_projectname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('068f26d83ee68e6e1b71954add4a9df740426596f3f6301cb5f24b898e17d41f70f1d3245afe6e2b601e09a72c8dfb868fae65f8a9e9c439cde40eddbd8a47a9')

_sourcedirectory="$_projectname-$pkgver"

package() {
	install -Dm644 "$srcdir/$_projectname-$pkgver/release/50-framework-inputmodule.rules" "$pkgdir/usr/lib/udev/rules.d/50-framework-inputmodule.rules"
}
