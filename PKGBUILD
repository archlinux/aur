# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=ttf-inria-font
pkgdesc='Type family designed for communication of Inria'
pkgname=(ttf-inria-sans ttf-inria-serif)
pkgver=1.200
# Commit identifier which corresponds to the version tag
_commit=9b015af5d8ab574b6afeffd324443bfcbf77e300
pkgrel=1
url=https://github.com/BlackFoundryCom/InriaFonts
arch=(any)
license=(custom:OFL)
source=(
	"${url}/raw/${_commit}/LICENSE.txt"
	"${url}/raw/${_commit}/fonts/InriaSans/TTF/InriaSans-Bold.ttf"
	"${url}/raw/${_commit}/fonts/InriaSans/TTF/InriaSans-BoldItalic.ttf"
	"${url}/raw/${_commit}/fonts/InriaSans/TTF/InriaSans-Italic.ttf"
	"${url}/raw/${_commit}/fonts/InriaSans/TTF/InriaSans-Light.ttf"
	"${url}/raw/${_commit}/fonts/InriaSans/TTF/InriaSans-LightItalic.ttf"
	"${url}/raw/${_commit}/fonts/InriaSans/TTF/InriaSans-Regular.ttf"
	"${url}/raw/${_commit}/fonts/InriaSerif/TTF/InriaSerif-Bold.ttf"
	"${url}/raw/${_commit}/fonts/InriaSerif/TTF/InriaSerif-BoldItalic.ttf"
	"${url}/raw/${_commit}/fonts/InriaSerif/TTF/InriaSerif-Italic.ttf"
	"${url}/raw/${_commit}/fonts/InriaSerif/TTF/InriaSerif-Light.ttf"
	"${url}/raw/${_commit}/fonts/InriaSerif/TTF/InriaSerif-LightItalic.ttf"
	"${url}/raw/${_commit}/fonts/InriaSerif/TTF/InriaSerif-Regular.ttf"
)
sha512sums=('a8cc7c8488e7b8b4d1e7967a4bb4006577bbcb1ccfc1164de6e7dec4b64c18c640923e349c253b21ff59eff0dc51c5c69ca6776518c93db1188dd16d17c7f3c7'
            '6a649febfbb16558123882d56e5c1afc2fb76931fe46d7fa7b1f3ca65c74b393797bc56cd47d563b61187852667575bf2525beb585a7f4428c94f32a74d95bfc'
            '75702043d40674b17a273ce4fa6c32da04e92284764396afc97589656fac6e866b21302bbd439afc0f3b7923fff8fee62b26c2bed993ade1b9e1fc6b731087f7'
            '4c8bc91e6e7f59e1ddca44717a4e532df266da4ad33c1b2b30da30f8908b1da9af1f1c4157f1503f1288c4486c6cb3d21e6af7f0ad4f6773a498a86bc9f17343'
            'f7b940b72bcd5b789f389026d1a55493c5a7772087f06f97f28c0b71fb1683ce27b808a93394492d02562e0b7f736be3cd5dcd7ecff31c1c5ab5c254e6748ded'
            '09f9721a567a786a6e4fd65ed9349730dcf27d9634483b413e1454f3f773354303e09c103f81bace7521d57740e8f66f81f7385f00acdd05ecf6a9716afe235b'
            '783cdaf9426f4f0a45037b3c03b36017b67aba70fe10e333e1a24537b8536408cc08439a61d268e4f3adf61d651d26a958d7ea44ad293560341263322e39e6b4'
            'f162a6316448ce739e7ecacaf5f51a761e48037ff01c054f3bcb8a1f41122837f90f8118d06805b97210f7c691609ca2dc17c23afa1e1b488d9e7f9e17c8149c'
            '4637579b3f384edeb13192e0c8881a23337a5772cd55a015e92501b636491e0c9a56858fb3b41a3efc31cb11a4ee50e5bdd87646b830d3541cffa2686b5fbd33'
            'b5e705dac859ad75975dcb4fb89e887e6f124146a8105c601944b0fe26cdc0a4f3edc8fc59eccc3c780b4312de5c9ec6c217ac4db4a6b0b21e675e67b15629c9'
            'a828aa9e5794ca83decc761338fefc8d073de181cbc25438463461db0b6f0e71f3cf0a636d387a2f55c1846454f1aed36c81af428f224705e7468df63efb00b5'
            '1d57c70c43b7622124593d8624ebbbb2f29327628ab195221da62e9aa711235ee5cd8990b2d73661ffd0c95093f5276401bc798ce2c167727dcdd50ad7169350'
            '9c58cfcb0352267000cc397809d288792b1ed87d047fbe5fbb0af56da305681fa655a29b0ef7bf049b62ac50cc5d8c086e927298c38cdaa6e23a53313e2c6a66')

build () {
	:
}

_package_common () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/$1-*.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
}

package_ttf-inria-sans () {
	_package_common InriaSans
}

package_ttf-inria-serif () {
	_package_common InriaSerif
}
