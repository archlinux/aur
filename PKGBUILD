# Maintainer: spookyintheam <spookyintheam@protonmail.com> 
# Contributor: Luis Martinez <luis dot martinez dot at disroot dot org>

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.4.1
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

sha256sums=('25a637e8bc12280318c60e4f52a4e1dd9b96965520b35d31ec1ec2641e4a122a'
            'e39695b45df1fba3cc6551994959d9590ae5f53cb7902de7fd521edd691542ee'
            'b6451a70f0a97386852b45a0b0786046454097b7bd6782b73a2b2d1a4a748bad'
            'be228c0e499bb7e2012225e8e1e03dba9fa7b8452272aa2b7979af73dfeb5a60'
            '379a79d06cacb9187feaa2ceb22cb4b4be2851f46ebeef74024229a1d18204e2'
            'abedc7756a6df44f08674f0f11147557083ca13d088e8927ead078b48fdcd03c'
            'a364168f21d454cfbf22bd20875583a866fafb6dd87655209b91115067e72fe2'
            '2cbc9bef140f62090afa77f8cdb4add3a5741028a868cd5e50bb6f20f716ee1c'
            '667ec218a55f0caedce014c25ddfa47be6b4bacbbcecdb6f08fbdb3fdc277e5a'
            '069fc3f5a27692fb4280eff26bd9e690f724afae5104811972bd13fea83b8a1b'
            '30637cdac14fa9cee184f92d60c567363c95591dff3812bbcfdc41a6c561cdea'
            'ebb9ef41bf05528c03de4c6dba537424144d16fe05e59c4f38f3fd5a2da4634d'
            '9e15495acd626258bc6734269a8099642dd744324900d45d2e05bffc93f78653'
            '8b4b9759be08867e98d5d872898947f2b2ba155fbdb756ebcc35b1ea35fa137e')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Frappe-Standard-Blue-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Blue-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Blue-Dark" \
        "Catppuccin-Frappe-Standard-Flamingo-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Flamingo-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Flamingo-Dark" \
        "Catppuccin-Frappe-Standard-Green-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Green-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Green-Dark" \
        "Catppuccin-Frappe-Standard-Lavender-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Lavender-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Lavender-Dark" \
        "Catppuccin-Frappe-Standard-Maroon-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Maroon-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Maroon-Dark" \
        "Catppuccin-Frappe-Standard-Mauve-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Mauve-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Mauve-Dark" \
        "Catppuccin-Frappe-Standard-Peach-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Peach-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Peach-Dark" \
        "Catppuccin-Frappe-Standard-Pink-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Pink-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Pink-Dark" \
        "Catppuccin-Frappe-Standard-Red-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Red-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Red-Dark" \
        "Catppuccin-Frappe-Standard-Rosewater-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Rosewater-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Rosewater-Dark" \
        "Catppuccin-Frappe-Standard-Sapphire-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Sapphire-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Sapphire-Dark" \
        "Catppuccin-Frappe-Standard-Sky-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Sky-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Sky-Dark" \
        "Catppuccin-Frappe-Standard-Teal-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Teal-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Teal-Dark" \
        "Catppuccin-Frappe-Standard-Yellow-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Yellow-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Yellow-Dark" \
                "$pkgdir/usr/share/themes"
}
