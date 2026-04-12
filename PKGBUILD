# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
pkgname=mutt_oauth2.py-git
pkgver=20200807
pkgrel=1
pkgdesc="mutt OAuth2 token management script"
arch=('any')
url="https://gitlab.com/muttmua/mutt/-/blob/master/contrib/mutt_oauth2.py"
license=('GPL-2.0-or-later')
depends=('python>=3.7.3')
source=(
    "https://gitlab.com/muttmua/mutt/-/raw/master/contrib/mutt_oauth2.py"
    "https://gitlab.com/muttmua/mutt/-/raw/master/contrib/mutt_oauth2.py.README"
)
b2sums=('d5eeb67c1c2b43493002465d0290f78b5d946a28e5ec0790463e5997828a9a7c223ca13fe71c8a4c8e0b989a61b16865f8c61b29bd5843cb4daa2ffb00639bc0'
        'efe5331d1bde6dd0d392b045790121c2c9be8dea44dc279501135e1d1f39e1c3b0afc23528bfefd1413d666693da5ee39e2d8b00527c8f0a4308f560c2867673')

package()
{
    install -D -m755 mutt_oauth2.py "${pkgdir}/usr/bin/${pkgname%.-git}"
    install -D -m644 mutt_oauth2.py.README -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
