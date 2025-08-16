# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-sddm-theme-macchiato
pkgver=1.1.2 # renovate: datasource=github-tags depName=catppuccin/sddm
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM - Macchiato'
arch=('any')
license=('MIT')
depends=('sddm' 'qt6-svg' 'qt6-declarative')
url='https://github.com/catppuccin/sddm'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-blue-sddm.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-flamingo-sddm.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-green-sddm.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-lavender-sddm.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-maroon-sddm.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-mauve-sddm.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-peach-sddm.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-pink-sddm.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-red-sddm.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-rosewater-sddm.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sapphire-sddm.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sky-sddm.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-teal-sddm.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-yellow-sddm.zip"
)
sha256sums=('24e9296d52d7b84ce0b398d33e427c52ff832fc7c3c77c1874506b5561ae6176'
            '82efa9502a00a7e85765270eb348e5a3a5b4fecdc1ee84f9f71af7f2be132a1b'
            '882a0d49cb83b1ea818cc370a97cfde8afbbdf19f5972304cffda1f6a92992a9'
            '6a257298a1625c7cb3b36738573a34890852a0ad5e4bc115bf93c47b3a2d6bf3'
            '03ec5e040e0d4f18a008b4100610a007b400b0fa9227cfd947f6be6611638de9'
            'cf2c6b95c4acd25aa4a3542341e80a75425a3239a6961ed4988213e795c55757'
            'fc1fdaf6da06f1e45b80e469d8ebf63d2228ab249b5b01976726923496215f9a'
            'fc0938ce89a7c53392f5fa1b5f33ca6e9b7f51a98265ceb7bd2a1f1cccfb5bde'
            'd87722a93f26e4f4513c9a949c61d16037aa5872b1b2d7f2a1f803f855d9a118'
            '7ac58ba6f6062831dd94ef5f8524b2f9274efa60464fad8c2f9ea48e6c873070'
            'fe36a9b8cea292df98dc8e3b1b50d7100740c4ea2d708f0b7103154aef44c6a9'
            '41f29b1ab41d60fe87183128514059d8a52c4339c0c78a32fac227672d67fd4c'
            '16eac9bcd500587ada513187b89b416e19c052bb003a8fb01a6fbe42039ff0aa'
            '6a77f6f3081ec638b61d24a8bbba34608a3c17cb239951583e54b30ef4538463')

package() {
	install -d "$pkgdir/usr/share/sddm/themes/"
	cp -r -a --no-preserve=ownership catppuccin-macchiato-* "$pkgdir/usr/share/sddm/themes"
}
