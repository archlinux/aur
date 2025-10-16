# Maintainer: Mac Mansfield-Parisi <maclean dot mansfield dot parisi at gmail dot com>
pkgname=pelicanplatform-bin
pkgver=7.20.2
pkgrel=1
pkgdesc="The command line client for the Pelican Platform data federation system"
arch=('x86_64')
url="https://github.com/PelicanPlatform/pelican"
license=('Apache-2.0')

source=("https://github.com/PelicanPlatform/pelican/releases/download/v${pkgver}/pelican_Linux_x86_64.tar.gz")
sha256sums=("ba826628100df4be16c39aa7aa16be0add7f03374e8c032bbf40dceafba8f62d")

# binary is named the same. sigh.
conflicts=("pelican")

package() {
	install -Dm755 "pelican-$pkgver/pelican" "$pkgdir/usr/bin/pelican"

	# see README at https://github.com/PelicanPlatform/pelican/blob/main/README.md
	# for usage guide
}
