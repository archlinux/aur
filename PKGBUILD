# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Sans serif font by Vernon Adams'
pkgname=ttf-muli
pkgver=3.000
pkgrel=2
arch=(any)
url=https://github.com/googlefonts/MuliFont
license=(custom:OFL)
_commit=580b05e1f2ad319cd98a8de03fd2da7b36677954
_dl_base_url="${url}/raw/${_commit}/fonts"
source=("${_dl_base_url}/Muli-Black.ttf"
        "${_dl_base_url}/Muli-BlackItalic.ttf"
        "${_dl_base_url}/Muli-Bold.ttf"
        "${_dl_base_url}/Muli-BoldItalic.ttf"
        "${_dl_base_url}/Muli-ExtraBold.ttf"
        "${_dl_base_url}/Muli-ExtraBoldItalic.ttf"
        "${_dl_base_url}/Muli-ExtraLight.ttf"
        "${_dl_base_url}/Muli-ExtraLightItalic.ttf"
        "${_dl_base_url}/Muli-Italic.ttf"
        "${_dl_base_url}/Muli-Light.ttf"
        "${_dl_base_url}/Muli-LightItalic.ttf"
        "${_dl_base_url}/Muli-Regular.ttf"
        "${_dl_base_url}/Muli-SemiBold.ttf"
        "${_dl_base_url}/Muli-SemiBoldItalic.ttf"
        "${_dl_base_url}/../OFL.txt")
sha512sums=('c63a1a9569fb9f960efcdd59add97411b027b507584d61e5861bdf867b6b000f3d57a89e30c3ab055f71ed3f7e03b29715e46c713a40e1aef5c3841f4b20fca7'
            'ab18b0bb06b23bebee69caccef94bc9d91c1d39648b5dd5c4cf63210b6df8f8d7f318f2c95266daabd2aaec5045c3dbb98b1162173e69616f57e6bd541f2f647'
            'befe26690bbd1039c8dbc9266b7fe8ec2f63cb0d976c3e44296156a748ee00821fc43d84ce6f0366cc22748125ea5d7ab887084e1e59c0a8621baedaaae4e517'
            '596291b8777abc067bf732e40c82741602955331e508788b99635701a080c34b924eaf3852452c87d65ad544496622e87157d6eae899b84d69b436b3c180271c'
            '2a23e141571ed628174fc29890e03517f435e63f64a16091248d19935e1c56f7274f41c5b7d34d8d01326493ec561cdb63036da11010424817863d9070348eee'
            '9e7360d026af067af95d55e43e25b610270579841244568217c47558c100767d41e00a85f1722c16343a4e96f7033963a26f67e1f8ebcaba47a9b00c75fb3320'
            'af5df5d932fc87a32a8434c3736cc12ae91fb93d3fdd8a8e1b739c8a9ffb5e271d134e5567edb159a99120767c32ff03a763bb7f4a17629fc8965c1821dd7f66'
            '729454c335c87e3ff744008ce45f6f1b0139e9b93af31a3f737ad3ffe0fa12f138d3b97a87fd3cfaa82c9d4b17a1813bf9dc98c95dbbc5bbbe511208141274f7'
            'af906a77366aed6b7b55b548b31cd8a8884b0240e6ec504bcb377368ee2eb1e656ac1d727fda75cd9018dcb53cd7a2230fb9f7dc00df353cf358d0e238b7969f'
            '6e680007e5fb73f0eeed04282afc84fe17ac3260542ae1a903b02c0ab4c37a5814331623cd8398abd1f4ecac34f0a641d837b7cc960c7b122e05675971718aaa'
            'd7ebc2496d752943dfb9118dbc626110861410bb267692fe2a403f76c87804391d0bc462bbfdf4d9be991da17ada682f1340ed5f043b6ec71ae668ca77ef72f2'
            'dc9818f326d0ff51bdc83b25250bf2c282e4592bd738df23bdccc65122b052998e3caae28f76702962373f4c5a3f60c1863fe855fecc4d23cfcb57630010554f'
            'dfd98d3570cc39d8dbeef7caa25ac195c717a44fb4bd0f91c1c8150171eced37a6b08d3c0ae5246f3d585f19770620d525a3a4340b937ece237da934629fefdc'
            '254f1988ab8e0d5abe008471db248814e3694581d69c7da21316bee727c68b2c426b8d7acb57b5cb3aa84d7269ff8fee040d04dfd8bb67863dada5790d95d4fc'
            'de158dd435e4a8ba4f4cac80314a5aae6ef9da2dd46d8ce2b29bc4de6af1e28d80ba121ce61ec623822dcb1a7cd1545d5118e6b8dcb8cf9b1a10ad411233f43c')

package () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}/" "${srcdir}"/*.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/OFL.txt"
}
