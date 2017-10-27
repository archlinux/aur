# Contributor: Ivy Foster <code@escondida.tk>

pkgname=lua-cosmo-git
pkgver=16.06.04
pkgrel=1
pkgdesc='Safe templates for Lua'
arch=(i686 x86_64)
url='http://cosmo.luaforge.net/'
license=(MIT)

depends=(lua lua-lpeg)
makedepends=(luarocks)

provides=(lua-cosmo)
conflicts=(lua-cosmo)

source=('git+https://github.com/mascarenhas/cosmo.git')
md5sums=(SKIP)

package() {
	luarocks --tree="$pkgdir/usr" install --deps-mode=none cosmo
	find "$pkgdir/usr" -name manifest -delete
}
