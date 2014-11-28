# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='pswd'
pkgdesc='A pseudo-random password generator'
pkgver='3.1.0'
pkgrel='1'
arch='any'
license=('custom')
depends=('python')
url='https://pswd.davidwaring.net/info.html'
source=('https://gitlab.davidwaring.net/dave/pswd/raw/1a547d7a6/python/pswd'
	license.txt)
sha512sums=('c3c73fa8ad5b9ff9e8e76be55113ef1a810548c31acd449aa8f5117aff08eec8e79a78c2d512a5d628f4cbd309d29df5c3a6f3c6897b633852aa562dd7d69bf7'
            '3396eb172dc6f467e153367492a14c89a1dcd06b0e445aacc71ab35f11984a9f2d666c40741b1b312c74fe54b81ca0e09a33643f63c97286d8ec13fd5f7df177')

package () {
	install -Dm755 "${srcdir}/pswd" \
		"${pkgdir}/usr/bin/pswd"
	install -Dm644 "${srcdir}/license.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
