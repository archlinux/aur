# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ttf-muli
pkgver=2.0
pkgrel=2
description='Sans serif font by Vernon Adams'
arch=('any')
url='https://github.com/vernnobile/MuliFont/'
license=('custom:OFL')
_dl_base_url="https://github.com/vernnobile/MuliFont/raw/master/version-${pkgver}"
source=("${_dl_base_url}/roman/Muli-Bold.ttf"
        "${_dl_base_url}/roman/Muli-ExtraLight.ttf"
        "${_dl_base_url}/roman/Muli-Light.ttf"
        "${_dl_base_url}/roman/Muli-SemiBold.ttf"
        "${_dl_base_url}/roman/Muli.ttf"
        "${_dl_base_url}/italic/Muli-BoldItalic.ttf"
        "${_dl_base_url}/italic/Muli-ExtraLightItalic.ttf"
        "${_dl_base_url}/italic/Muli-Italic.ttf"
        "${_dl_base_url}/italic/Muli-LightItalic.ttf"
        "${_dl_base_url}/italic/Muli-Semi-BoldItalic.ttf"
        "${_dl_base_url}/OFL.txt")
sha512sums=('9775a3680531a7f1112b66bb417724d53511234fcea2fe78597d335c393e9f7307a20a5b011063f06a99c8e2428a5af20f34041a452fe7f9ea7f66736ac93b6c'
            'cfe97ac8e58b2ed08ed660cf4b3b96bb9fac232b8f61973c3f3b0c04e9325efd9d9f87cabca32ac9f08747ff85c1f63f4b69524395bf3bdf20873710c54b96fb'
            '2714b297848483675ccea6f7f08b2ae98d50f0402faad81ed82b36d4529f55f66cc25e6bcb62dc11094cf2d403c1d732ee7a25f45beff4cb07a1d39699358cbc'
            '234c6364ed719da10bbb3db05b5b35d3da5ff12dc562379546ce2dc8b18b4f4b2da5632c27c41e4e4a9a8769fde757cd83ccad5bcd8d1e60467f06734707e026'
            '7b105ea2d7f505435519444826958f064ab7d96583f8fa9a963b9285054452599b117957e4015e36125d749fc51863ac55341d04e0317d3d36f2d93e4c6607f9'
            '5f016fbffcecf0196ab8251d835fb3e1f3cc868c188dd1229d5b5a01370d5c796bb49b766307c239759d131ce361c6ddbab04cec78a355d8b3631d5300d2121d'
            '030fc87f9a754bc5e61edf5a45570cb6e3976e74359f9b912c94d3253c7c5dc6fc2a3a2607ef8c47fbd1146945be6579f7643313f63d891e15e5ba12e6b710f5'
            '749e7eb1a91b5cf7d667d7380c653116931d377ba100fa149a4fe93d4ed20b4d41153bafecd48f7e8992d1c2a161502a86a2dd0ba791b7318cdf65d985b49e91'
            '7416c5ced2cfca0e7652784e9324c69b8c7685390d3731d4dc527502251dd0c88a52757febba6a5a7a3c837a83299bdd48db6476acb555dee0b638a9d145e06f'
            '0e235f66e2961076b4dbc726638f414990d58e7b65acc42e03e36ebc791150e9a7969b628cf7def74c1a28c09b0a071c584755a8531d3b33182a01ebba8ce0a5'
            '6585a5b7141555914fc09c9601c4e517e1014935cab1d8815d55c876e81d4451a6568e021a9b0ac5d3ae68fc8df6b6b84d9d91e560bccfe0e06d7aacb69a040d')

package () {
	install -m755 -d "${pkgdir}/usr/share/fonts/ttf-muli/"
	install -m644 -t "${pkgdir}/usr/share/fonts/ttf-muli/" "${srcdir}"/*.ttf
	install -Dm644 "${srcdir}/OFL.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
