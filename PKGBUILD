# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=android-xml-converter
pkgname="$_pkgbase-bin"
pkgver=11
pkgrel=1
pkgdesc="Android Binary XML (ABX) conversion tools"
arch=('x86_64' 'x86' 'aarch64' 'armv7')
url="https://github.com/rhythmcache/android-xml-converter"
license=('Apache-2.0')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("https://github.com/rhythmcache/android-xml-converter/releases/download/build-$pkgver/abx-tools-linux-$arch.tar.gz")
sha256sums=('a6f627d4dae34e74524f24664031b509bc99743639885c39d06c7ac4ab37a54e')

package() {
	install -Dm755 "abx2xml" "$pkgdir/usr/bin/abx2xml"
	install -Dm755 "xml2abx" "$pkgdir/usr/bin/xml2abx"
}
