# Maintainer: spookyintheam <spookyintheam@protonmail.com> 

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.7.3
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Frappe'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Blue-Dark.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Flamingo-Dark.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Green-Dark.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Lavender-Dark.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Maroon-Dark.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Mauve-Dark.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Peach-Dark.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Pink-Dark.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Red-Dark.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Rosewater-Dark.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sapphire-Dark.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sky-Dark.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Teal-Dark.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Yellow-Dark.zip")

sha256sums=('695cc05fe3af7613ffc739c175ca99307b5fc3cd457693ada255eac607d6d0ac'
            'acc66b74ab35cb355a34c45151e4d50241cd297e0365b3f7ef29e5b898172cd8'
            'a7c1a1e70deb0d2c392b45c63155532950bdc73534b742a7e8b1ce8be9bf6994'
            'ca4453504bfca6b8d1a6e4122e9d8487f3852e88de9a7006e423409a28e14918'
            'f52a50584b260c5be98f03d5b46af14bb24f431032e3a281471a8002233f855c'
            'b7373d826c48f179a207178fbf47477f45e29f2689b3e7e25a290a36d6b9ec90'
            '6ee93522de035710fbc389e2c35dc53c06ba8f36274e7721587727d414e77298'
            'df29caccbd44064898ef8845d897d2379ee42a927b3a0cb5a18e867bc91d6d86'
            'f1973fe207a4f98ca10f2e8d5d14bb92ba27f965c4bafa14fbacd0b9ab731082'
            'c8d7d57c1ff36558d6a7a228388f93df7a659dd50c44f8ccc9842855b53d9141'
            '447c7e3cc34774b142270bf386edebb2ecf9d815f0b63a2b684bd42e4521edc4'
            'dbce7616c375fa52c796c7d5e2fe58a9ef23eee89eadd5a70bb2e9a00dc4d54e'
            '9f705bb433309663573b7951d207fb4d5a462cba4cfe95c1468c1ded5438ed92'
            '518cc2bb59a0d151a31b65f090da8d9b6c3d6ac31973e73eefcdcdc07e10cd1d')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -r -a --no-preserve=ownership \
      Catppuccin-Frappe-* "$pkgdir/usr/share/themes"
}
