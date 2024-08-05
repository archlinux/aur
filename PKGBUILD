# Maintainer: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Adrian Perez de Castro <aperez at igalia dot com>

pkgname=ttf-clear-sans
pkgver=1.00
pkgrel=4
pkgdesc="A versatile OpenType font for screen, print and Web"
arch=('any')
url=https://github.com/intel/clear-sans
license=(Apache-2.0)
_commit=cc22e43fc739fba9782f5e0fcd665a4933d2ba45
_dl_url=https://github.com/intel/clear-sans/raw/cc22e43fc739fba9782f5e0fcd665a4933d2ba45/TTF
source=("$_dl_url/ClearSans-Bold.ttf"
        "$_dl_url/ClearSans-BoldItalic.ttf"
		"$_dl_url/ClearSans-Italic.ttf"
		"$_dl_url/ClearSans-Light.ttf"
		"$_dl_url/ClearSans-Medium.ttf"
		"$_dl_url/ClearSans-MediumItalic.ttf"
		"$_dl_url/ClearSans-Regular.ttf"
		"$_dl_url/ClearSans-Thin.ttf")
b2sums=('6726a5386ea7a1e4abefe6fc36777f73efa73cd15edc6ef556695b7f2beadb3aba2a2180a3173c81607b81c6f2255fe872c8627e114af868ff7239496695f57b'
        '2b3983a784312c347bfd99eca5c4ef9f1b7c2c4d00d0313746cd4dde4623838988be949c853f62f3512177cdc4040d30b6c6b8adac5a1e1563fb1d096268d27b'
        '735af374a4c2bdb2e4e5ab6d817f2ad76075bbec8e068ccc88af06cbb1e04261e79080092d69f05db55362c1bb4b034c892995d9dac086691f0e112b9f1a35a5'
        'bda291c2bd46523e1c9442294837acb3666212346cb1cf5426f837b902398317ca20fee84c078d69e8912d7fec8e3e050afe213a88420589c25dd1a7503e2ad8'
        'fe5873eef96bffd07c62e8066c403b4995b5d2f43f6becbc43439dbcf70d4fb662f837718284c05da87dae8ea98a74d6c07233d12e5babecae21bcc2aa0a7b6c'
        'ee0e8f48bb9e08a55933166028379f94d2619696845782c986d02b45e6b3e8a81cdc9383f5127c5bc5586cdd331d6bd4ad0900e00ca5d89c5f76146a22885b2d'
        'a01c6d59f13da7ee9bb0d43b4d4dbb4f0c2b0e6f395bf662aa5e1d9b015a302d046d57f2795208c1ee2f4d64147c85b85126761abfff6bd4e94e39dd7236a42d'
        'ee582033b41786e0f809532b4939a6f65fb6bf0f04a43d62efcc7878bf0f76c1773f49c1c3cd11c9ff5af2751bbe35709f6c334ea11e9f4be6b4fa933a807bb7')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 ClearSans-*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
