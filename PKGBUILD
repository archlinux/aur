# Maintainer: Mac Mansfield-Parisi <maclean dot mansfield dot parisi at gmail dot com>
pkgname=pelicanplatform-bin
pkgver=7.21.1
pkgrel=1
pkgdesc="The command line client for the Pelican Platform data federation system"
arch=('x86_64')
url="https://github.com/PelicanPlatform/pelican"
license=('Apache-2.0')

source=("https://github.com/PelicanPlatform/pelican/releases/download/v${pkgver}/pelican_Linux_x86_64.tar.gz")
sha256sums=("cd46f58f46e16c2b0c5db3cc016c86ef6370c863179cf30ed459ed53b49399c2")

# binary is named the same. sigh.
conflicts=("pelican")

package() {
	install -Dm755 "pelican-$pkgver/pelican" "$pkgdir/usr/bin/pelican"

	# see README at https://github.com/PelicanPlatform/pelican/blob/main/README.md
	# for usage guide
}
