# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=ephemeral-bin
_appname=ephemeral
_projectname=com.github.cassidyjames.ephemeral
pkgver=6.4.1
_subver=8afed7
pkgrel=1
pkgdesc="A private-by-default, always-incognito browser for elementary OS."
arch=('x86_64')
url="https://github.com/cassidyjames/ephemeral"
license=('GPL3')
depends=('dconf' 'desktop-file-utils' 'glib2>=2.49.2' 'granite>=5.2.3' 'gtk3>=3.22.29' 'hicolor-icon-theme' 'libdazzle>=3.25.3' 'libgee>=0.8.3' 'libsoup>=2.32.2' 'webkit2gtk>=2.15.4')
conflicts=('ephemeral' 'ephemeral-git')
provides=('ephemeral')
install=${pkgname}.install
source=("http://packages.elementary.io/appcenter/pool/main/c/${_projectname}/${_projectname}${pkgver}-${_subver}.deb")
sha512sums=('08f33c7bd456c06f3d9a15d6466695f68ef7a23513b79181f7f0fbe01de42885b54d591738293a2f48ce35429a8c657ef713b122cdf7276e39fed1858a5ac37f')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
