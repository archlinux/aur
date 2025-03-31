# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=android-xml-converter
pkgname="$_pkgbase-bin"
pkgver=1
pkgrel=1
pkgdesc="Android Binary XML (ABX) conversion tools"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rhythmcache/android-xml-converter"
license=('Apache-2.0')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("https://github.com/rhythmcache/android-xml-converter/releases/download/v$pkgver/build-all-arch-linux-android.zip")
sha256sums=('SKIP')

package() {
	install -Dm755 "abx2xml-$arch-linux-android" "$pkgdir/usr/bin/abx2xml"
	install -Dm755 "xml2abx-$arch-linux-android" "$pkgdir/usr/bin/xml2abx"
}
