# Maintainer: Eduardo Flores <edfloreshz@gmail.com>

pkgname=sensei
pkgver=0.2.8
pkgrel=1
pkgdesc="Sensei is a simple command line tool to open documentation for any crate."
arch=(x86_64)
url="https://sensei.edfloreshz.dev"
license=('GPL')
provides=('sns')
conflicts=('sensei' 'sns' 'sensei-git')
source=("https://github.com/edfloreshz/$pkgname/releases/download/v$pkgver/$pkgname-amd64.tar.gz")
sha256sums=('445753db9caf4ec423a27a3a9299e0b642c1816a4801b76bf73d15955ead6b18')

package() {
	install -Dm755 release/sns ${pkgdir}/usr/bin/sns
	install -Dm644 release/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm644 release/README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
