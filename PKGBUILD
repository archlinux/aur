# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Maintainer: Eric Busch <me@etbus.ch>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=6.1.0.42176
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
source_x86_64=("https://updates.digital-watchdog.com/digitalwatchdog/42176/linux/dwspectrum-client-6.1.0.42176-linux_x64.deb")
sha512sums_x86_64=('97b82d6c7682b939cc527b581200f378364e6e50a1f889432e97dc1b234dcca9545d0f8787a067b15103b76227279eabaeeadd290dad4c7d5741ae4328389e01')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
