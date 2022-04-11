# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=otf-erbarre
pkgver=0.20210514
pkgrel=1
pkgdesc='Redrawing of the classic Erbar font, a geometric sans from 1922'
license=(custom:OFL)
arch=(any)
url=https://gitlab.constantvzw.org/osp/foundry.erbarre/
_commit=0fddbd69120c511d0da9fdc101dd04d3ad29b881
source=("${url}/-/raw/${_commit}/fonts/Erbarre.otf"
        "${url}/-/raw/${_commit}/fonts/Erbarre-Bold.otf"
        "${url}/-/raw/${_commit}/fonts/Erbarre-Oblique.otf"
        "${url}/-/raw/${_commit}/fonts/Erbarre-BoldOblique.otf")
b2sums=('c8a584a444790ea65b062ca36ca813fefcfd80349f3e9aca107a0b3cead527b2b93dfe43ab55936b450a29357d6ca8737caa48ea79ad76fad7e0bede40e58b1b'
        '6f1f131e532366daf98d8c64b8ad4cde7213741703ab4dad96cc245f746ddc6ddd95b3edc035c76c3d0d39a90cf5a4551768ed40826ac01890582bf9271d8833'
        '15e4de94af1c0e8fe8d5b6fa492ce26c59e098472b1499d3d62136b33e513af43c113f87eec7402d987f8b21322f0adef4045483565c52a726d59260de6635a6'
        'f721a426858b919847e5d3e9333b6d95b8cc87c363af3120f42542557018002f5690ed125b523be4ccf8c5f6a095cacc1b24f9fa9e5221abd7fdb5f12f3df9d3')

package () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.otf
}
