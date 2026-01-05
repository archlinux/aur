# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor : Stefano Capitani <stefanoatmanjarodotorg>
# Contributor : lemovice <lemovice-at-ancestris-dot-org> 

pkgname="ancestris"
pkgver=14
pkgrel=1
pkgdesc="Unlimited family tree freeware"
url="https://www.ancestris.org"
license=("GPL3")
arch=("any")
optdepends=("java-runtime")
source=("$url/dl/pub/ancestris/dev/Ancestris-daily.zip"
        "ancestris.desktop"
        "ancestris.png")
b2sums=('c731199eb6d0b28110f299f3fd9b9a6e502d4064d3355320fe8ff038d4a6a770023f6079dcc07bf39ea7ac2259ebc8933eb173db326fd56c4156cb9fef764d25'
        'eebcf5b31aeb6ad09cdbc68be5832736018920d8461e2cb96f97de821fb645fe8a344237d4bbc7e5246029a061af3ffe7e7c22dcf55a221d58384837e1148b91'
        '89ad6d4a7178ae5a082f0d2d63662591b86a47992e7cdb6f1620cb97544d89e4339436f8f4d40bc4b94643ecbefe2b36a61eee721fca19a72be0089cb6e91861')
options=("!strip")

package(){
 # create missing directories
 install -d -m 755 "$pkgdir/opt" "$pkgdir/usr/share/"{applications,pixmaps}
 # copy program files
 cp -r "ancestris" "$pkgdir/opt"
 # copy desktop entry files
 install -D -m 644 "ancestris.desktop" "$pkgdir/usr/share/applications/ancestris.desktop"
 install -D -m 644 "ancestris.png" "$pkgdir/usr/share/pixmaps/ancestris.png" 
}
