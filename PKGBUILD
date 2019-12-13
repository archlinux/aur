# Maintainer: TingPing <tingping@tingping.se>

pkgname=fpaste
pkgver=0.4.0.1
pkgrel=2
pkgdesc='A cli frontend for the fpaste.org pastebin'
arch=('any')
url='https://pagure.io/fpaste'
license=('GPL3')
depends=('python')
source=("https://pagure.io/fpaste/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 'fpaste' "$pkgdir/usr/bin/fpaste"
	install -D -m644 'docs/man/en/fpaste.1' "$pkgdir/usr/share/man/man1/fpaste.1"
}

sha256sums=('a3de49a1a872d83ebc35e0f78e22693694da86fb4d1aad6811f3260693b5f7e6')
