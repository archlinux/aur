# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Maintainer: Eric Busch <me@etbus.ch>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=6.0.6.41837_1
pkgrel=2
pkgdesc="DW Spectrum Client"
arch=('x86_64')
url="https://digital-watchdog.com/"
license=('Proprietary')
depends=('alsa-lib' 'ffmpeg4.4' 'fontconfig' 'freetype2' 'glu' 'gst-plugins-base-libs' 'gstreamer' 'libdrm' 'libgl' 'libglvnd' 'libgudev' 'libpulse' 'libva' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxkbfile' 'libxml2-legacy' 'libxrandr' 'libxrender' 'libxslt' 'libxss' 'libxtst' 'nspr' 'nss' 'openssl-1.1' 'qt6-base' 'qt6-declarative' 'qt6-positioning' 'qt6-quicktimeline' 'qt6-webengine' 'qt6-websockets' 'qt6-webview' 'xcb-util' 'xcb-util-cursor' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib-ng')
optdepends=('binutils')
replaces=('digitalwatchdog-client-1.2<4.2.0')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://updates.digital-watchdog.com/digitalwatchdog/41837/linux/dwspectrum-client-6.0.6.41837-linux_x64.deb")
sha512sums_x86_64=('fb55eb2a5873f55932acf4417ae1d6d7efbff58cd24083659bee785aeb5695abbbd412e9cf9a90d6186a05314143135aef62ad855220df6575b3439b6cdd953c')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
