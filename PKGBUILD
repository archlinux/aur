# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Maintainer: ArcticLampyrid <ArcticLampyrid@outlook.com>
# Contributor: Alex Henrie <alexhenrie24@gmail.com>
# Contributor: RubenKelevra <cyrond@gmail.com>

pkgname='ipfs-desktop-electron'
pkgver='0.50.1'
pkgrel=2
epoch=1
pkgdesc='Transitional package for ipfs-desktop'
arch=('any')
url='https://github.com/ipfs/ipfs-desktop'
license=('0BSD')
depends=('ipfs-desktop')
source=('LICENSE')
b2sums=('a74824829cda00a7b9e08111810f7f5daf33f5c7660506d8a429601bd5d613bf728fadfd72ec40a565711d58fdb01c65df5448d7972ed92de0c577319ed4a1de')

package() {
	install -Dm644 -- LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
