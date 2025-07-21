# Maintainer: Rastislav Barlik <barlik.arch at gmx dot com>

pkgname=figlet-fonts-extra
pkgver=1.1
pkgrel=2
pkgdesc="Additional collection of asciiart fonts for figlet"
arch=('any')
license=('unknown')
url="https://github.com/xero/figlet-fonts"
depends=('figlet')
source=('https://github.com/xero/figlet-fonts/archive/8fc6db5e9e980153505c89edc9d7246633a26985.zip')
md5sums=('db05469e58b7456c3ff723ebecf9afb7')

package() {
        local dir=$srcdir/figlet-fonts-8fc6db5e9e980153505c89edc9d7246633a26985

        install -dm755 ${pkgdir}/usr/share/figlet/fonts/

        msg 'Removing figlets which are already in official distribution...'
        for f in ${excluded[@]}; do
                rm "$dir/$f";
        done

        cp $dir/* ${pkgdir}/usr/share/figlet/fonts/
}

excluded=(
3x5.flf
5lineoblique.flf
646-ca.flc
646-ca2.flc
646-cn.flc
646-cu.flc
646-de.flc
646-dk.flc
646-es.flc
646-es2.flc
646-fr.flc
646-gb.flc
646-hu.flc
646-irv.flc
646-it.flc
646-jp.flc
646-kr.flc
646-no.flc
646-no2.flc
646-pt.flc
646-pt2.flc
646-se.flc
646-se2.flc
646-yu.flc
8859-2.flc
8859-3.flc
8859-4.flc
8859-5.flc
8859-7.flc
8859-8.flc
8859-9.flc
bigchief.flf
calgphy2.flf
cosmic.flf
dosrebel.flf
dotmatrix.flf
drpepper.flf
eftichess.flf
eftifont.flf
eftipiti.flf
eftirobot.flf
eftitalic.flf
eftiwall.flf
eftiwater.flf
fourtops.flf
frango.flc
hz.flc
ilhebrew.flc
jis0201.flc
koi8r.flc
larry3d.flf
moscow.flc
ntgreek.flf
rev.flf
rowancap.flf
sblood.flf
slscript.flf
smisome1.flf
smkeyboard.flf
smscript.flf
smshadow.flf
smslant.flf
smtengwar.flf
starwars.flf
threepoint.flf
ticksslant.flf
twopoint.flf
upper.flc
usaflag.flf
ushebrew.flc
uskata.flc
utf8.flc
)
