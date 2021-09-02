# Maintainer: Barfin

pkgname=ttf-segoewp
pkgver=1.0
pkgrel=3
pkgdesc='SegoeWP font family'
arch=('any')
url="https://fontsgeek.com/search/styles?q=Segoe+WP"
license=('unknown')
provides=('ttf-font')
source=("https://raw.githubusercontent.com/barfin/ttf-segoewp-for-aur/main/segoe-wp-black.zip"
		"https://raw.githubusercontent.com/barfin/ttf-segoewp-for-aur/main/segoe-wp-bold.zip"
		"https://raw.githubusercontent.com/barfin/ttf-segoewp-for-aur/main/segoe-wp-light.zip"
		"https://raw.githubusercontent.com/barfin/ttf-segoewp-for-aur/main/segoe-wp-regular.zip"
		"https://raw.githubusercontent.com/barfin/ttf-segoewp-for-aur/main/segoe-wp-semibold.zip"
		"https://raw.githubusercontent.com/barfin/ttf-segoewp-for-aur/main/segoe-wp-semilight.zip")
sha256sums=('1116275dead01ee44c34545249ad1814792d5237e50a63160bf42f6b1d2485a4'
            '0a5e6d1e5235b4c789b34aa05f5eeb32b1fc1fd3670fa28f07146d01149b4144'
            '40b7e839594a9af614716514d725ddc512d1be0da31585ceae9fa40d14980158'
            'fa2bf9b35fdcde7cc0d42951ff9e2902c40b0ef6144571d3d8574e70ee970fef'
            'a1f597111bb1ccf7cf8ed19fbf11f5abb369d68ee02d29bfc8c5fd1f79f31414'
            'c507f3c424036d424144205034238f4978ccfe7becd2225f1581decb76d4724e')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ${srcdir}/*/*.ttf
}
