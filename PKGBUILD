# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=5.1.2.37996
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
source_x86_64=("https://updates.digital-watchdog.com/digitalwatchdog/37996/linux/dwspectrum-client-5.1.2.37996-linux_x64.deb")
sha512sums_x86_64=('36712ccc3419cc4ae284e60be81dec9939c9e8f70e267393302bbc4eaa24f793305f396c6d6be9b46734d1d5dd6d637457589636ec707e1a9263821202388601')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
