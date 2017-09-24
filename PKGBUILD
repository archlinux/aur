# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=nylas-mail-lives-bin
_pkgname=nylas
pkgver=2.2.0
pkgrel=1
pkgdesc="An open source fork of Nylas Mail (N1)"
arch=('x86_64')
url="https://github.com/nylas-mail-lives/nylas-mail/"
license=('GPL3')
depends=('libxkbfile' 'libxss' 'python' 'nodejs' 'libxtst' 'alsa-lib' 'gconf' 'gcc-libs' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')
provides=('nylas-mail')
source=("https://github.com/nylas-mail-lives/nylas-mail/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('2d208f8859375da49de21f96186674af3c358bc0b6fe01c7f079487c815efeba')

package() {
  # extract the data part of the deb package
  tar xJfp data.tar.xz -C ${pkgdir}
}
