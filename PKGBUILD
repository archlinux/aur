# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=ephemeral-bin
_appname=ephemeral
_projectname=com.github.cassidyjames.ephemeral
pkgver=7.0.5
_subver=4fa2dc
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
sha512sums=('8e4d972dea03a2c479a8f363400e166a4a03463037c610c6022d59a33016401712ca4541f1b5ec6956cb0936576c3eca2581f6405fddd7f6d6ea12edd89e5194')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
