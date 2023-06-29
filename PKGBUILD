# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="svelte-electron-boilerplate-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="Create a desktop app with this user-friendly Svelte boilerplate for electron"
arch=('aarch64' 'i686' 'x86_64')
url="https://npmjs.com/package/@ptkdev/svelte-electron-boilerplate"
_githuburl="https://github.com/ptkdev-boilerplate/svelte-electron-boilerplate"
license=("MIT" "Creative Commons BY 4.0")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libxcomposite' 'libxfixes' 'libx11' 'gcc-libs' 'glibc' 'libdrm' 'nspr' 'libcups' 'at-spi2-core' 'glib2' 'hicolor-icon-theme' 'libxext' \
    'pango' 'libxkbcommon' 'mesa' 'nss' 'gtk3' 'cairo' 'libxdamage' 'gdk-pixbuf2' 'expat' 'alsa-lib' 'libxrandr' 'dbus' 'libxcb')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux_aarch64.pacman")
source_i686=("${pkgname%-bin}-${pkgver}-i686.pacman::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux_i686.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux_x64.pacman")
source=("LICENSE.md::https://raw.githubusercontent.com/ptkdev-boilerplate/svelte-electron-boilerplate/main/LICENSE.md")
sha256sums=('092c16bb68f5e405a27270b722dff33bddb5c66c3c08e18f10e9def1aa8200a9')
sha256sums_aarch64=('9b584a731f779e410212b67b7a607eaf029638bfd59cdc3ae68fee5d8a0c397f')
sha256sums_i686=('4fecc4979f1872c8f45fb32f172b0d96d6f5c4d9685170908fd9c552e59e0b67')
sha256sums_x86_64=('129beb84ffa0f6fe1a5325e36f605e0d6b76a874319752b686828bee4aa168a2')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}