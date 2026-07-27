# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Maintainer: Eric Busch <me@etbus.ch>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=6.1.2.43047
pkgrel=1
pkgdesc="DW Spectrum Client"
arch=('x86_64')
url="https://digital-watchdog.com/"
license=('Proprietary')
depends=('alsa-lib' 'ffmpeg4.4' 'fontconfig' 'freetype2' 'glu' 'gst-plugins-base-libs' 'gstreamer' 'libdrm' 'libgl' 'libglvnd' 'libgudev' 'libpulse' 'libva' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxkbfile' 'libxml2-legacy' 'libxrandr' 'libxrender' 'libxslt' 'libxss' 'libxtst' 'nspr' 'nss' 'openssl' 'qt6-base' 'qt6-declarative' 'qt6-positioning' 'qt6-quicktimeline' 'qt6-webengine' 'qt6-websockets' 'qt6-webview' 'xcb-util' 'xcb-util-cursor' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib-ng')
optdepends=('binutils')
replaces=('digitalwatchdog-client-1.2<4.2.0')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://updates.digital-watchdog.com/digitalwatchdog/43047/linux/dwspectrum-client-6.1.2.43047-linux_x64.deb")
sha512sums_x86_64=('63f06aad09e584a25a6bab914bd493968ad38d81a01087dc418def0a1b9bfe54d5540cf893e3024f08d66d7dabbc6609f94192687bb485af074eb84bdabdff3e')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
