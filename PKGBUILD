# Maintainer: McKay Humpherys <mckaybhumpherys@gmail.com>
# Maintainer: Eric Busch <me@etbus.ch>
# Contributor: McKay
pkgname=digitalwatchdog-client
pkgver=6.0.6.41837
pkgrel=2
pkgdesc="DW Spectrum Client"
arch=('x86_64')
url="https://digital-watchdog.com/"
license=('Proprietary')
depends=('alsa-lib' 'dbus' 'fontconfig' 'freetype2>=2.6.0' 'gcc-libs' 'glib2' 'glibc' 'glu' 'libegl' 'libgl' 'libglvnd' 'libpulse' 'libsecret' 'libx11' 'libxcomposite' 'libxcursor' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'openal' 'qt5-base' 'qt5-declarative' 'qt5-webchannel' 'qt5-webengine' 'systemd-libs' 'zlib>=1.1.4' 'libxml2-legacy')
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
