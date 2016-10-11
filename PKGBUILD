# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.11.2661
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
depends=('bash-completion' 'desktop-file-utils' 'gconf' 'git' 'glibc' 'gtk2' 'gvfs' 'hicolor-icon-theme'
         'libcap' 'libgcrypt' 'libgcrypt15' 'libnotify' 'libsystemd' 'libudev0' 'libxtst' 'nss' 'xdg-utils')
source_x86_64=("https://wire-app.wire.com/linux/wire_${pkgver}_amd64.deb")
sha256sums_x86_64=(1ddccb710fb04a62c876c71df23aa36c64ce5d25525da53041ca587bb20e1a19)
optdepends=('libgnome-keyring' 'lsb-release')

package() {
  cd "$srcdir"
  ar xf "wire_${pkgver}_amd64.deb"
  tar xf data.tar.xz -C "$pkgdir"
}
