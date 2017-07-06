# Maintainer: zoe

pkgname="keepass-plugin-pronouncepwgen"
pkgver=1.0.4b
pkgrel=2
pkgdesc="A pronounceable password generator plugin for KeePass"
arch=("any")
url="https://sourceforge.net/projects/pronouncepwgen"
license=("GPLv2")
depends=("keepass")
source=("https://sourceforge.net/projects/pronouncepwgen/files/pronouncepwgen/$pkgver/PronouncePwGen-$pkgver.zip")
md5sums=('e7f1134a543afd1fd76bb06a81d1880a')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    cd "$srcdir"
    install -m644 PronouncePwGen.plgx "${pkgdir}"/usr/share/keepass/plugins/

}

# vim:set ts=2 sw=2 et:
