# Maintainer: li <lcj211@aihlp.com>

pkgname=systemd-autossh
pkgver=1.0.0
pkgrel=21
pkgdesc="systemd for autossh"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
#depends=('systemd-kexec' 'systemd-godns' 'git-tools' gfwlist-route  pkgfile)
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
	'pkgbuild-introspection: For mksrcinfo'


)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=(
autossh@.service
)
sha512sums=(
47c8c136a317734e62901dedc67d75d2df6c25cb35488f5717f055db4de0a280a5fa4c43121e2aeb1b89b8e22648f140117c25279b5e34b6877413012f3c866c

)

#Package files should follow these general directory guidelines:
#/etc	System-essential configuration files
#/usr/bin	Binaries
#/usr/lib	Libraries
#/usr/include	Header files
#/usr/lib/{pkg}	Modules, plugins, etc.
#/usr/share/doc/{pkg}	Application documentation
#/usr/share/info	GNU Info system files
#/usr/share/man	Manpages
#/usr/share/{pkg}	Application data
#/var/lib/{pkg}	Persistent application storage
#/etc/{pkg}	Configuration files for {pkg}
#/opt/{pkg}	Large self-contained packages


#build() {
 # rm -rf build
 # cmake -B build -S "$pkgname-v$pkgver" \
 # -DCMAKE_INSTALL_PREFIX=/usr \
 # -DBUILD_TESTING=OFF \
 # -Wno-dev
 # make -C build:

#}

package() {
# make -C build DESTDIR="$pkgdir" install
install  -Dm644  autossh@.service  "$pkgdir/usr/lib/systemd/system/autossh@.service"

}

groups=('lcj')

