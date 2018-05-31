# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=nylas-mail-lives-bin
_pkgname=nylas-mail
pkgver=2.2.3
pkgrel=1
pkgdesc="An open source fork of Nylas Mail (N1)"
arch=('x86_64')
url="https://github.com/nylas-mail-lives/nylas-mail/"
license=('GPL3')
depends=('libxkbfile' 'libxss' 'python' 'nodejs' 'libxtst' 'alsa-lib' 'gconf' 'gcc-libs' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')
provides=('nylas-mail')
source=("https://github.com/nylas-mail-lives/nylas-mail/releases/download/${pkgver}/nylas-${pkgver}-amd64.deb")
sha256sums=('aebd5ae10d54362dadd80f064fe78d2d05c130733fc95ce52ef5ac00204aa30d')

package() {
  # extract the data part of the deb package
  tar xJfp data.tar.xz -C ${pkgdir}
}
