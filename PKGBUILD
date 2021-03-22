# Maintainer: Benjamin Higgins <mail@brhiggins.com>
# Generated with https://github.com/bhigginsuk/ut1-blacklists-pkgbuild-generator
# Output in /opt/
_listname=strong_redirector
pkgname="ut1-blacklists-$_listname"
pkgver=20210208
pkgrel=1
pkgdesc="Université Toulouse 1 Capitole '$_listname' blocklist: \"Same as strict_redirector, but, for google, yahoo, we are only blocking some terms.\""
arch=("any")
url="https://dsi.ut-capitole.fr/blacklists/index_en.php"
license=("CC BY-SA 4.0")
groups=("ut1-blacklists")
source=("ftp://ftp.ut-capitole.fr/pub/reseau/cache/squidguard_contrib/$_listname.tar.gz")
md5sums=("SKIP")

pkgver() {
    date +%Y%m%d
}

package() {
    mkdir -p "$pkgdir/opt/"
    cp -r "$_listname/" "$pkgdir/opt/$pkgname"
}

