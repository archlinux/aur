# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-macchiato
pkgver=0.4.0 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Macchiato'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-yellow-cursors.zip"
)

sha256sums=('9cf3cff8ccf9203e7696f2d9517c1c4fddbd244db1890f9ed396fdbeac1c0ef0'
            '607cac61e1a55207569e86797edbdb18a59601271ecc1c27acde54a951c4dec3'
            '1f260e0cef289b5edb0f311d16594f4ea4e3717379926f4468ac82987c7b4e32'
            'bf355aa3095599fc6e7156214db756281848a894929c9f8cc533cc46e30d749f'
            '1d3f29494b62c92e336709cb8dbbef7d1c8287552daa8db99aacd00e244adfbe'
            '2a634815beaca9f01a4c783111e609fc1de84bd9c85c52f329559c67a185b2bf'
            '8db224940ad738c09016846b1958cb59399c828910fb203decb0c28a329fe7c6'
            'cc2d6b546db8f255e4dcea87cb1495545c3c6b14580693474a6897ee2dab67fb'
            '37112c3b37351d87df1fa02eeeac7d55a999d1a7f6ebfa29d35bb3f9b7e0fb43'
            '92348bfb4f7bcb640fd072fd50682cb2d137d7044186b471fa7cf42129f93c33'
            '9b8bbd2cca0bd01152e221ff40571c3956c8010be3377e4817739b8a18cf66a0'
            'bb178f3ad0447f3071c07c4ff8a7c79549f870ce4d99a47fef1f46381d520ae8'
            '338b719e3742c111c1177606c0861d6079133638276c9cb4cba598e28fb66e8a'
            '75f3aecdb2d16b708d9da4ff4de9e411d16126e9bb2a7cbe6032ae92a5eb8b24'
            '5437f7be1bce8c85ae94d2e3442e0e74e6f2021c1de18a310e46066299a5d1fb'
            '1f7d25e1e1a3c1550bf112fe509eefc2158fb96802e09573fe40546888864166')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-macchiato-* "$pkgdir/usr/share/icons"
}
