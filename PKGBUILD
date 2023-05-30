# Maintainer: Andreas Kurth <archlinux@akurth.net>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Contributor: Dmitry <dmitry@ykkz.de>

pkgname=ttf-exo-2
pkgver=2.000
pkgrel=1
pkgdesc='Exo 2 is a complete redrawing of Exo, a contemporary geometric sans serif typeface that tries to convey a technological/futuristic feeling while keeping an elegant design.'
arch=('any')
url='https://fonts.google.com/specimen/Exo+2'
license=('Open Font License')
depends=('fontconfig' 'xorg-fonts-encodings')

_commit='6ce85fdb06fc174d485ad70a15afbcbf23ff2b53'
_raw="https://github.com/NDISCOVER/Exo-2.0/raw/${_commit}/fonts/ttf"

source=(
        "${_raw}/Exo2-Black.ttf"
        "${_raw}/Exo2-BlackItalic.ttf"
        "${_raw}/Exo2-Bold.ttf"
        "${_raw}/Exo2-BoldItalic.ttf"
        "${_raw}/Exo2-ExtraBold.ttf"
        "${_raw}/Exo2-ExtraBoldItalic.ttf"
        "${_raw}/Exo2-ExtraLight.ttf"
        "${_raw}/Exo2-ExtraLightItalic.ttf"
        "${_raw}/Exo2-Italic.ttf"
        "${_raw}/Exo2-Light.ttf"
        "${_raw}/Exo2-LightItalic.ttf"
        "${_raw}/Exo2-Medium.ttf"
        "${_raw}/Exo2-MediumItalic.ttf"
        "${_raw}/Exo2-Regular.ttf"
        "${_raw}/Exo2-SemiBold.ttf"
        "${_raw}/Exo2-SemiBoldItalic.ttf"
        "${_raw}/Exo2-Thin.ttf"
        "${_raw}/Exo2-ThinItalic.ttf"
       )

sha512sums=('399fbfb71705a2c41d67652199e80999ff99f11694efe8a96b66b8caee5076b6848670af4d3fe058f0e988544037178cfc667ec9733b3922e0f10722526c57b0'
            '68a494bf1322aed6505e471dc61ed057e1e07072814953d3ffb2a17f7ca93eff8fe0c74034539735a1d23df8e7f0a0448aab240e650836d286888abbc83bc7e1'
            'f92d9ff5855b47a46e8935edff2a00acc049294f4a6ca45df15f4e10ff961f60f5e3dc07c44b163402c38478c272cda04ee4f5293eeff56be11f6041c3860bd2'
            '1be31cd38f80452548fb6811113d4ab4620654abda8d01f03ddd521c31ac8be2209531fd58648f4ef04fb319a237cd8da1ce95188d2688c2242525547db81f21'
            '0209820033cd9a6239ed84034ea453a5e6977d3fdcde1a2dcc267199473dc579e2f67e76f55d9474ba0f0ac3771ed180962655b4fac14a6aaa7d8ebbfc1c69df'
            '4e971404786bd4f069ce4cae8c15e57016926d295180353db186d437f8abb2d293090585f69372dc865e13f2cad5785c37bb7a2433e77e5f35fbdd2a129fa4f0'
            '73b5d3de6205ab613c1f89e1287b8f0d2e5c456c64a644bad1564c757c5603e9a553345e8a286f0e6d1f6346875c551c871b0dd8e32b0673f279ebd2d429d915'
            '374bfb0fed345da1204da7b06220708f0abcaa09c934f50ceec0e5c2dfb63bdb1bf2a04f4d6fd5f36c908fa53dab0275353b937601e85e513596d060ff831b33'
            'bc58b8dd0a91f1c6d5ae8e4c25325c63dc1ffda5235e9e4a6c1eaa46632b841e239ab2de53d4d48906beb3891b3814bced5ee133fe3fb10f446d58e0e574dc3f'
            'f2859cd52c334c2bd690b717cca142287a019f46394195b26c70afa7b8dcdf3a736166c2062f9c264fbb76822f9992023c85f32fe5f47667dc9efefcd77aa8ec'
            '9ef7ade79892e5a7924af832c8ea588807fbdae0e5eb01190f402e0f0408df120817039cf4a556cd621fccbd8c15abfd0fa7c904d8ce1b3d600f681431f51a97'
            'aaa285d2dc200ea79a846c510b29c6320b9f09f8b0e00427de365da471b337f7a600e57084f51412f00ea0cd1ebf9a79694949a57b8757995e887b7ee69fcb5f'
            'eae371dd1e7313fa2b8ef09ef3cb099b11ef156df1d4ec1b2c864b070c44925e875cd5136aec699b417cb86c129a5d5fd1c3dd397fa255fc71bc7f57747fea73'
            'e39ccc5db52f2f0b30d68e372d82c0b940259d9289d7a8cb0808ffe5e1d749fe501489dedb96bcfbd106c93391551961d3522bce2bc45d837bae3766a19f8761'
            'e1da92afcc369cddc2038604049b86a2e921441634dceabcc8979d5cae2b26d0483b22050b6b81d2bdd69990b3c8a391594d3546e6d36957f412591a0f295912'
            'e418febf4113c99b19fa8ed4ecd0ce068d77f93ce4e83285d2039217c809f2062a4c7e3fa5308af5f603aa0b62f7a78785338c2ab6dacdc24e49f2ced0278ac0'
            '4664fd4ec2353355196657c33c984c04decb4e5287cd5f1f17edb9d43e38e491cf2ecabc9ba7ae459e78855937aab70732aa22c2eafc892f73ddf5bceb6d55f6'
            'd6c494966ed45780876e15f4dbff7a393cc026683917906c0fbcaaec34c9e61b3217561fdc87d1510598bf0f50ee4caa74af5fc1315a3a67c55eb426a9222976')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
        install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
