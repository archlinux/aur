# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="final2x-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="2^x Image Super-Resolution"
arch=('x86_64')
license=('BSD3-Clause')
conflicts=("${pkgname%-bin}")
url="https://github.com/Tohrusky/Final2x"
depends=('glib2' 'glibc' 'pango' 'nspr' 'at-spi2-core' 'libxcomposite' 'alsa-lib' 'expat' 'libx11' 'libcups' 'hicolor-icon-theme' \
    'libxkbcommon' 'cairo' 'libxrandr' 'mesa' 'nodejs' 'nss' 'gcc-libs' 'libxcb' 'gtk3' 'dbus' 'libxext' 'libdrm' 'libxfixes' 'libxdamage')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/2023-07-01/Final2x-linux-pip-x64-deb.deb"
    "LICENSE::https://raw.githubusercontent.com/Tohrusky/Final2x/main/LICENSE")
sha256sums=('df8c47aaebd57e2fa484b37b315c9343866afb8b07b22dc42436f58050659269'
            '7b4e93ff707625a2632519b35d5891035356f551f18dd18539ad94c72f59286a')
package(){
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}