# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ttf-nunito
pkgver=3.504
pkgrel=1
description='Sans serif font with rounded tips by Vernon Adams.'
arch=(any)
license=(custom:OFL)
url=https://github.com/googlefonts/nunito
_commit=6d8a4e1c00df8b361e59656eee7c2b458d663191
_dl_base_url="${url}/raw/${_commit}/fonts/TTF"
source=("${_dl_base_url}/Nunito-Black.ttf"
        "${_dl_base_url}/Nunito-BlackItalic.ttf"
        "${_dl_base_url}/Nunito-Bold.ttf"
        "${_dl_base_url}/Nunito-BoldItalic.ttf"
        "${_dl_base_url}/Nunito-ExtraBold.ttf"
        "${_dl_base_url}/Nunito-ExtraBoldItalic.ttf"
        "${_dl_base_url}/Nunito-ExtraLight.ttf"
        "${_dl_base_url}/Nunito-ExtraLightItalic.ttf"
        "${_dl_base_url}/Nunito-Italic.ttf"
        "${_dl_base_url}/Nunito-Light.ttf"
        "${_dl_base_url}/Nunito-LightItalic.ttf"
        "${_dl_base_url}/Nunito-Regular.ttf"
        "${_dl_base_url}/Nunito-SemiBold.ttf"
        "${_dl_base_url}/Nunito-SemiBoldItalic.ttf"
        "${_dl_base_url}/NunitoHeavy-Regular.ttf"
        "${_dl_base_url}/NunitoHeavy-Italic.ttf"
        "${url}/raw/master/OFL.txt")
sha512sums=('d379bd0b55e7f3b286ef3b647a2a53821e36403f1f4c6958a8c49c7df05b90e325bd4f0dc9dbe42dbb70794b77ed7b847ed29ca32ab6970ada8bb66a620e001b'
            'c8578b381205f5d95a1f1e64283106450c2f12cfb48903318aaf152ba001cb746f1b03f06fcd477f7d7622f57c9a533f9eecdff157645ce141b037d98acd3270'
            '0fd03e2ba0a1d1a665b0eb86c3818020c2aa8f4e2eb7df3b9f0744e4f2956d4e3c9eb5c4f1c3add09065c5f057510c4e3e773322f9de1d724351bda850cef7f6'
            '6f5e6780433033721268ffdeb25a02e8092f122d5afbec846645d428ade9e9eadeb9d0ac1e0ed4016c0ca6e5eed222b326c8afebff3cc0dce870ee1d2ccdaa3f'
            '42a8c09990795202f0f6961a82935fbf80ec7d6dbc6553c0d3ec7c9a37c6ba90fb91103c9bd246ff11974106f33ebe222abb4c77cd346da7da74b685410b3e86'
            '4101cc5986d7f189968215af5d0b20d51c8c324772d6285d7c1df951a923111f70f2ede9c76054d800d87542ed99cc5a0054eae279538513ac8bbf528ec5caf7'
            '3b825532c46637bc801675b53cb25efe494273deb3d77ffc81a74721f763cb395f2d2454898df40b02c1b0c76341a28822257a2946d84b7a6812018f92681c3a'
            'cf2aecf6c2f9469407990ea71d0b9cce8a828a27bc1a74b2e26bd59330a5166524a2e7a5ae2ffe3ac0c4daf2679d114f7f34d95aa38553c6aefaaae04960d507'
            'a7d89b1d0d68eb81d7554b44aeddf06a91143ff4180dfba5a2ffbc6c89aae59989b3ae3eea51f9b635d6d169164429327fffa1600e5fe9911da66f6704b9bee1'
            'bbf644cff8ef367b5d8b506ac0ae0c9a76c46d0865fedf59f47c9099428f50cf413477f08aedc00437a4e1693e324bfa190e60fc8fa09d2b8891e438cc227218'
            'd051b086afe6141c668739d555931d4ff0117680068d8409c01b6a88d27485ce880032679cf6fcdbffac1cc68cb7bf2e26d75e638596da940306418673f7e738'
            '6905bfbe7558ef9a69f85602e84cec97c34c82d6583ab7bc34d205678382806d2059ca9a1b6454b8fbeeacb3f63b7c96cd362cdb89877631abdb769bd6beca8d'
            '90bd04e273f4af3c9f7c6d0f0a9bb02678503413ec137d19cf7ad7c0431cfb83c11af8fe9325ddedcc3c2689aecc7b5200e42e84760b2fc258aa056a3f68b231'
            'cd6e457e0f425ba388a282422b5cf8f1267a9c2a2555366ad954223ac9870b6f25688386042c11a5835d04cf669d68dd4db37833620793a2dc4e04f8ceb0536e'
            '18f0a6ecf35d8899631cef34c16e6f5118d4b3b3a19f0d12c8465b9b15f95e7b0d2da32de2b49b82848063b27af0635f91c2ba599f04592f912dc3b3bac445db'
            'f05468b473c60f3b57b2d6325c2027ee8f33724aea9ee303374091d4d6c8d09e6e1f8a869f70ce9bd215f439c92def5e19b366736bd3e4289dfc455bf196ba36'
            '5efb2eff1222f2a1a89540b28d02e5b853b1342aa041e3f52f8c8843058387876f0937e5aa57b5dd12cf664708309dbc44c2e350651f1c0af53658024ff4aa2f')

package () {
        install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
        install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}"/OFL.txt
}
