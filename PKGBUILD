# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-chivo
pkgver=2.002
pkgrel=1
pkgdesc='Neo-grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/chivo/'
license=('OFL')
_commit='384c6d3ad00f76be6f76f998a310335e3eb460a2'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-Black.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-BlackItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-ExtraBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-ExtraLight.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-ExtraLightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-LightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-SemiBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-Thin.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo/otf/Chivo-ThinItalic.otf")
sha256sums=('c9b69fa18c372df2b187b49efc57b1ea643b86a938e5af32f6b5a7af1017c891'
            '297c263e292b0e21c4c4b5241c7df727eaba04bb9e5a4bf01d76472b9b50ea15'
            '957f46fb261a829f980547d36d4df2b4a434eb53d195cddbc62787bb590cf40c'
            'dd13661132901083678d6ab6fc0f20b4eac9b2a3ea94ac35f1a6ac55e36e8e0c'
            '370cd473b98a0e0df71438d5eb48872d4830ff1fba94832e92cb55a5f9948a6d'
            'c8bdf59055a8e9f2c931a42c6db1d84db6eb7b0d6433ffd580e87b33efeb9936'
            '002c7edeba373633d851b61e58e0b0b783699d89d09b15e9eff0cba804b229dd'
            '014afdb881f676040d5dc96cb6e4ef6da2c95ba421f843421baa19fae6bd7526'
            'd0c55f7dab0de4d2cef2503aef63fd076f400201ddb88d9741873d3c83ee58da'
            '949a32a4e6cbcb2e7895950179c4fb1343f53f3adc9018aba4c9486d9a3a52ef'
            '37f100620e5ec3a0d57667ffeb98fda9731891732cb7f026d5edfe519ea030cf'
            '2b33f3bfaeae4fbc6e39d93e4e381afde7e8815b236a30cf1446607d9a6d2f5f'
            '74942ef894078eef5cef9e56353681064471bd3397df191d46727a25380bcb23'
            '3fdf457afb037454397d15445277ef2825cade6d63496ee09f250cc5d6278db7'
            'c61af23eaf33f6eddc228e74baba1a8b708e52ab880582b7b6e7cbcccea38bda'
            'd9f1813bdc929c3727e7cf08e33021b5fb87465aace9cb41040216bf199b1906'
            '274f7e35ab4ba0d85b771e5a14b661f97fb012a783fe6334173697fd5ea94ee4'
            '15238a6d95b678d34f7b1cc3d916d079e92e9660cf1177541e9bbeb8db28f7cb'
            '2bd5c871426761987d6377ee122ef04787bc29cac92b7795fb042ea9e0513a8c')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
