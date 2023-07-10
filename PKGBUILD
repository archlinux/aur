# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=5.0.0.36871
pkgrel=1
pkgdesc="DW Spectrum Client"
arch=('x86_64')
url="https://digital-watchdog.com/"
license=('Proprietary')
groups=('')
depends=('alsa-lib' 'dbus' 'fontconfig' 'freetype2>=2.6.0' 'gcc-libs' 'glib2' 'glibc' 'glu' 'libegl' 'libgl' 'libglvnd' 'libpulse' 'libsecret' 'libx11' 'libxcomposite' 'libxcursor' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'openal' 'qt5-base' 'qt5-declarative' 'qt5-webchannel' 'qt5-webengine' 'systemd-libs' 'zlib>=1.1.4')
optdepends=('binutils')
replaces=('digitalwatchdog-client-1.2<4.2.0')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://updates.networkoptix.com/digitalwatchdog/36871/linux/dwspectrum-client-5.0.0.36871-linux_x64.deb")
sha512sums_x86_64=('0525b0b969a0aa850cbd00f54a16822016845b5e06781dd78fa763b9f736c71a0e155d88661d4501e448739ace99f81f57350a1421f88d8940c068d34ba0b5d7')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
