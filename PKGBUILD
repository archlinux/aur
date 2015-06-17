# Mantainer: M0Rf30

pkgname=unrealtournament-bonuspack3
pkgver=20000511
pkgrel=2
pkgdesc="Bonuspack 3: The Inoxx Pack for Unreal Tournament."
arch=('i686' 'x86_64')
url="http://www.unrealtournament2004.com/utgoty/"
license=('custom')
groups=(unrealtournament unrealtournament-bonuspacks)
depends=(unrealtournament)
conflicts=(ut1999-bonuspack3)
source=(http://downloads.unrealadmin.org/UnrealTournament/BonusPack/utinoxxpacknoumod.zip)
noextract=(utinoxxpacknoumod.zip)

package() {
    cd "${srcdir}"
    install --directory -- "${pkgdir}/opt/ut"
    bsdtar xfC utinoxxpacknoumod.zip "${pkgdir}/opt/ut" || return 1
    chmod -R -- 644 ${pkgdir}/opt/ut/*/*
}

md5sums=('2825ad2bbf5c9ea0887b91907c16dd31')

