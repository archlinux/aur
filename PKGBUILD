# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: J. Luck <jluck@udel.edu>
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/nixnote-beta/PKGBUILD

pkgname=nixnote-beta
_pkgname=nixnote2
pkgver=2.0_beta5
_pkgver="NixNote2%20-%20Beta%205"
_beta_release="beta5"
pkgrel=1
pkgdesc="Formerly called nevernote, nixnote is a clone of Evernote designed to run on Linux."
url="http://www.sourceforge.net/projects/nevernote/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('mimetex' 'opencv' 'poppler-qt4' 'qt4' 'sqlite' 'tidyhtml' 'qtwebkit')
provides=('nixnote2')
conflicts=('nixnote' 'nixnote2-git')
replaces=('nixnote')
source_x86_64=("http://download2.polytechnic.edu.na/pub4/sourceforge/n/ne/nevernote/${_pkgver}/${_pkgname}-2.0-${_beta_release}_amd64.tar.gz")
sha256sums_x86_64=('6150b876556a55de5817a73f8c072e10961e30eb565306762b3c55494550cdf9')
source_i686=("http://download2.polytechnic.edu.na/pub4/sourceforge/n/ne/nevernote/${_pkgver}/${_pkgname}-2.0-${_beta_release}_i386.tar.gz")
sha256sums_i686=('e0dbb9b8a774983e955b3a4c74be1e28e57ccdfd45581c5876c8e9c056763432')

package()
{
	cp -R "${srcdir}/nixnote2/usr" "${pkgdir}/"
}
