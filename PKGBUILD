# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Bitts311 <oceanmail311@gmail.com>

pkgname=qogir-gtk-theme
_pkgname=Qogir-theme
_pkgver=2021-08-02
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Qogir is a flat Design theme for GTK"
arch=('any')
url="https://github.com/vinceliuice/Qogir-theme"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
optdepends=('kvantum-theme-qogir-git: Matching Kvantum theme'
            'qogir-icon-theme: Matching icon theme'
            'vimix-cursors: Matching cursor theme'
            'tela-icon-theme: Recommended icon theme')
conflicts=('qogir-gtk-themes-git')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz")
sha256sums=('8eaa45957cc99088ba8ee566b074e9a12fbc74a7cbc4728bd9efc423839e5604')

package() {
	cd "$_pkgname-$_pkgver"
	install -dm755 "$pkgdir/usr/share/themes"
	./install.sh -d "$pkgdir/usr/share/themes"
}

