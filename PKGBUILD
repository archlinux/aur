# Maintainer: Yuzuki <lxf74663@gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron-patched
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=4
pkgdesc="Tencent QQMusic (Pre-built with hi-res & lossless patch)"
arch=('any')
url="https://github.com/Viemean/qqmusiclinux"
license=('CC0-1.0')
_electron=electron43
depends=(${_electron})
provides=("${_pkgname}" "qqmusic-electron")
conflicts=('qqmusic' 'qqmusic-electron' 'qqmusic-bin')

source=("${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.zst")
sha256sums=('e6d695e0e6b90ea3f7a2564485d4724a4c165e7467d198187733716312085770')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
