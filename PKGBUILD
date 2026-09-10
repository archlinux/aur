# Maintainer: Yuzuki <lxf74663@gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron-patched
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=9
pkgdesc="Tencent QQMusic (Pre-built with hi-res & lossless patch)"
arch=('any')
url="https://github.com/Viemean/qqmusiclinux"
license=('CC0-1.0')
_electron=electron43
depends=(${_electron})
provides=("${_pkgname}" "qqmusic-electron")
conflicts=('qqmusic' 'qqmusic-electron' 'qqmusic-bin')

source=("${pkgname}-prebuilt-${pkgver}-${pkgrel}.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}-${pkgrel}/qqmusic-electron_${pkgver}-${pkgrel}_any.pkg.tar.zst")
sha256sums=('8f154b039b3e897a30737a80386293d0e20eef3391ccd3f9f0efb6050eb653a6')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
