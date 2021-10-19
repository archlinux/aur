# Maintainer: li <lcj211@aihlp.com>

pkgname=git-tools
pkgver=1.0.0
pkgrel=7
pkgdesc="git toools "
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=('kexec-tools')
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
#optdepends=(
#	'vulkan-tools: For vulkaninfo'
#	'mesa-demos: For glxinfo',
#	'util-linux: For lscpu'
#)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=(
"push"
"pull"
"fetch"
)
sha512sums=(
'ff57aaff6ea6ebd2572e36d7bd5fe31d78796b0ff052ac4ff1f73013693b5a36af4462b44e8f41f6c3bc0c5fcfb4b60214db45146eec6a1588d848f1991dcad0'
'1d5d478455f84ae3246a4c4f74d01d1bff092c62f8fe74808db1f3605943c17d3fffe4cc93e7df88d72a4dcc8e120eb85e8cbf7117b5a551aa596b46cf9b358a'
'c26d3b955c485dd306f010560c9ba5d6f982240e03660098fd4db2cce25e24bfa0f5e237a078ed9e0f977fdfa3e976faf1f8be0dcc396ab7fa8a0afbed5ad575'
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
 # make -C build

#}

package() {
# make -C build DESTDIR="$pkgdir" install
install  -Dm755 push  "$pkgdir/usr/bin/push"
install  -Dm755 pull  "$pkgdir/usr/bin/pull"
install  -Dm755 fetch  "$pkgdir/usr/bin/fetch"
}

groups=('lcj')

