# Maintainer: mortzprk <mortz.prk@gmail.com>

pkgname=nixnote_beta
_pkgname=nixnote2
pkgver=2.0_beta10
_pkgver="NixNote2%20-%20Beta%2010"
_beta_release="beta10"
pkgrel=2
pkgdesc="Formerly called nevernote, nixnote is a clone of Evernote designed to run on Linux"
url="http://www.sourceforge.net/projects/nevernote"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('mimetex' 'opencv' 'poppler-qt4' 'qt4' 'sqlite' 'tidyhtml' 'qtwebkit' 'libcurl-compat')
provides=('nixnote2')
conflicts=('nixnote' 'nixnote2-git' 'nixnote-beta')
replaces=('nixnote')
source=("nixnote2.desktop")
sha256sums=('6c88cd5ae3f5c18e342fcf5165891b22d99818d3fe2ac2b124262b8ba23bb4d1')
source_x86_64=("http://download2.polytechnic.edu.na/pub4/sourceforge/n/ne/nevernote/${_pkgver}/${_pkgname}-2.0-${_beta_release}_amd64.tar.gz")
sha256sums_x86_64=('00713e824b214702812aecbf2d4ede8734766fa38f630f39c42b9ac64ad84327')
source_i686=("http://download2.polytechnic.edu.na/pub4/sourceforge/n/ne/nevernote/${_pkgver}/${_pkgname}-2.0-${_beta_release}_i386.tar.gz")
sha256sums_i686=('2e18534f3875337cc2eb05bdf0ef201272705d370a694019146bd04199633516')

package() {
    cp -R "${srcdir}/nixnote2/usr" "${pkgdir}/"
    install -D -m644 nixnote2.desktop ${pkgdir}/usr/share/applications/nixnote2.desktop
}
