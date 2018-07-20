# Maintainer: Mark Egan-Fuller <markeganfuller@googlemail.com>
pkgname=bytemark-client
pkgver=3.4
pkgrel=1
pkgdesc="A command line client for managing Bytemark accounts, and cloud servers."
arch=('x86_64')
url="https://docs.bytemark.co.uk/subject/the-bytemark-command-line-client/"
license=('MIT' 'custom')
source=("https://repo.bytemark.co.uk/bytemark-client/linux/bytemark-${pkgver}.tar.gz")
sha512sums=('c9efbe6d856223d7b8a21686ad2fd4e7d90334e1e20f4a55f7d9567705884ec8c128a4b3c63eb541d9e93a13ab5ba7edf6403c2a08f3c8f1413f9de848b06c83')

package() {
	cd "${srcdir}"

	install -Dm755 "bytemark" "${pkgdir}/usr/bin/bytemark"
        install -Dm644 "doc/bytemark.1" "${pkgdir}/usr/share/man/man1/bytemark.1"
	install -Dm644 "doc/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm644 "doc/changelog.txt" "${pkgdir}/usr/share/doc/${pkgname}/changelog.txt"
}
