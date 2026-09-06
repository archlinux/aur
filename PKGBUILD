# Maintainer: Yuzuki <lxf74663@gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron-patched
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=5
pkgdesc="Tencent QQMusic (Pre-built with hi-res & lossless patch)"
arch=('any')
url="https://github.com/Viemean/qqmusiclinux"
license=('CC0-1.0')
_electron=electron43
depends=(${_electron})
provides=("${_pkgname}" "qqmusic-electron")
conflicts=('qqmusic' 'qqmusic-electron' 'qqmusic-bin')

source=("${pkgname}-prebuilt-${pkgver}-${pkgrel}.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/qqmusic-electron-patched-1.1.8-5-any.pkg.tar.zst")
sha256sums=('e78db8c0a8a9e4c9aac50b2448ca950fcb00b9905de16a4620aa90790033a9d8')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
