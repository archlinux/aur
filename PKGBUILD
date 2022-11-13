# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=5.0.0.35746
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
source_x86_64=("https://updates.networkoptix.com/digitalwatchdog/35746/linux/dwspectrum-client-5.0.0.35746-linux_x64.deb")
sha512sums_x86_64=('d1d7ffb8254b0d1a1af5f1b4278bbc5ec909513bf1525610995ae62b801c416847252eb2be57f917ed4fea9dbeeb8e001e60526780a46186c83693fe96aec864')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
