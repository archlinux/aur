# Maintainer: Dani Rodríguez <dani@danirod.es>
pkgname=nordzy-icon-theme
pkgver=1.8.4
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
sha256sums=('9c00169d4968d1e7ab6302029543adcafff77dd73dfeffa51d72c4dffa2f26e7'
            '0555bc827ed124eb818def139fc623e948e56ba81e9fcb01e349a2807b4f0e34'
            '2e5a4e22d9321bbff3e9b89687c3c7a47c4d483fd8a06890f40045c2bcde0eee'
            '339c8d9b3c31e0d234a0c1b4346605f31b30ad0fd02bca05d71a6017855b6d9b'
            'da51fff1dced08c887505dd67d38d6e32ca0bb06d564d4ffc57b96f8f13cf215'
            '5aad729f1f0167ce0419f19d9e64535d95abe722352261fd88996075caac19ff'
            '3bb606e830a5cafebd2a2543b6f10753f361644822ddaf92525c8f880aee8499'
            'a7f6bbf625d9fef358b666fc5d1a26bc30288a69d6c3a9b25e9543ea0d50f5d2'
            '4bd48a0d4154e96a668555ff965168b8f3537f12fcb57fd82cf48b597b80db5b'
            'ddcac8e88d1eebcb1dc3792d4c4afba26bf56905c9895bab91fdae3011d8a4b6'
            '1f8d49a637736cddef2053e4366e409a2538a51823c73fbd25e87327017f29a7'
            '35b73208d7495637a6f0a35585fc1a04dd81453380d996af7ee491afb3f01974'
            '67df79f9bc749f87c1eec30ad9889f7ae1cb1e181e9e386d570ea2e2f7af599d'
            '4cbdfca4003a986e4717b776658bb5f73f66c73273100cf3e7d89eba17b5c130'
            '113977115e3318f3d6060efd418f2392f29722a5f901a89e13a3399dc6f8065d'
            '379203a940b6b3ece0108aff805977dad4bc52c226d89a8d4f0f3260dc590457'
            '46466335ea5b002fcb065ea4abfc7efb9f556b9b129e52a89def674bc34fc479'
            'fb40514f19de1a97f7a0ff1251066c45c2a8a9074877343d2adae1c3ed3ba94c')

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
