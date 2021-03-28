# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=ephemeral-bin
_appname=ephemeral
_projectname=com.github.cassidyjames.ephemeral
pkgver=7.1.0
_subver=d58474
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
sha512sums=('fecfbe8f2799844219306315f13f818895b4c39353173a76773b6fb529c34adaf410531e9e3711e71dda07fe2f68dd3f03c2a2ed8d5d1925a32f5ec301671e69')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
