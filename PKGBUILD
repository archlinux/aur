# Maintainer: 0xpanic <kwswesey at gmail dot com>

pkgname=fortune-mod-dril
pkgver=20200708
pkgrel=1
pkgdesc="Fortune quotes from @dril"
arch=('any')
license=('custom:none')
depends=('fortune-mod')
makedepends=('git')
groups=('fortune-mods')


build()
{
	git clone https://github.com/0xPanic/fortune-mod-dril.git
}

package()
{
    install -D -m644 dril dril.dat ${pkgdir}/usr/share/fortune
}

