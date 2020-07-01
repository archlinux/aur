# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=ttf-cheapskate
pkgver=2.0
pkgrel=16
pkgdesc='TTF Fonts by Dustin Norlander'
arch=('any')
url='https://www.fontspace.com/cheapskate-fonts'
license=('GPL')
source=("flatline-$pkgver.zip::https://www.fontspace.com/get/family/86xp"
        "wargames-$pkgver.zip::https://www.fontspace.com/get/family/64le"
        "dustismo-roman-$pkgver.zip::https://www.fontspace.com/get/family/jw14"
        "penguin-attack-$pkgver.zip::https://www.fontspace.com/get/family/djqr"
        "dustismo-$pkgver.zip::https://www.fontspace.com/get/family/l7zn"
        "it-wasnt-me-$pkgver.zip::https://www.fontspace.com/get/family/nn0q"
        "domestic-manners-$pkgver.zip::https://www.fontspace.com/get/family/z0gz"
        "balker-$pkgver.zip::https://www.fontspace.com/get/family/m07e"
        "junkyard-$pkgver.zip::https://www.fontspace.com/get/family/ozn0"
        "winks-$pkgver.zip::https://www.fontspace.com/get/family/96d1"
        "el-abogado-loco-$pkgver.zip::https://www.fontspace.com/get/family/pmzz"
        "marked-fool-$pkgver.zip::https://www.fontspace.com/get/family/xydl"
        "swift-$pkgver.zip::https://www.fontspace.com/get/family/ropq"
        "progenisis-$pkgver.zip::https://www.fontspace.com/get/family/g9w7")
sha256sums=('e8ff7f1bb0994dd630b087ce7042fffb6a42fae38734ebd99414c2181e019b1a'
            '2e832e695acd74c1fe05c72fcca365ae70e047c175a9eb65a0bb225e26608180'
            'b8fd523dc6ed992d4e5e9b9e257602c80c30a0f9beb2d74c04a6201af08d0ac8'
            '73b95bc66b2b9ab3d200a69d9c91b4eda72137c6b82a6b30e871cd7239e420f8'
            '1e440f5969fcdff398a6b09c40a1bde349d1c56e79ac4e06b110374860422871'
            '67a24e07a0708632fb9399efb35c9c3b43e49864b4a41d4b8fa39f2b11782160'
            '9744d5a215db2dc5ada295fcdc12118b88f5517fffccfdece92a227d70b1cbd6'
            'eda4cccb345a7dcc7318062421d640c18bc2f9e9340c6422f25c4773002660b1'
            'f22f37f5f95bdc43cdc2ffaa2cd167afd5fec4df7a33b58593fdab390991afb8'
            '2637ee4e2ccb354d14193b30ea90173b3e28528388b44935e0131413762d8be8'
            '3998696354eb8bc70ee880fb6688c44edc741bb29c9ed940deffd40d0393087b'
            '5e4afecf4733b60ec8c5a7b7f55ad6462d3bb3c39a1fac69f1dbd6e34dce08e5'
            '9cb2c87db001204293f25173025732830c2eb9f12d039d1d1b5f66c15bb55641'
            '612f5114c1f020bdd8efd6668a783d6f7f2e296a694b889967411789fdeba2cd')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" misc/license.txt
    cd "$pkgdir/usr/share/fonts/TTF/"
    for f in *.ttf; do mv $f ${f//-*/.ttf}; done
}
