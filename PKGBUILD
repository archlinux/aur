
pkgname=ncl-highres
pkgver=0.1
pkgrel=2
pkgdesc="High-resolution coastlines for NCL, RANGS (Regionally Accessible Nested Global Shorelines) and GSHHS (Global Self-consistent Hierarchical High-resolution Shoreline)"
arch=('any')
license=('public domain')
url="http://www.ncl.ucar.edu/Document/Graphics/rangs.shtml"
depends=('ncl')
makedepends=('unzip')
optdepends=()
source=("http://www2008.io-warnemuende.de/homepages/rfeistel/download/rangs(0).zip"
        "http://www2008.io-warnemuende.de/homepages/rfeistel/download/rangs(1).zip"
        "http://www2008.io-warnemuende.de/homepages/rfeistel/download/rangs(2).zip"
        "http://www2008.io-warnemuende.de/homepages/rfeistel/download/rangs(3).zip"
        "http://www2008.io-warnemuende.de/homepages/rfeistel/download/rangs(4).zip"
        "http://www2008.io-warnemuende.de/homepages/rfeistel/download/gshhs(0).zip"
        "http://www2008.io-warnemuende.de/homepages/rfeistel/download/gshhs(1).zip"
        "http://www2008.io-warnemuende.de/homepages/rfeistel/download/gshhs(2).zip"
        "http://www2008.io-warnemuende.de/homepages/rfeistel/download/gshhs(3).zip"
        "http://www2008.io-warnemuende.de/homepages/rfeistel/download/gshhs(4).zip")
md5sums=('d50c74655c45329e5fd264f06f070451'
         'cb65f487221fb4f7381f3c5922d40116'
         'ded26282ff5f32d5aea0cce0e18f40d2'
         'c0873f44cae1e84d0fc470e6f6ee88db'
         '025b5d31bcd21e404a5092b777b5ed38'
         '4815e9edbdae713cf24c859dd4de3019'
         '26807b25f942cc7f9ebb56359f6b0b0c'
         '068babc759152d538d648cf7b035efcb'
         '73e263f0e38359849b3130abb2ac147e'
         '5a3903ffd8ccc42c298050362f55b958')
provides=('ncl-highres')

build() {
    mkdir -p $pkgdir/usr/lib/ncarg/database/rangs
    cp *.rim *.cat *.cel $pkgdir/usr/lib/ncarg/database/rangs/
}