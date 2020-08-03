# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=ttf-cheapskate
pkgver=2.0
pkgrel=19
pkgdesc='TTF Fonts by Dustin Norlander'
arch=('any')
url='https://dustinn.1001fonts.com'
license=('GPL')
source=("balker-$pkgver.zip::https://dl.1001fonts.com/balker.zip"
        "domestic-manners-$pkgver.zip::https://dl.1001fonts.com/domestic-manners.zip"
        "dustismo-$pkgver.zip::https://dl.1001fonts.com/dustismo.zip"
        "dustismo-roman-$pkgver.zip::https://dl.1001fonts.com/dustismo-roman.zip"
        "el-abogado-loco-$pkgver.zip::https://dl.1001fonts.com/el-abogado-loco.zip"
        "flatline-$pkgver.zip::https://dl.1001fonts.com/flatline.zip"
        "it-wasnt-me-$pkgver.zip::https://dl.1001fonts.com/it-wasnt-me.zip"
        "junkyard-$pkgver.zip::https://dl.1001fonts.com/junkyard.zip"
        "marked-fool-$pkgver.zip::https://dl.1001fonts.com/marked-fool.zip"
        "penguin-attack-$pkgver.zip::https://dl.1001fonts.com/penguin-attack.zip"
        "progenisis-$pkgver.zip::https://dl.1001fonts.com/progenisis.zip"
        "swift-$pkgver.zip::https://dl.1001fonts.com/swift.zip"
        "wargames-$pkgver.zip::https://dl.1001fonts.com/wargames.zip"
        "winks-$pkgver.zip::https://dl.1001fonts.com/winksfilled.zip")
sha256sums=('312725ab193db7391e86369e921c1ce33bafa44438efa811bafb16c5467b4a6f'
            '37889315813271fb86ab889e92ee7410675600b5a30e1d0ad3bb31d751699f22'
            'f1067ffe03c8aa923d8ee9e9413294662e5a1565e07e0fd1a702a1e879889cbb'
            '80c1f21d6335bb26e2ffd291e852fd981514c6380b64c66350c2b601389e288d'
            'd9d505c7ee11172d9a699ee0bba909157e09ee7d797f23bd7be5b8027a7347b4'
            'bf0647220c6d72435dc562df396a0f153c0757e8710ffd270ed6e09254296c89'
            '57ba64b2008532842b1be55720d94c0c96fa4810b63ac82e14ead92831d4f234'
            '3cc652f6dc01bd889cde821c48d7efb01d57809e933afade6d8e0f58612d089f'
            '03a369c4b67b19c5c87d117b1b6ea54e16fb875bf4e2176a366f885301574c2f'
            'fe6483ab359be783bbb935229600a215c23ce695d74844963c8ad71ba42a43df'
            '13fbd6ce6247e18ca0346958c623038b0f253927668e42f6a06a7d78eca20ef9'
            '36af4175ed68465336346a9163708444cac94c544b0a4908d8f5829aa7b198a5'
            'a6831085d81cfc7bf10a4367dd386d9e894b81c9efb1831afe03e58d6848db11'
            'df93aa00a5ad295c65ff1571cb16a280e92a774df79c518e9e0931ef4fb17718')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf *.TTF
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.txt
}
