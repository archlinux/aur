pkgname=x86_64-apple-darwin-sdk
pkgdesc="Mac OS X/Darwin SDK (requires prepackaged SDK with osxcross)"
pkgver=10.12
pkgrel=1
arch=(any)
url="https://github.com/tpoechtrager/osxcross"
license=("APSL")
options=(!strip staticlibs)

package() {
	cd MacOSX$pkgver.sdk
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/x86_64-apple-darwin/"{} \;
}
