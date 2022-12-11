# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=0.3.1
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Macchiato'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Blue.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Flamingo.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Green.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Lavender.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Maroon.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Mauve.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Peach.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Pink.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Red.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Rosewater.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Sapphire.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Sky.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Teal.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Yellow.zip")

sha256sums=('ae2b405c341f385a759a7846630cdff04fffd8192a6491fec2504fd325c67db8'
            'da9b82bc4022ba6c005d71aa3e29edf950f3a5a1457e2daec494037d0ea6dc09'
            '6f43e867ff4b845ff06102a3d0d1d4e44b52dd064db7a8c3ab000748c1e3861c'
            '20648f417e2a882c85f5328ad32a8e435aebef827ec8ae19d88b50ff11d01f41'
            'bf8883d175efea952a3e5b0730d250d097ea6a095af8a7f01713fd0508aaf6fc'
            '021033695635b06667ee885e9c77be0f3e257f1f5d9644636fbac6361024bdb8'
            'df1fbeb36ece15b44c00998c0ca914b5fe21db0b6f311bc24099494c6dc175db'
            '19715b0c444ee3c24e5e87936b9c19f557fd1e66def2048d873c4cbe696bb848'
            'cf0c0f4493e21cd3438250b27ef4d9d8b9c1aaef5bb3ad6afee65e87f609f0a1'
            '5b2083c25fa3be12586723f3f3576eed1a32614d010b326fece7d2e4df3ed4ea'
            '95c797443f2ebe147d002045b82687a1e447e10452e6a12a04c1d59cb20dcae2'
            '7250855cfc0c758bed61fda645fd2383d4ccc6055a519f028a2177e3cf913431'
            '53aa9c6e047a3653dcc7ad73debcc735961584b0a340f12245b0ab0eb7c3f016'
            'db655476fdd66ec5f7a950e00a5b171376a4df95d5884d998f195698abc567a0')
package() {
  install -d "$pkgdir/usr/share/themes/"
  cp -a --no-preserve=ownership \
      "Catppuccin-Macchiato-Standard-Blue-hdpi" \
        "Catppuccin-Macchiato-Standard-Blue-xhdpi" \
        "Catppuccin-Macchiato-Standard-Blue" \
        "Catppuccin-Macchiato-Standard-Flamingo-hdpi" \
        "Catppuccin-Macchiato-Standard-Flamingo-xhdpi" \
        "Catppuccin-Macchiato-Standard-Flamingo" \
        "Catppuccin-Macchiato-Standard-Green-hdpi" \
        "Catppuccin-Macchiato-Standard-Green-xhdpi" \
        "Catppuccin-Macchiato-Standard-Green" \
        "Catppuccin-Macchiato-Standard-Lavender-hdpi" \
        "Catppuccin-Macchiato-Standard-Lavender-xhdpi" \
        "Catppuccin-Macchiato-Standard-Lavender" \
        "Catppuccin-Macchiato-Standard-Maroon-hdpi" \
        "Catppuccin-Macchiato-Standard-Maroon-xhdpi" \
        "Catppuccin-Macchiato-Standard-Maroon" \
        "Catppuccin-Macchiato-Standard-Mauve-hdpi" \
        "Catppuccin-Macchiato-Standard-Mauve-xhdpi" \
        "Catppuccin-Macchiato-Standard-Mauve" \
        "Catppuccin-Macchiato-Standard-Peach-hdpi" \
        "Catppuccin-Macchiato-Standard-Peach-xhdpi" \
        "Catppuccin-Macchiato-Standard-Peach" \
        "Catppuccin-Macchiato-Standard-Pink-hdpi" \
        "Catppuccin-Macchiato-Standard-Pink-xhdpi" \
        "Catppuccin-Macchiato-Standard-Pink" \
        "Catppuccin-Macchiato-Standard-Red-hdpi" \
        "Catppuccin-Macchiato-Standard-Red-xhdpi" \
        "Catppuccin-Macchiato-Standard-Red" \
        "Catppuccin-Macchiato-Standard-Rosewater-hdpi" \
        "Catppuccin-Macchiato-Standard-Rosewater-xhdpi" \
        "Catppuccin-Macchiato-Standard-Rosewater" \
        "Catppuccin-Macchiato-Standard-Sapphire-hdpi" \
        "Catppuccin-Macchiato-Standard-Sapphire-xhdpi" \
        "Catppuccin-Macchiato-Standard-Sapphire" \
        "Catppuccin-Macchiato-Standard-Sky-hdpi" \
        "Catppuccin-Macchiato-Standard-Sky-xhdpi" \
        "Catppuccin-Macchiato-Standard-Sky" \
        "Catppuccin-Macchiato-Standard-Teal-hdpi" \
        "Catppuccin-Macchiato-Standard-Teal-xhdpi" \
        "Catppuccin-Macchiato-Standard-Teal" \
        "Catppuccin-Macchiato-Standard-Yellow-hdpi" \
        "Catppuccin-Macchiato-Standard-Yellow-xhdpi" \
        "Catppuccin-Macchiato-Standard-Yellow" \
      "$pkgdir/usr/share/themes"
}
