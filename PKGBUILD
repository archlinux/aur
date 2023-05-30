# Maintainer: Andreas Kurth <archlinux@akurth.net>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Contributor: Dmitry <dmitry@ykkz.de>

pkgname=ttf-exo-2
pkgver=2.001
pkgrel=1
pkgdesc='Exo 2 is a complete redrawing of Exo, a contemporary geometric sans serif typeface that tries to convey a technological/futuristic feeling while keeping an elegant design.'
arch=('any')
url='https://fonts.google.com/specimen/Exo+2'
license=('Open Font License')
depends=('fontconfig' 'xorg-fonts-encodings')

_commit='182060cd38adf3cde0d22add3f8009d30bd48cde'
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

sha512sums=('33127f19be117fcba84d6903820c9fbc8d54d5c4e7c1fa3923153e846ca2459ad31a6e009c92a24a0034f9cd819a523013fbbea7c1f9d49e3d7755b88805fd9b'
            'a7f619d3aa7a012f7dcc1a7070a006c1e55624d80e5cad52a67b07f9d1a917fb7a599c1cd71bad497cedf748cf0c6c8517bbfed72ef86a5d345f7ca27da4dc6d'
            'cda3fb3d0c12a69c38818f13adf90626f7b568a7f830100a878d949c0cefc6977d7b8b880d652aca2aed4ddaf49a4062cf05840b819365f0cba0ea7b0f872cb7'
            '8bf22f12785f0493d24ef9c4d6797dea589d9ef0d3d7fbeb0aab8aa4b49a8b84e98c4fe8235f92d07a4cd295f286afeb97a1805e3287d53de4b30ea4b2c2df4c'
            'eb45a4655c1ec57a8bf79ef8f4593472c3a16eb2609f60515901c27f1043ad1d3db2eff13a8f06fa3e90fc9863535f4448aa7cad60558151df9bc9e9b1d90a45'
            'cacf341bc8b4283edd7ff8be2c4bfea573f9406d26e947b60b07f85de6d9a3021ca7edcc880c4ed24b8d94eaf1c8053454d63d891fb3e12670a99b0a72341eda'
            '15655bbda49c7e02284cd3d35e908293eff5d9d7b528ba909072138eef714583fae9a688bb3be95a3497a1dac5d4587c2f495a5ed75e540a97cfd91ffc6960ce'
            'b892c1c82ac1e5306b0f66b5274f709c70caa6634b0d5487f68d37461ec0f1157c271f559abc3e41416f342e6485adaba6a760e7722b3f30c77ff438885cdb0c'
            '0a8aca915417262706ed5364c1c4b06216fe78948263c90979797871ef1663978b5bbf53aa21331992bffa7b6aa0f5738465da8f3764a2478a161704bcbe211d'
            'ee0468edcf17e5e0ad5e40f71a2deea63f8861aa684c71987b474fc1c441075487145ee84d1dbfd669c07210a58dee9c80a3314494b90345cff75d93c6da1593'
            '91c3e4b14cea8eefee95adb02dae27186687ecf53a425110a6f8c2e8a3595e77a3250ec6f2cea18f7c5acd546597383ddafcbd8b69ff39327a2d3b7b2053942b'
            '9aa46c421949aaaeab2d9a5dcfd4dd0aaec9f8739e308c4e3749de3b12ff48ecfc82fa6178b1f1120be324e451b5f826de31a04d29db4f301a8000b1acb49070'
            'bffb6a79d7b8ce59ff7a7f03c95238de95d05ffae7357fb01bfebaae23ec523f2f777352dd83da00e7944fe7ca09a7ffe2204587a282122987eea76db640ef21'
            '2474e705da3ce29ea2a5df6583fd10cdbb6f7346b2bf0c1cdfd247c396706803a53a35eb3dcbc6541cdae21a342fcaae6a3af89b332399e6948bfbb908799f1e'
            'c23da32eb5824ec48b46fb1bb52141233c48a6cb2c4e884fe74189fbad8a3289f7cc1424a43fa024b980b6b16f7c83a02f88384c6a82e7dbc6b02db77af01795'
            'dae4eb34777936cc3ac1f1a7b856c4032d3566bced0fb4c9ac31392990cc3d0794cf081215002a2418850ee462594b5602e8e9e3deb583f393d4e3aaa942bfb5'
            'b8fe550c0f2848e51159c265a5e7a71a65b3fbfb4fc1a3bf0abd0830c242bb089592209f2ac5648b34e1c880b3eef3695bc6b1a44caaa32a0b937387c6857f54'
            'f5258fc45826fc0630360be56abd4e654726bb6486daabbc904402d229b1e28953bc9a6d98b81a79b65dd1551250846af056b87232608c178ec976d17f6b946f')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
        install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
