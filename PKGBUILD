# Maintainer: Josip Janzic <josip.janzic@gmail.com>

pkgname=toplip-bin
pkgver=1.2
pkgrel=1
pkgdesc='Very strong encryption and decryption utility with optional plausible deniability, image embedding, and multiple/variable passphrase complexity'
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('')
makedepends=('')
url="https://2ton.com.au/toplip/"

source=(https://2ton.com.au/standalone_binaries/toplip)
sha256sums=('c45999132f5abdcabd9dd55c98724a9f7f403c429d78de5a1622f2094b090bd9')


package() {
	install -Dm755 toplip "$pkgdir/usr/bin/toplip"
}
