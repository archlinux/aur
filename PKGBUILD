# Contributor: Krzysztof Raczkowski <raczkow@gmail.com>
# Maintainer: Vladislav Glinsky <cl0ne[at]mithril.org.ua>

pkgname=xcursor-chameleon-white
pkgver=0.5
pkgrel=3
pkgdesc="Chameleon X Cursor Theme (white flavour)"
arch=('any')
url="http://www.kde-look.org/content/show.php?content=38459"
license=('GPL')
source=(http://www.egregorion.net/works/chameleon/Chameleon-White-${pkgver}.tar.bz2)
md5sums=('e70da217e0983a8aac9fc6b32fbf36b4')

package()
{
    for theme in Chameleon-White-{Large,Regular,Small}
    do
        install -dm755 "${pkgdir}/usr/share/icons/${theme}"
        cp -rt "${pkgdir}/usr/share/icons/${theme}" \
            "${srcdir}/${theme}-${pkgver}"/{cursors,index.theme}
    done
}
