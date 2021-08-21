# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dmitry <dmitry@ykkz.de>

pkgname=ttf-cuprum
pkgver=2.000
pkgrel=3
pkgdesc='A narrow grotesque font'
arch=('any')
url='https://fonts.google.com/specimen/Cuprum'
license=('OFL')
provides=('ttf-font')

_commit='98adc59dc00ca00dbde9eb42a23ace5f924b4f90'
_raw="https://github.com/alexeiva/cuprum/raw/${_commit}"

source=(
	"${_raw}/fonts/ttf/Cuprum-Bold.ttf"
	"${_raw}/fonts/ttf/Cuprum-BoldItalic.ttf"
	"${_raw}/fonts/ttf/Cuprum-Italic.ttf"
	"${_raw}/fonts/ttf/Cuprum-Regular.ttf"
	"$_raw/OFL.txt"
	"$_raw/AUTHORS.txt"
	"$_raw/TRADEMARKS.txt")

sha512sums=('4fafa7211387b009aaca9dea1a24a521be36257343e3e076d6dedb5793de92846ad4bb67e505a96695b8acb69e77821fb700c7483dd76eb8956a1df8da731557'
            '5e3aa97dfb53fb8f10d1b9d2437e67be1feb8b6e06d4cf6c49381ed1ee20fa29773ff7a547a5a51d0767d2388ef9a9263424b62ec8daa86192280333882770fc'
            'd3ce71af76a0dd7f6c8d2806482abdf798869a854b3e50d3f442e42594936412bb45ef84ee10be520320e201939ca49030edd3ce2e89175abe34ab28395fb9ee'
            '9aed3145b6fa1d3d1574b8037f6f71d7e5ce16077cb9f6cd50ffef56572cc0a2b5baf7ba0383552a55d1e74225b4d64f8dd5cab2549559f5ef7b1c9190c6abe6'
            '26d4cb4b13fcfecfe9bf75a83bc3e00f96e08c9b68fcd8d2bfa689359923c0d7580b8be08e687cdc7305d5d8ce1d228941f62a330240f01a6d6f2bd5f664f5c2'
            'b721bad0cc0af7d5b080e84de0e03a1b0921326100cb98ab827a2f01391e7ec7a1ca68600ac0951db37ef121376597cef928a9b40352e60f3eab6d565cbed7e5'
            '3a5dacd7c89bfc418e458598be40334cb532e4a06bc917728e18e038b3be97b0142bd9ddc5a49d51ede3a1241d47b12f05b1ce7e1a70db02776a8143fb32b347')

package() {
	install -Dm 644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm 644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 AUTHORS.txt TRADEMARKS.txt -t "$pkgdir/usr/share/doc/$pkgname/"
}
