# Contributor: Braeden Mollot <3mollot at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=min-browser-bin
pkgver=1.28.0
pkgrel=1
pkgdesc="A fast, minimal browser that protects your privacy"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://minbrowser.org/"
_githuburl="https://github.com/minbrowser/min"
license=('Apache')
depends=('gtk3' 'libxdamage' 'glibc' 'libxkbcommon' 'hicolor-icon-theme' 'libsecret' 'libdrm' 'libxcomposite' 'alsa-lib' 'expat' 'nodejs' \
    'libxcb' 'nspr' 'libxext' 'glib2' 'libx11' 'libxfixes' 'mesa' 'nss' 'sh' 'libxrandr' 'cairo' 'libcups' 'dbus' 'at-spi2-core' 'gcc-libs' 'pango')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-amd64.deb")
sha256sums_aarch64=('cf2462783c13a3a83fe20db8aadb87baf788c3973cfcc02b1b562adf8fb902ec')
sha256sums_armv7h=('409fb65c277b82c5831578ba4c0095afaaab3922ff121ce53ed14dac1d77a2e3')
sha256sums_x86_64=('9d04d8d3415edc7336166574c43a84a3b0bc9db4ce8e35f9b7a5a65b584fd15a')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}