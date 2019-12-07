# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=gpmd85emulator-data
pkgver=1
pkgrel=3
pkgdesc="Misc programming languages, games and programs for gpmd85emulator"
arch=('any')
url="https://pmd85.borik.net/wiki/Download"
license=('unknown')
depends=('gpmd85emulator')
source=("https://pmd85.borik.net/?action=download&did=2"
	"https://pmd85.borik.net/?action=download&did=93"
	"https://pmd85.borik.net/?action=download&did=6"
	"https://pmd85.borik.net/?action=download&did=11"
	"https://pmd85.borik.net/?action=download&did=4"
	"https://pmd85.borik.net/?action=download&did=100"
	"https://pmd85.borik.net/?action=download&did=8"
	"https://pmd85.borik.net/?action=download&did=9"
	"https://pmd85.borik.net/?action=download&did=52"
	"https://pmd85.borik.net/?action=download&did=82"
	"https://pmd85.borik.net/?action=download&did=10"
	"https://pmd85.borik.net/?action=download&did=26"
	"https://pmd85.borik.net/?action=download&did=13"
	"https://pmd85.borik.net/?action=download&did=12"
	"https://pmd85.borik.net/?action=download&did=19"
	"https://pmd85.borik.net/?action=download&did=20"
	"https://pmd85.borik.net/?action=download&did=21"
	"https://pmd85.borik.net/?action=download&did=3"
	"https://pmd85.borik.net/?action=download&did=49"
	"http://pmd85.borik.net/?action=download&did=8"
	"https://pmd85.borik.net/?action=download&did=50"
	"https://pmd85.borik.net/?action=download&did=70"
	"https://pmd85.borik.net/?action=download&did=92"
	"https://pmd85.borik.net/?action=download&did=31"
	"https://pmd85.borik.net/?action=download&did=86")

md5sums=('f080063e30b0dabfd03472fad9a338ce'
         '6dc201e05f52b23e65182057ab50c355'
         '107c84bbb19770a7effefd632a5564f0'
         '5a9a5fa72040c05604dde8b2f6536ab3'
         '2f5aac67abce1ed063cd7907b21c3b6d'
         'eec7603b394b299601c17cb2b8d8127f'
         'c1c018bf149e04e8d441f04d2dfba59b'
         '2649b1c6ee07c7a52cf74ad322b9d7cd'
         '01359f5af028800b0c5b4abaf4766f30'
         'e75ec71c5bac20d217fe0e39959e54e0'
         'ac517f446addc0f78d8663ebc85ca1c1'
         '34884e86e4116ab3b9e1077dd53d9b3a'
         '95835a73ea92d8b94ef0f7ea85f6142e'
         'a537c1be6d71042aff570a57ae1c79ba'
         '1f748c90a33bf9452383fa62b78d282f'
         '1fc2ae05f1e3777215592f33669bcce6'
         '56e83f90e2703e3eaf6703a9e8635d63'
         '4520546fdf23d5b5669fc6f41febf8ec'
         '0b705dff89ce5f2bad8b9b8412df2542'
         'c1c018bf149e04e8d441f04d2dfba59b'
         '93db111a5f3166f273bec1d39e6f78bd'
         '1c71c4ce82f40d5736bfd013467cab34'
         '5aaeee056b66bd90704d97ee7a3bc5db'
         '744fe2f638ce3ac3f909f99237878889'
         'd8ea10a497aa92d7935b4c3cd8984e24')

package() {
chmod 644 $srcdir/*
chmod 755 $srcdir/vyukove_programy_UPnpBB
cd $srcdir/
mkdir -p $pkgdir/usr/share/gpmd85emu
cp -r .  $pkgdir/usr/share/gpmd85emu
find $pkgdir/usr/share/gpmd85emu -type l -delete
}
