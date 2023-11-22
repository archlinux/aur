# Maintainer: Dani Rodríguez <dani@danirod.es>
pkgname=nordzy-icon-theme
pkgver=1.8.6
pkgrel=1
epoch=
pkgdesc="Nordzy is a free and open source icon theme for Linux desktops using the Nord color palette from Arctic Ice Studio and based on WhiteSur and Numix Icon Theme."
arch=('any')
url="https://github.com/alvatip/Nordzy-icon"
license=('GPL')
depends=('hicolor-icon-theme')
conflicts=("$pkgname-git")
options=('!strip')

source=(
	"Nordzy-cyan-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-cyan-dark.tar.gz"
	"Nordzy-cyan-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-cyan.tar.gz"
	"Nordzy-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-dark.tar.gz"
	"Nordzy-green-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-green-dark.tar.gz"
	"Nordzy-green-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-green.tar.gz"
	"Nordzy-orange-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-orange-dark.tar.gz"
	"Nordzy-orange-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-orange.tar.gz"
	"Nordzy-pink-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-pink-dark.tar.gz"
	"Nordzy-pink-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-pink.tar.gz"
	"Nordzy-purple-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-purple-dark.tar.gz"
	"Nordzy-purple-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-purple.tar.gz"
	"Nordzy-red-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-red-dark.tar.gz"
	"Nordzy-red-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-red.tar.gz"
	"Nordzy-turquoise-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-turquoise-dark.tar.gz"
	"Nordzy-turquoise-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-turquoise.tar.gz"
	"Nordzy-yellow-dark-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-yellow-dark.tar.gz"
	"Nordzy-yellow-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy-yellow.tar.gz"
	"Nordzy-$pkgver.tar.gz::$url/releases/download/$pkgver/Nordzy.tar.gz"
)
sha256sums=('0840d3983cda6aa55c0cdfa0efe42eb8231f4ecba7ba888095bd0720a906289a'
            '7fb412f6f8d526339801b237c3261a857edf374611784085310371085a110c1a'
            '19a09f4fb7c8b99559888bb0034f25ca2c8e0ddc7884723c17335ed78ca80b82'
            'd52576ce511dee644be514f66e6cff388d8b4cbb8e6e2d2b1a9a4e9b7b14d03d'
            '7aebf174146b39a6a4a22a48f206e06ab36c5f719caccb9dd4e402de4dd977c3'
            '6a82fb7edc7c19350320a389e3af6c1e176b03981a94e009eff20b18c1d68d95'
            'a79a8512617051647d7badd4d2e9b99b6c63780b9c64df58478a5a0d99d97120'
            '48addafb10b0f787a05777041ab0d788c0ff07eddc4603d0f71f411b56efabd7'
            'b963ede470aa32a9e14ac340c95c3f246567272fda0ff0d6cfead946a2cc1b8b'
            '7468384c1a68c4ba02346189403a313644e16553b1d267f16a627b16a0dc180c'
            'e9ca040d9bea1b49437e924bfcebf150e1e339363a52bc4ba26e1702f3415626'
            '15db197fc90709d1327ffca76212f2c0c69c7ca427b7b92871db516ed873e83e'
            '2ad3551a69988102deef1a3b1d494ae6ed97875fbbff58d973f0ca9c52016a7e'
            '852457ae0facffaf3597ab2060c4537b3f81c52022196f8bd382b0fe650d2213'
            'ede34bfcfe1b812ba342deeffc1b08bb5d87edccf7d8d69079df11b33dc076c8'
            '33ccb54508c5ac299e01d7b2639f61ac30d28a19f983f2cbacff51d2ff1d101a'
            'fb0101ffc46838730cb0f6000bffc18f2ee69377e50d6567c2f93eda4da46dc2'
            'fabc1a61ac229981231bb2c0ee4731c84d9efef3da475fa37f61be1ed19f9579')

_package_icon_theme() {
	local _name="$1"
	cd "${srcdir}/${_name}"
	install -d -m755 "${pkgdir}/usr/share/icons/${_name}"
	cp -a --no-preserve=ownership . "${pkgdir}/usr/share/icons/${_name}"
}

package() {
	_package_icon_theme Nordzy-dark
	_package_icon_theme Nordzy-green
	_package_icon_theme Nordzy-green-dark
	_package_icon_theme Nordzy-turquoise-dark
	_package_icon_theme Nordzy-orange-dark
	_package_icon_theme Nordzy-pink
	_package_icon_theme Nordzy-pink-dark
	_package_icon_theme Nordzy-cyan
	_package_icon_theme Nordzy-yellow
	_package_icon_theme Nordzy-red-dark
	_package_icon_theme Nordzy-red
	_package_icon_theme Nordzy-purple
	_package_icon_theme Nordzy-purple-dark
	_package_icon_theme Nordzy
	_package_icon_theme Nordzy-orange
	_package_icon_theme Nordzy-yellow-dark
	_package_icon_theme Nordzy-cyan-dark
	_package_icon_theme Nordzy-turquoise
}
