# Maintainer: Taufik Rahmadiansyah <taufiqmanganuyah14@gmail.com>

# SPDX-FileCopyrightText: 2026 Taufik Rahmadiansyah <taufiqmanganuyah14@gmail.com>
#
# SPDX-License-Identifier: MIT

pkgname=hunspell-su
pkgver=1.0.0
pkgrel=1
pkgdesc="Sundanese spell-checking dictionary for Hunspell"
arch=('any')
url="https://github.com/almamang/hunspell-su"
license=('MPL2' 'GPL2' 'LGPL2.1')
depends=('hunspell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/almamang/hunspell-su/archive/v${pkgver}.tar.gz")
sha256sums=('28bf1bb527fec65fdd68283d071dd62f01a8b8f083726d38875cdf5f0a3d0cad')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/core"
    install -Dm644 su_ID.dic "${pkgdir}/usr/share/hunspell/su_ID.dic"
    install -Dm644 su_ID.aff "${pkgdir}/usr/share/hunspell/su_ID.aff"
}
