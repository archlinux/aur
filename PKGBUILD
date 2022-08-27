# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-asap
pkgver=3.001
pkgrel=2
pkgdesc='Contemporary sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/asap/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Asap/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Black.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-BlackItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Bold.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-BoldItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-ExtraBold.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-ExtraBoldItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-ExtraLight.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-ExtraLightItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Italic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Light.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-LightItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Medium.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-MediumItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Regular.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-SemiBold.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-SemiBoldItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Thin.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-ThinItalic.ttf')
sha256sums=('a6f4d778db0d2a87c2c6e560f71eb018b4253505b2f23c108724dea5d4d74ed0'
            '606d4766e113c139e15709c1f16b402ebc8de83efb34ccd8ae80d4dc73b555f3'
            '7a00bd04c2567804ee5d123f8a9c2921e165d2f84603108f3914040d090ac833'
            '75ff252587e3840a0fcbdf70dc9ac9faab5d94da707c0e87938b97c6834011dd'
            '04e6a6f00ad3a60ec533c173c95bab50e4813162e7570d7ec73cdb5d972f0e1e'
            '5f0d8b33df44bf63612ed79d44d4c5940037b37063b13f07eeeb3adc4e146379'
            '61b3b479fb5d28f9bbc700baa279b798ed9628af20122cfb587cbec95b7cf723'
            '8d01044ca622c7476bbd1f071eedc28b3f6b829c636b5c0545f7caf2763d3d20'
            '2e9a682123e4f27b371901d34b22f40db7d98994f1f2cbf686603eb8b9349409'
            'c5627bd6b0090de933ecd10a78d81aacf01f3f972b5273727409e10a2d15957b'
            'f173c2fa42238c7a7b11866a3d9f0cae81eaa42cd4247db045cfe8930ea91475'
            '99dc47d9e9c7f64e8b8c986bccef07933a13889b420f3a185525d47e4eda79f7'
            '93e95924efe561749d73d4e03888ee3a7682a74b009898a6c8168a97a7d832a1'
            '7226aa8c2a1caac85da9c2c885762a2bad4cd1ebae04f32550b70f58a9e102c0'
            '7ffedfdf0c1b5d887d80117d1eefdf28af5bd2eb457e1f915b82b689347fd621'
            'ba76cdce1b35005f212b1fb9f23556b994229a42bc21d7f233c2fff90a31da6a'
            '1172529041b57632845a4de94dc215ad1b3e3b1855ceb7fa02d579f8e46c2e12'
            '30a07b26d90763ca8c53de57ab095bd6ab7900f655876fcf7bc06c43ca26c124'
            'd49ee5d6d46ec216357295dec96f4e0b221cde4c1962f9d6c265c87c30723444')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
