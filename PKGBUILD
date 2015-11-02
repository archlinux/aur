# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: J. Luck <jluck@udel.edu>
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/nixnote-beta/PKGBUILD

pkgname=nixnote-beta
_pkgname=nixnote2
pkgver=2.0-beta4
_pkgver="NixNote2%20-%20Beta%204"
_beta_release="beta4"
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
sha256sums_x86_64=('2a839c962cb9115c72a5094d65f5cbeec597673dbf844450d82e90a89b8ed4d6')
source_i686=("http://download2.polytechnic.edu.na/pub4/sourceforge/n/ne/nevernote/${_pkgver}/${_pkgname}-2.0-${_beta_release}_i386.tar.gz")
sha256sums_i686=('4c7f86662d183bc1eaf4e0cea7e58a02eae78869fc234a6fc11e1686e9d0d643')

package()
{
	cp -R "${srcdir}/nixnote2/usr" "${pkgdir}/"
}
