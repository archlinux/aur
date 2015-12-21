# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: J. Luck <jluck@udel.edu>
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/nixnote-beta/PKGBUILD

pkgname=nixnote-beta
_pkgname=nixnote2
pkgver=2.0_beta7
_pkgver="NixNote2%20-%20Beta%207"
_beta_release="beta7"
pkgrel=1
pkgdesc="Formerly called nevernote, nixnote is a clone of Evernote designed to run on Linux."
url="http://www.sourceforge.net/projects/nevernote/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('mimetex' 'opencv' 'poppler-qt4' 'qt4' 'sqlite' 'tidyhtml' 'qtwebkit' 'libcurl-compat')
provides=('nixnote2')
conflicts=('nixnote' 'nixnote2-git')
replaces=('nixnote')
source_x86_64=("http://download2.polytechnic.edu.na/pub4/sourceforge/n/ne/nevernote/${_pkgver}/${_pkgname}-2.0-${_beta_release}_amd64.tar.gz")
sha256sums_x86_64=('6898d2e47f23ef6d3255948b407cb4507bb773b2b0b47be505bd50f3eae56d8f')
source_i686=("http://download2.polytechnic.edu.na/pub4/sourceforge/n/ne/nevernote/${_pkgver}/${_pkgname}-2.0-${_beta_release}_i386.tar.gz")
sha256sums_i686=('c32c8cda51867c582e0ba765270d92d01b6e5e980cac48bd015cdf4234396a30')

package()
{
cp -R "${srcdir}/nixnote2/usr" "${pkgdir}/"
}
