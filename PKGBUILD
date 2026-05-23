# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=gitpane-bin
_pkgname=gitpane
pkgver=0.7.2
pkgrel=1
pkgdesc='Multi-repo Git workspace dashboard for the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/affromero/gitpane'
license=('MIT')
depends=('git')
makedepends=('cargo' 'patch')
options=(!debug)
provides=('gitpane')
conflicts=('gitpane' 'gitpane-git')
source=("LICENSE::https://raw.githubusercontent.com/affromero/$_pkgname/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-bin::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('5953e81de31e9fbf77306d93feac10000c25889ec5a35c1e954d0d6efc3fd794')
sha256sums_x86_64=('4221f94882d658f95cfa004afb41a9a302f237574cf733e3fc5e2f27cfccf404')
sha256sums_aarch64=('48ff8fc43af644c81ed88b72046e45c04d1d14b1c12a8424acada8256bd51d6e')

package() {
    install -Dm0755 gitpane "$pkgdir/usr/bin/gitpane"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
