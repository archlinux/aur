# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=5.0.0.35271
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
source_x86_64=("https://updates.networkoptix.com/digitalwatchdog/35271/linux/dwspectrum-client-5.0.0.35271-linux_x64.deb")
sha512sums_x86_64=('692d89edfebe6a936688739ab02a647ce4a476b9d263ab09656e56c650eca2c6fffad4d726ef2b74fd3632aed68540c1f56127886af9801f416d1e68ece01954')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
