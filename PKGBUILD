# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-mocha
pkgver=1.0.1 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('1cefa25b0a8708c0275bd3e892851a9b6bc08c3adbee2141162de06077509331'
            '2df8ff8d89b9762cb451ba48e52d6cab3b50fe1faebb852c8cc9d1172d990566'
            '67f41bb5b9a08ff351b00aca5f3fb150b2cc6f912f03d0176bae8561d5ed6434'
            '5f4a1bddb6639598bf069d46226be9c40cff49e53076f79c85ab1f1509156b90'
            '84266fa08536578c9dca4349819617454c4ca55b591522daf6ff8c07290e3194'
            'ae08fed84dc8790046688f431217bdccc7c21c3f11fc5f9e7e3ca9a52140b25b'
            'cf512dc4b2e3b3b6d3f0f5a3c64a76ce43bdeb85245e3f8ffa34d142e8af2b22'
            '53fd1c222133ea8af225443414ed0275aef6868337c2e2fc92126aa45467d79e'
            '345a5631cea34119a38d45d6d8a9e839d2573ec9cc3fcd9013c3800484c8efb3'
            'b974eb605d4825aa68ab02f0d7a2cfaeb7d22a35095a51df748662b461666dce'
            '5a8d9966d6a26cec6227ac0d97fa02556dacfbc4b4a9f2f8d79935b8a53582dd'
            '52761f10003ab27c2fa1f8ad3bff9397c24d04ff1f3deab5fe9c6710295fc553'
            '6e908037cec8492393488510593aab309692a9db3950bacac9854c505501b026'
            '1af017d8c93b1391c7f998958a40f9ab9814f84b91741350272162f4020c5a8b'
            'b8592bf571ae43a85e9ba52a5a2948507392a5fa58c1d6496b9f011ca37f3415'
            '341f547260395de90b65322edbf72bd5644d9394620b7c97003748632ecb0c77')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-mocha-* "$pkgdir/usr/share/icons"
}
