# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-mocha
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Mocha'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-mocha-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-mocha-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-mocha-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-mocha-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-mocha-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-mocha-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-mocha-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-mocha-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-mocha-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-mocha-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-mocha-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-mocha-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-mocha-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-mocha-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-mocha-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-mocha-yellow-cursors.zip"
)

sha256sums=('2e60daecb6c01330e850b7b736479f2591101a7e679cf0150b816329b1cdb478'
            'b06b0ab9fe2ebba8d265a7e0ea292e279cf4236f89c216c1eb074aeb5a26d8dd'
            'ff9fe54cf55c31453bdddff03f05d5c08df2bd99981ff677d77ff66f101f6fe2'
            '821e730fbcd2a2f9d531e8930857501c28f9943f11aec13b3d520591a2cec096'
            'a8ddfd750a01b0fed484f4cb39cbfc03560ac4481d2cc256c51ca84a1e4d025c'
            '0a34f6698f722b48390fe59851e947dbfda66ffb6f6f926cf2d990f19eeae4b5'
            'fee0bf5fd6780a080bf8918866a102178e182d9fa3171b06801a8c8fc5705a47'
            'bd958eacd0f3f775df91f673a7c08023ceabdcf82973d1af96d67f637dbdbc2e'
            'bcfd825ef83f57b04ca711ae189b8d8e898c75a1d462b20cf6149c987a4d4c0b'
            '7d9364c71d45e2d5f5c1cffcb2255fd6e456583e948140c53890834c5fdb8127'
            '057b29d54a4e4ca0c6fdf294399df18ea425bf28936bc829d71cf7f6d15feaf7'
            'f3f689a6b035241715d79b1fcde5a26dcb35b4607e0321ddf2f68b095090db3b'
            '97c6fce16e81393f0415cd153b9f52496f7b796ccdf8d8b59d06236ba8dcb399'
            '4cfdff426ec8ebec358c891223b5dc1e35dade44161808aec4e62a1c4ba2eaf4'
            'e7d8d157e66ec97ed3f5ee5c5a359e4bbc46b4c6a803af96c91315657467da9f'
            '7fe100992817502e2bf826442608d07beda77c0d56954e583116a4311f821f66')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-mocha-* "$pkgdir/usr/share/icons"
}
