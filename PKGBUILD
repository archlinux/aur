# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='pswd'
pkgdesc='A pseudo-random password generator'
pkgver='3.1.0'
pkgrel='2'
arch=('any')
license=('custom')
depends=('python')
url='https://github.com/dwaring87/pswd'
source=("${url}/archive/v${pkgver}.tar.gz"
	license.txt)
sha512sums=('d1b84bb3760d79c3e62558e6bed87c65c86d78ac4d0b3665b93f3986a7592ef5ce1889aecd7783993518bfad61b3a79c200d7798ddf7bf6810521b49eb0c3b0c'
            '3396eb172dc6f467e153367492a14c89a1dcd06b0e445aacc71ab35f11984a9f2d666c40741b1b312c74fe54b81ca0e09a33643f63c97286d8ec13fd5f7df177')

package () {
	install -Dm644 "${srcdir}/license.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
	cd "${pkgname}-${pkgver}/python"
	install -Dm755 pswd "${pkgdir}/usr/bin/pswd"
}
