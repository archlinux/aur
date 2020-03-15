# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=ttf-cheapskate
pkgver=2.0
pkgrel=15
pkgdesc='TTF Fonts by Dustin Norlander'
arch=('any')
url='https://www.fontspace.com/cheapskate-fonts'
license=('GPL')
source=("flatline.zip::http://dl1.fontspace.com/download.ashx?guid=737c92701c004c299434e9aa9fef66d6&name=cheapskate-fonts_flatline.zip"
        "wargames.zip::http://dl1.fontspace.com/download.ashx?guid=a67b4a43c3574b1f8e57037a86c2c586&name=cheapskate-fonts_wargames.zip"
        "dustismo-roman.zip::http://dl1.fontspace.com/download.ashx?guid=c6cfddf7450b4ea0a9693d662d0cf4f8&name=cheapskate-fonts_dustismo-roman.zip"
        "penguin-attack.zip::http://dl1.fontspace.com/download.ashx?guid=89e34341b643467aa150136e49574970&name=cheapskate-fonts_penguin-attack.zip"
        "dustismo.zip::http://dl1.fontspace.com/download.ashx?guid=9b89daa27a6049c8940a8d0bd4c2f8a1&name=cheapskate-fonts_dustismo.zip"
        "it-wasnt-me.zip::http://dl1.fontspace.com/download.ashx?guid=14582c6c73514438806349b26e372f0d&name=cheapskate-fonts_it-wasnt-me.zip"
        "domestic-manners.zip::http://dl1.fontspace.com/download.ashx?guid=8903789762af40a19ab05a69b7f37c9b&name=cheapskate-fonts_domestic-manners.zip"
        "balker.zip::http://dl1.fontspace.com/download.ashx?guid=7745ab9662154f03b0a8b2839b1993ff&name=cheapskate-fonts_balker.zip"
        "junkyard.zip::http://dl1.fontspace.com/download.ashx?guid=eb3650475aec40f4913b151b2d97eefc&name=cheapskate-fonts_junkyard.zip"
        "winks.zip::http://dl1.fontspace.com/download.ashx?guid=a85c6af870f74f2ab2dfcccd5a1a9962&name=cheapskate-fonts_winks.zip"
        "el-abogado-loco.zip::http://dl1.fontspace.com/download.ashx?guid=d545f98dd472458db69dddc08be57b67&name=cheapskate-fonts_el-abogado-loco.zip"
        "marked-fool.zip::http://dl1.fontspace.com/download.ashx?guid=7574e646010c437f9be745bc43e0805b&name=cheapskate-fonts_marked-fool.zip"
        "swift.zip::http://dl1.fontspace.com/download.ashx?guid=776e156541984416a416241a973d22c4&name=cheapskate-fonts_swift.zip"
        "progenisis.zip::http://dl1.fontspace.com/download.ashx?guid=54468611c8614b00a0c45f07e794f845&name=cheapskate-fonts_progenisis.zip")
sha256sums=('29b3c243d50590a4af614a433cbf99f67538042f31278ce6fa8828ae53c62657'
            'd87365b90e2a4f6fa818ef7f6df921eaf306399064994e1f1c167b310ebcb18a'
            'd44bdd7b2ba07e398a3c216b315a8d7753af9fec5febfc7a3b667ea17379fc4d'
            'e6b6a490fd75513bc8d7b8cc0e5468b0c574aaff1801f45b8b67caa72dce9795'
            '93a3429649e739470b46b3cb674a10e427358874a0eac2ab568a5c99dbed5641'
            'f07ff39d4af3185c8be2a321c00e3c3132a230be1aff75501f3e33570d94b62b'
            'baaf374cbc3a62f1659929c2f5e188e80c97e6530241f0667c78fa7cca99ac6c'
            '3e6c881b6d7693087d517a359b22c994abe615dc86bead983f96a87ce78673c4'
            '5cd859b3673fa5aa53e09c3c5ac0d98c6746ff2f008edc0bd4081020076c12a0'
            '87cf485c0e19c5bda683044ba9f394d390b3c7eef6abb019c42246eef713843a'
            'afadefecf89fdba6a2dadd6c509e44e72312fe8932001d965db5eab67be0a488'
            'af6a7961cefd4c7f5a75f27545d5a5a0495c60a57f36517185d850d4bdba3e81'
            '4c082352602558aa354577bf725fa415f1c13441bb591ae4a3ee25a4b922f92e'
            '323d3cec2984f7792afaac87234d161b75e14ebacc7529a182c4c287d26b27be')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.txt
}
