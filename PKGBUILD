# Maintainer: lu40 <lucaobertuefer at mailbox dot org>
pkgname=ttf-campus_relief
pkgver=1.0
pkgrel=1
pkgdesc="Campus Relief Truetype Font by imagex"
arch=('any')
url="http://www.dafont.com/campus_relief.font"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-campus_relief.install
source=('http://img.dafont.com/dl/?f=campus_relief')
noextract=('?f=campus_relief')
md5sums=('77da495a53c0737cf5e48f87a14a704b')

prepare() {
    cd "$srcdir"
    mv "?f=campus_relief" "campus_relief.zip"
    unzip campus_relief.zip
}

package() {
    cd "$srcdir"
    install -Dm0644 Campus\ Relief.ttf $pkgdir/usr/share/fonts/TTF/Campus\ Relief.ttf
}
