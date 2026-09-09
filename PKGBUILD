# Maintainer: Yuzuki <lxf74663@gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron-patched
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=7
pkgdesc="Tencent QQMusic (Pre-built with hi-res & lossless patch)"
arch=('any')
url="https://github.com/Viemean/qqmusiclinux"
license=('CC0-1.0')
_electron=electron43
depends=(${_electron})
provides=("${_pkgname}" "qqmusic-electron")
conflicts=('qqmusic' 'qqmusic-electron' 'qqmusic-bin')

source=("${pkgname}-prebuilt-${pkgver}-${pkgrel}.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}-${pkgrel}/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.zst")
sha256sums=('901bbdad6bae69cff8513084db6eefcd136af82a5052ff3e251911127f9a5036')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
