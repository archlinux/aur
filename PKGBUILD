# Maintainer: Aaruni Kaushik <akaushik@mathematik.uni-kl.de>
_name=maps
pkgname=maps
pkgver=0.3
pkgrel=1
pkgdesc="Sandboxing tool for Mathematical Research Software"
arch=('x86_64')
url='https://github.com/aaruni96/maps'
license=('GPL3')
depends=('base-devel'
         'openssl'
         'cairo'
         'git'
         'gobject-introspection-runtime'
         'python3'
         'ostree'
         'meson'
         'python-tomli'
         'python-gobject'
         'python-progress'
         'python-tuspy'
         )
conflicts=('maps')
provides=('maps')
optdepends=()
makedepends=('git')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c58043b099d5721018b02221afb0621d4deeb3e2bf7bfad0d36f2928ea43f120')

package(){
    install -Dm 755 "$srcdir/${_name}-${pkgver}/src/maps" "$pkgdir/usr/bin/maps"
    install -Dm 644 "$srcdir/${_name}-${pkgver}/src/completion.bash" "$pkgdir/usr/share/bash-completion/completions/maps"
}
