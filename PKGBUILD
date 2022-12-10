# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ttf-tt2020
pkgdesc='Advanced, hyperrealistic, multilingual typewriter font'
pkgver=0.2
pkgrel=1
license=(OFL)
url=https://copypaste.wtf/TT2020
arch=(any)
source=(
	"${url}/dist/TT2020Base-Regular.ttf"
	"${url}/dist/TT2020Base-Italic.ttf"
	"${url}/dist/TT2020StyleB-Regular.ttf"
	"${url}/dist/TT2020StyleB-Italic.ttf"
	"${url}/dist/TT2020StyleD-Regular.ttf"
	"${url}/dist/TT2020StyleD-Italic.ttf"
	"${url}/dist/TT2020StyleE-Regular.ttf"
	"${url}/dist/TT2020StyleE-Italic.ttf"
	"${url}/dist/TT2020StyleF-Regular.ttf"
	"${url}/dist/TT2020StyleG-Regular.ttf"
)
sha512sums=('c268d68af953e108d256879a3d321d04e12b99389f7c563b7b5a522e0e959b14faa88a2e6e728a77841be07eb73a183d6f79fafa4852cd4be9e8ca71f2f6f738'
            'dd6cafd9251dbd63c88b9dd08530ac73091b826e06355147521aba2eb18f9309089e00d2edf44f8de46086679682f4b6a9e6ab7a20d0d5316ff8f10f8eb57baa'
            '0b8ff7a51fd3e9455bbc03dc19a60ab9ce9675bdebc0ed345c7ce55ad531cf97c3459d4475c021996a345251fa4f976ad112c109f11031cddf55e37dc0e80b77'
            '3aee6706dec1a01879475140f1f9147607937ab5c4b3d5ecf88197d53c3cdcbf80b3a46f01d5fcfb3fcabea1aa4125e6a41bec319e7ba3c51be79a812c027fa3'
            '323dc0d81a3192eaadb8222df05b84ad2c3e88e42a4cbf724cc7dbc155ffc72847c5211d73b8223d08ee59799e9bcd3dc11dcb291cf0f76a48f8cb038a5ea1fe'
            '79d6ccbb727913517f0c46f872187a79ebce3b58ba4eb4807fcb1b271373d186fb6c1ffc437b20147868ec51526e9fed347345c3969d8011abf9eaae57aa17c4'
            '6af5153ecb50afe7dd58e6bfd814145dae5d74691ecc4105e14defed1177c82087cbeea370737d28e6ba974e871f5b25ec12033d81339a72f7348121b63fd8d8'
            '0930efd15fad9085670afe6b7b8a6874113c6060282875702150499cf808c813ad22e788b663ab0d9cdc2c9166569bf8a4b87ee07c904d32b114d289986b014f'
            '2178b4faff3d82f69c7d8d95d482ccee07df1e795f6164aff234229c0a5577e7125afa768ede2cbf81021491b7fb69a342f38c3339f658e5edd7bf97123cc2e1'
            'b37820ede91af96f25b46af0a231c5cae98bd095d00b637d8578eea87cf6e043c8892e5c0baa83cb3ff4b4d6452bbaf25fcf5ce1f309bbd1223ef9f2eb71ed9a')

package () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/tt2020" "${srcdir}"/*.ttf
}
