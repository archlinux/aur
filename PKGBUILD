# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=pdfposter
pkgver=0.7.post1
pkgrel=1
pkgdesc='Print large posters on multiple sheets'
arch=('any')
url='https://build.opensuse.org/package/show?package=pdfposter&project=devel%3Alanguages%3Apython'
license=('GPL3')
depends=('python-pypdf2')
source=("https://gitlab.com/pdftools/pdfposter/-/archive/v${pkgver}/pdfposter-v${pkgver}.tar.bz2")
sha512sums=('f399477df3a627ccd954a9f9fee55e8876c6ccb7895e3bac514c38d9905c44afd34a2405e0a6f475201a6104d3efb5796381ede84ddb66d78d9a6a4022b25c14')

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
