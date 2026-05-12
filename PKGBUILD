# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=gitpane-bin
_pkgname=gitpane
pkgver=0.6.2
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
source_x86_64=("$_pkgname-bin::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-bin::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('5953e81de31e9fbf77306d93feac10000c25889ec5a35c1e954d0d6efc3fd794')
sha256sums_x86_64=('7ececf88756828d68373845322d440239a33f8f400964dfab5f43511e6c79689')
sha256sums_aarch64=('7322cd214ced3876441551e6d371250fb461dadbff57d05a4ab4cf588ebcceea')

package() {
    install -Dm0755 gitpane "$pkgdir/usr/bin/gitpane"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
