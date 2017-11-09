# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=nylas-mail-lives-bin
_pkgname=nylas
pkgver=2.2.2
pkgrel=2
pkgdesc="An open source fork of Nylas Mail (N1)"
arch=('x86_64')
url="https://github.com/nylas-mail-lives/nylas-mail/"
license=('GPL3')
depends=('libxkbfile' 'libxss' 'python' 'nodejs' 'libxtst' 'alsa-lib' 'gconf' 'gcc-libs' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')
provides=('nylas-mail')
source=("https://github.com/nylas-mail-lives/nylas-mail/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('bd7b8104b617c2454b580539fb7da7a97bb625f0e40a7776ed2d8f468273bdcd')

package() {
  # extract the data part of the deb package
  tar xJfp data.tar.xz -C ${pkgdir}
}
