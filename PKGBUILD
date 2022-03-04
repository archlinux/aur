# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=4.2.0.32842
pkgrel=1
pkgdesc="DW Spectrum Client"
arch=('x86_64')
url="http://completeipsolution.com"
license=('Proprietary')
groups=('')
depends=('alsa-lib' 'dbus' 'fontconfig' 'freetype2>=2.6.0' 'gcc-libs' 'glib2' 'glibc' 'glu' 'libegl' 'libgl' 'libglvnd' 'libpulse' 'libsecret' 'libx11' 'libxcomposite' 'libxcursor' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'openal' 'qt5-base' 'qt5-declarative' 'qt5-webchannel' 'qt5-webengine' 'systemd-libs' 'zlib>=1.1.4')
optdepends=('binutils')
replaces=('digitalwatchdog-client-1.2<4.2.0')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://digital-watchdog.com/_gendownloads/3a136a16-d403-4478-bc9a-6f9795ca65f8/dwspectrum-client-4.2.0.32842-linux64.deb")
sha512sums_x86_64=('0551d8917ba031e81b9a2ca599d86c37ab5d3ca02f5f22e28dcf0a9bf7fe1575ac66258c2d23f438efb026753f9c740b97261ecdfff40cf0a67344349acdaf58')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
