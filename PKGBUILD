# Maintainer: Dani Rodríguez <dani@danirod.es>
pkgname=nordzy-icon-theme
pkgver=1.8.5
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
sha256sums=('968a3713908d2381d6cd70d8d7686026d9ed68a21f3413dbdc3c369b16673050'
            'edfcd9ddded2f9c1a5f3f32ac22e268b75531f8aa5668e7b9da58bc0aedb8b8e'
            '4175591ec40b6f40b0e466142a3d435cdc897dd47cf02044b62c3fc7ab3b60c2'
            '4205ce45948fc7c85c077d512acbb8502854b7a25e21dfbad12bb84be1828b99'
            '50e0f3877a3d184d1dc6e7ef40ee7ab9e0e8863fc11ccd3be419e7e5db10c81f'
            'b6a5985b4412ca1454ea40eaee32ff85cb368329452b07331bcd5201ff1d4771'
            '01da903d125d61464bcd968d1e94e8193dfed61e45212c6b68ba06db8b623ba2'
            'fd478a9cc5d1ca4b0b5fa2f068a79169aa085a10a80cb0a7a1a8f40019a97e08'
            '11583f636112987664a3e8c33d4c74ce2f34d4c3d6dd74ea9732b8fbfb0aba9a'
            'ecefdceb685ca4d523582e0499f29e78ea1b4bc5bbe4dc25db4957c7f0ccde9e'
            '331e6dcad321538410913aca7d01e42ba300dfa8fa95023ec07880ba81469eb3'
            '8672993d550ee401e0f0ea859b4906fe537b59720d97f6a2c280d36f1caba462'
            '7567b278968fb61a1f69248b48fcc4ff4fa1a67dd41e6f86e1978ffb0b16b56a'
            'e6e1c300d7bf12e910d511e0429a08761e641df642a1a02d24428da70eeef786'
            '67d289116841df144589a900f4308c6a68ffd5623d80d4d88e100c65c3d5d409'
            'dbe4e324ff781ffc84e718f0021e98c9d0e6722a3cc4ab4e7f36d5ab13462a80'
            '82fd5e3b582e9584f54c4db1ebd31b660c8beb781fc40f8b8dd1c2daaa0a106b'
            '0959313834a942aa6e9ba9267ce3d0ae6b07ed571378263e7a15fb9b1f8d9e91')

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
