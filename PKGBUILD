# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: David Trail <david@vaunt.eu>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=imgurbash
pkgver=6
pkgrel=1
pkgdesc="An Imgur uploader bash script"
arch=('any')
url="https://github.com/tremby/imgur.sh"
license=('custom:PublicDomain')
depends=('curl')
optdepends=('xsel: copy the URL to clipboard (or xclip)'
  'xclip: copy the URL to clipboard (or xsel)')
source=("https://github.com/tremby/imgur.sh/archive/v${pkgver}.tar.gz")
sha256sums=('a4334d64b6e7cf3deb1f4a5091e9ef3da5539b158f6953b2379ded836b2930f6')

package() {
  cd "imgur.sh-${pkgver}"

  install -D -m 0755 imgur.sh "${pkgdir}/usr/bin/imgur.sh"

  install -D -m 0644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
