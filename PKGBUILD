# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=phoneinfoga
pkgver=v2.10.7
pkgrel=1
pkgdesc="Information gathering & OSINT framework for phone numbers"
arch=('x86_64')
url="https://sundowndev.github.io/phoneinfoga/"
license=('GPL3')
provides=()
source=("https://github.com/sundowndev/phoneinfoga/releases/download/$pkgver/phoneinfoga_Linux_x86_64.tar.gz")
sha256sums=("00468dedbeddd6eb8b917101fd103019b5da1628104b71ef73073fb43dfa3d48")

package() {
	install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
