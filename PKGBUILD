# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=nylas-mail-lives-bin
_pkgname=nylas
pkgver=2.2.1
pkgrel=1
pkgdesc="An open source fork of Nylas Mail (N1)"
arch=('x86_64')
url="https://github.com/nylas-mail-lives/nylas-mail/"
license=('GPL3')
depends=('libxkbfile' 'libxss' 'python' 'nodejs' 'libxtst' 'alsa-lib' 'gconf' 'gcc-libs' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')
provides=('nylas-mail')
source=("https://github.com/nylas-mail-lives/nylas-mail/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('60b88863f0dc7a423edb01dd7c092746a6715d28b1f9d05aee35e291f513d873')

package() {
  # extract the data part of the deb package
  tar xJfp data.tar.xz -C ${pkgdir}
}
