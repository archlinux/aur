# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=nylas-mail-lives-bin
_pkgname=nylas
pkgver=2.1.0
pkgrel=1
pkgdesc="An open source fork of Nylas Mail (N1)"
arch=('x86_64')
url="https://github.com/nylas-mail-lives/nylas-mail/"
license=('GPL3')
depends=('libxkbfile' 'libxss' 'python' 'nodejs' 'libxtst' 'alsa-lib' 'gconf' 'gcc-libs-multilib' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')
provides=('nylas')
source=("https://github.com/nylas-mail-lives/nylas-mail/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('5de1beaf9ad8824e635846fb4e9110fac874c41f1797fe33644a13ba222768dc')

package() {

  # extract the data part of the deb package
  tar xJfp data.tar.xz -C ${pkgdir}
}
