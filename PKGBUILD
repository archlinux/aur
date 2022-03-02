# Maintainer: wzy <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo='holman/spark'
_source_type='github-tags'
_upstreamver='v1.0.1'
_pkgname=${_repo##*/}

pkgname=$_pkgname-bash
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc='▁▂▃▅▂▇ in your shell.'
arch=('any')
url="https://github.com/$_repo"
license=('MIT')
provides=("$_pkgname-$pkgver")
conflicts=("$_pkgname-$pkgver")
source=("$_pkgname-$pkgver::$url/archive/$_upstreamver.tar.gz")
sha256sums=('a81c1bc538ce8e011f62264fe6f33d28042ff431b510a6359040dc77403ebab6')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D "$_pkgname" -t "$pkgdir/usr/bin"
}
