# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=arch-upgrader

# Version
pkgver=1.0.0
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
b2sums=('ed788d94fc0abb1ca9e614cd701a55fb090c071debc657fc3f43fb76a90c9f66d629f03552ad85214285b1325563bc7f94ccc4ff2fa055b99a61c15679407015')


package() { "$pkgname-$pkgver"/install.fish --vendor --repository="$pkgname-$pkgver" --rootdir=${pkgdir}; }
