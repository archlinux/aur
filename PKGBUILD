# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=nylas-mail-lives-bin
_pkgname=nylas-mail
pkgver=2.2.2
pkgrel=3
pkgdesc="An open source fork of Nylas Mail (N1)"
arch=('x86_64')
url="https://github.com/nylas-mail-lives/nylas-mail/"
license=('GPL3')
depends=('libxkbfile' 'libxss' 'python' 'nodejs' 'libxtst' 'alsa-lib' 'gconf' 'gcc-libs' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')
provides=('nylas-mail')
source=("https://github.com/nylas-mail-lives/nylas-mail/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('deb16edd2564c08e5fca3579c5e55b8f2a1030739d12d48cce804a83f35e7f9b')

package() {
  # extract the data part of the deb package
  tar xJfp data.tar.xz -C ${pkgdir}
}
