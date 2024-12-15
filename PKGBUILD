# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Maintainer: Eric Busch <me@etbus.ch>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=6.0.0.39503
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
source_x86_64=("https://updates.digital-watchdog.com/digitalwatchdog/39503/linux/dwspectrum-client-6.0.0.39503-linux_x64.deb")
sha512sums_x86_64=('78fd8c8b7ec2688a9c7c5f1de5e7b244f763a92f1f1889288d2fd815086f6a52889807ece590d952ff1c6f7a3a128f50366a84f02a17d5517bc4cda946b29f54')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

}
