# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=arch-upgrader

# Version
pkgver=1.0.1
pkgrel=1

# Generic
pkgdesc='Update Arch: pacman & flatpak, rank mirrors, send notification on update and failure'
arch=(any)
url='https://github.com/Dracape/arch-upgrader'
license=('MIT')

# Dependencies
depends=('fish' 'rate-mirrors')
makedepends=('fish')
conflicts=('arch-upgrader-git')

# Download
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dracape/${pkgname}/archive/refs/tags/${pkgver}.zip")
b2sums=('0df386a86e2a13cd037bf0b2d24411ace392e0b973e686d29bc547243077b23409e14b0928323a9b9ada07ac27829d439fb28838e032acaef4202d865c8fd1e1')


package() { "$pkgname-$pkgver"/install.fish --vendor --repository="$pkgname-$pkgver" --rootdir=${pkgdir}; }
