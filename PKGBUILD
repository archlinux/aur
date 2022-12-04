# Maintainer: spookyintheam <spookyintheam@protonmail.com> 
# Contributor: Luis Martinez <luis dot martinez dot at disroot dot org>

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.3.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Frappe'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Green.zip"
         "$pkgname-$pkgver-grey.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Grey.zip"
         "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Peach.zip"
         "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Pink.zip"
         "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Red.zip"
         "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Teal.zip"
         "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Yellow.zip"
         "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe.zip")
sha256sums=('a8873da04d767f34ca3fab340de87aff60f97d00226c62789157b054aa2d666a'
            'cb3285dbe47d59250a21d54ebac4d093f95f4f0e197a14eaac956bdd4895994b'
            '96ac9352310d2caf74fbc5cfe22001dd75b7082b98daddaee0f15cb40313c180'
            'b09f0499f618751fe7e62c8235adcbf482d5320d7f7c2aee3520ef13076bd916'
            '3e3153acf637c7fe8be01b75b3042ba0001f5bcb95cce131798c4615c7ce84ff'
            'f3b87962b4e70de768d419d573dac499e25bb589a0593e398ed8bab6ee05112b'
            '50f634f4896a99f7625c4ac284bfc849da676f6f57adc54128c7745fb5cf67f9'
            '7f898947f29dad319e9278b9cdb81cb6e5d2b8ea3cddd74ff3e8d5ea1193210f')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Frappe-Green-hdpi" \
        "Catppuccin-Frappe-Green-xhdpi" \
        "Catppuccin-Frappe-Green" \
        "Catppuccin-Frappe-Grey-hdpi" \
        "Catppuccin-Frappe-Grey-xhdpi" \
        "Catppuccin-Frappe-Grey" \
        "Catppuccin-Frappe-Peach-hdpi" \
        "Catppuccin-Frappe-Peach-xhdpi" \
        "Catppuccin-Frappe-Peach" \
        "Catppuccin-Frappe-Pink-hdpi" \
        "Catppuccin-Frappe-Pink-xhdpi" \
        "Catppuccin-Frappe-Pink" \
        "Catppuccin-Frappe-Red-hdpi" \
        "Catppuccin-Frappe-Red-xhdpi" \
        "Catppuccin-Frappe-Red" \
        "Catppuccin-Frappe-Teal-hdpi" \
        "Catppuccin-Frappe-Teal-xhdpi" \
        "Catppuccin-Frappe-Teal" \
        "Catppuccin-Frappe-Yellow-hdpi" \
        "Catppuccin-Frappe-Yellow-xhdpi" \
        "Catppuccin-Frappe-Yellow" \
        "Catppuccin-Frappe-hdpi" \
        "Catppuccin-Frappe-xhdpi" \
        "Catppuccin-Frappe" \
        "$pkgdir/usr/share/themes"
}
