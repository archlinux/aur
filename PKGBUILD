# Maintainer: Sergio Schneider <s p s f 6 4  at  g m a i l.c o m>

_gitname=Futura-Icon-Pack
pkgname=futura-icon-pack-git
pkgver=r12
pkgrel=1
pkgdesc='Futuristic icon pack, combination of Kora (mainly), Papirus, Tela'
arch=(any)
makedepends=('git' 'unzip')
url="https://github.com/coderhisham/${_gitname}"
license=('GPL3')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver(){
    cd ${_gitname}
#    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
    install -d -m 755 "$pkgdir"/usr/share/icons/Futura-Icon-Pack

#    cd $srcdir/${_gitname}/
#    unzip "Futura-Icon-Pack-main.zip" -d Futura-Icon-Pack

#    cp -r Futura-Icon-Pack/*/* "$pkgdir"/usr/share/icons/Futura-Icon-Pack/
    cp -r Futura-Icon-Pack/* "$pkgdir"/usr/share/icons/Futura-Icon-Pack/
}
