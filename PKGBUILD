# Maintainer: Hoàng Văn Khoa <hoangvankhoa@outlook.com>
# Contributor: SHoàng Văn Khoa <hoangvankhoa@outlook.com>
# Upstream URL: https://github.com/facebook/nuclide
#

pkgname=nuclide
pkgver=0.170.0
pkgrel=1
packager=hoangvankhoa
pkgdesc='A unified developer experience for web and mobile development'
depends=('atom')
arch=('x86_64' 'i686')
url='https://nuclide.io/'
license=('MIT')
source=("nuclide"
        "nupm"
        "nuclide.desktop"
        "nuclide.png"
        "https://github.com/facebook/nuclide/raw/master/LICENSE")
sha256sums=('a192eb4b861da4be525ee1d05bae407cbf560943bd4061eafd520914f044dc2c'
            'a05344ac5fb8bd5f7625997e9ed02703501bb0a626d3cfe0e9765c5a51833181'
            '1b5a67d8d07dea2d08184da3d4ab6f2c32051938e2b2753f417fb797f2e32e5f'
            '5921605d5898f217b774c481d5a8898da979717a1ea97e0e5ca47d86eb6d639b'
            '4efaaf035c5c15d06864df01578d6d587350b96867dd01677666e3b2ea7ff5a8')

package() {
    install -Dm745 $srcdir/nuclide "$pkgdir/usr/bin/nuclide"
    install -Dm644 $srcdir/nupm "$pkgdir/usr/bin/nupm"
    install -Dm644 $srcdir/nuclide.desktop "$pkgdir/usr/share/applications/nuclide.desktop"
    install -Dm644 $srcdir/nuclide.png "$pkgdir/usr/share/icons/nuclide.png"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
