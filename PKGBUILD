# Maintainer: Yuzuki <lxf74663@gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron-patched
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=8
pkgdesc="Tencent QQMusic (Pre-built with hi-res & lossless patch)"
arch=('any')
url="https://github.com/Viemean/qqmusiclinux"
license=('CC0-1.0')
_electron=electron43
depends=(${_electron})
provides=("${_pkgname}" "qqmusic-electron")
conflicts=('qqmusic' 'qqmusic-electron' 'qqmusic-bin')

source=("${pkgname}-prebuilt-${pkgver}-${pkgrel}.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}-${pkgrel}/qqmusic-electron_${pkgver}-${pkgrel}_any.pkg.tar.zst")
sha256sums=('559adeabc55b2c370ab6a2731a8779c2410721dbcc474151bc9cf0e57460c30f')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
