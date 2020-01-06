# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=ephemeral-bin
_appname=ephemeral
_projectname=com.github.cassidyjames.ephemeral
pkgver=6.1.1
_subver=5ff1cc
pkgrel=1
pkgdesc="A private-by-default, always-incognito browser for elementary OS."
arch=('x86_64')
url="https://github.com/cassidyjames/ephemeral"
license=('GPL3')
depends=('dconf' 'desktop-file-utils' 'glib2>=2.49.2' 'granite>=5.2.3' 'gtk3>=3.22.29' 'hicolor-icon-theme' 'libdazzle>=3.25.3' 'libgee>=0.8.3' 'libsoup>=2.32.2' 'webkit2gtk>=2.15.4')
install=${pkgname}.install
source=("http://packages.elementary.io/appcenter/pool/main/c/${_projectname}/${_projectname}${pkgver}-${_subver}.deb")
sha512sums=('5de2937bf42ade6f93024ef8a37126e392d93426831619927b2b5198be868781e5b504d7b886f490356a88cc0a1464e500609b4c0088c4ea96a4d78a8884dd58')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
