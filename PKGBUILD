# Maintainer: xNN <xnnism@gmail.com>
# Contributor: xNN
pkgname=wifi-pumpkin-git
_gitname=WiFi-Pumpkin
pkgver=v0.8.5.r61.g493d29c
pkgrel=1
pkgdesc="WiFi-Pumpkin. A tool for creating a WiFi-Hotspot and executing MitM-Attacks"
arch=('any')
url="https://github.com/P0cL4bs/WiFi-Pumpkin"
license=('GPL')
groups=('')
depends=('git' 'hicolor-icon-theme' 'hostapd' 'libarchive' 'libffi' 'libnetfilter_queue' 'libpcap' 'libxml2' 'libxslt' 'mitmproxy' 'openssl' 'python' 'python-pyqt4' 'zlib')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("git://github.com/P0cL4bs/WiFi-Pumpkin.git")
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"

  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
