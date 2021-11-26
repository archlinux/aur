# Maintainer: Eduardo Flores <edfloreshz@gmail.com>

pkgname=sensei
pkgver=0.2.8
pkgrel=1
pkgdesc="Sensei is a simple command line tool to open documentation for any crate."
arch=(x86_64)
url="https://sensei.edfloreshz.dev"
license=('GPL')
provides=(sns)
conflicts=(sensei sns)
source=("https://github.com/edfloreshz/sensei/releases/download/v$pkgver/sensei-amd64.tar.gz")
md5sums=('SKIP')

package() {
	sudo mv release/sns /usr/bin
	sudo install -Dm644 release/LICENSE /usr/share/licenses/${pkgname}/LICENSE
	sudo install -Dm644 release/README.md /usr/share/doc/${pkgname}/README.md
	rm -rf sensei-amd64.tar.gz sensei-0.2.8-1-x86_64.pkg.tar.zst src pkg
}
