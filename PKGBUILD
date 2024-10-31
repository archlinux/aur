# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Maintainter: Eric Busch <me@etbus.ch>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=5.1.5.39242
pkgrel=1
pkgdesc="DW Spectrum Client"
arch=('x86_64')
url="https://digital-watchdog.com/"
license=('Proprietary')
depends=('alsa-lib' 'dbus' 'fontconfig' 'freetype2>=2.6.0' 'gcc-libs' 'glib2' 'glibc' 'glu' 'libegl' 'libgl' 'libglvnd' 'libpulse' 'libsecret' 'libx11' 'libxcomposite' 'libxcursor' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'openal' 'qt5-base' 'qt5-declarative' 'qt5-webchannel' 'qt5-webengine' 'systemd-libs' 'zlib>=1.1.4')
optdepends=('binutils')
replaces=('digitalwatchdog-client-1.2<4.2.0')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://updates.digital-watchdog.com/digitalwatchdog/39242/linux/dwspectrum-client-5.1.5.39242-linux_x64.deb")
sha512sums_x86_64=('d9ae9f9dda896426b44b3b4fdb0e7fe5d7d15919177652adef50c3d66eb6ac736609b5091e2552af68bf0013aca2b8f77f3ea474f5e3478221b1e217a431853a')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
