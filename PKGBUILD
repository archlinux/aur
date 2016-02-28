# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: J. Luck <jluck@udel.edu>
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/nixnote/PKGBUILD

pkgname=nixnote
pkgver=1.6
_pkgver='NixNote%201.6'
pkgrel=1
pkgdesc="Formerly called nevernote, nixnote is a clone of Evernote designed to run on Linux"
url="http://www.sourceforge.net/projects/nevernote"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('java-runtime' 'libpng12')
conflicts=('nixnote-beta')
source_x86_64=("http://download2.polytechnic.edu.na/pub4/sourceforge/n/project/project/ne/nevernote/${_pkgver}/${pkgname}-${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('781f8b9cbe3e1137b62d4dbb76670b3e2d5a20403b04b3767e03a2e89dba860e')
source_i686=("http://download2.polytechnic.edu.na/pub4/sourceforge/n/project/project/ne/nevernote/${_pkgver}/${pkgname}-${pkgver}_i386.tar.gz")
sha256sums_i686=('50be711e33d37fd43590845718e5e5710cc48a5f7f745df8990b0f792da3a7da')

package() {
    cp -R "${srcdir}/nixnote/usr" "${pkgdir}/"
    mv "${pkgdir}/usr/bin/nixnote.sh" "${pkgdir}/usr/bin/nixnote"
}
