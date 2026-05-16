# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Maintainer: Eric Busch <me@etbus.ch>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=6.1.1.42624
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
source_x86_64=("https://updates.digital-watchdog.com/digitalwatchdog/42624/linux/dwspectrum-client-6.1.1.42624-linux_x64.deb")
sha512sums_x86_64=('9c1be447b0d2c98cc150b9d5d341224231264fd60ebac2500d845f04884ca5ec73933a0aa701d0d279b0ec49cac99316a5fbdd9325a3acfdc1df7dffb1b0d871')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
