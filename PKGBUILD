# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simplemediaupscalerlite-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A Electron & CLI frontend to upscale images/videos using multiple different algorithms"
arch=('x86_64')
url="https://janishutz.com/projects/smuL"
_githuburl="https://github.com/simplePCBuilding/SimpleMediaUpscalerLite"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxfixes' 'gtk3' 'libxcb' 'expat' 'mesa' 'gcc-libs' 'glib2' 'libxext' 'glibc' 'xz' 'libxrandr' 'dbus' 'python' 'nspr' \
    'libxkbcommon' 'bzip2' 'cairo' 'alsa-lib' 'libx11' 'hicolor-icon-theme' 'openssl' 'zlib' 'libxcomposite' 'libcups' 'pango' \
    'nss' 'libdrm' 'libffi' 'libxdamage' 'at-spi2-core')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('f70793f387a7028e55890b594c255312eb8a1e8e0284e4e30698be4835209d45')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}