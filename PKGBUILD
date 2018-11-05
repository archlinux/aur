# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=ncl-highres
pkgver=1
pkgrel=4
pkgdesc="High-resolution coastlines for NCL, RANGS (Regionally Accessible Nested Global Shorelines) and GSHHS (Global Self-consistent Hierarchical High-resolution Shoreline)"
arch=('any')
license=('public domain')
url="http://www.ncl.ucar.edu/Document/Graphics/rangs.shtml"
depends=('ncl')
makedepends=('unzip')
optdepends=()
source=("https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/rangs(0).zip"
        "https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/rangs(1).zip"
        "https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/rangs(2).zip"
        "https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/rangs(3).zip"
        "https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/rangs(4).zip"
        "https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/gshhs(0).zip"
        "https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/gshhs(1).zip"
        "https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/gshhs(2).zip"
        "https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/gshhs(3).zip"
        "https://www.io-warnemuende.de/tl_files/staff/rfeistel/download/gshhs(4).zip")
sha256sums=('f61d35bddef1207ecb7571ff338b2b2ad3701aeda029bd9f54f28e82636d878f'
            'e11a24f05d58e94cc8214c98ec4084b26d1cb5dac36353bfeec401e1b069791d'
            '846aff301b6b4d9b6cccc0a7460a67fad944a50f4106b2656b87fef4c8e8dedf'
            '66f06c2a6f9639251d0bcf9331813fa6124404e7e914031e5d3a228e14d92a26'
            '87c142e179d5a60918a932402ab47778baa7560db4b91eb1e6f65b9f0934daa4'
            'a999920016c45df2333ffc10da3aa6e654fbda2a7703945ebc7cb36d865c797f'
            'a8ddf8ab60c64226d4cc3fa42408228dd856738282377371a375b1185ed8deb4'
            '5923a7116353aade1ea17496545ec1c142a8ee289f007f29f48ea0a923abe4aa'
            '997eca9960541cb11e2bc91792f90f5e65588416ac8bfe670d06b30e296df02a'
            '85214163c2ff3732e5b8bbb922523521ab029e0d5c242be472967ee798d86b03')
provides=('ncl-highres')

package() {
    install -dm 755 $pkgdir/usr/lib/ncarg/database/rangs
    install -Dm 644  *.rim *.cat *.cel $pkgdir/usr/lib/ncarg/database/rangs/
}
