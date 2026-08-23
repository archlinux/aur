# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Maintainer: Eric Busch <me@etbus.ch>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=6.1.3.43301
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
source_x86_64=("https://updates.digital-watchdog.com/digitalwatchdog/43301/linux/dwspectrum-client-6.1.3.43301-linux_x64.deb")
sha512sums_x86_64=('bf5ea70a689e9f505cb0eb960302f5472a63058c0dcb906837270a4e8ae4c2fc50b29429ef0198b84163d6b7e15a9db7a0459e375f1baff7632c03a09ae08aa3')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
