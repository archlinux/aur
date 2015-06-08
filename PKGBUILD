# Contributor: Storm Dragon <support@stormdragon.tk>
pkgname=fortune-mod-question-answer-jokes
pkgver=3
pkgrel=3
pkgdesc="Q: what do you get from this fortune file? A: Some funny, and some really cheesy jokes."
arch=('any')
url="http://stormdragon.tk/fortunes/question-answer-jokes"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('f8945ddbe860b56b04f2c1a6910db01c')

build()
{
    cd ${srcdir}
    strfile question-answer-jokes question-answer-jokes.dat
}

package()
{
    install -D -m644 question-answer-jokes ${pkgdir}/usr/share/fortune/question-answer-jokes
	install -D -m644 question-answer-jokes.dat ${pkgdir}/usr/share/fortune/question-answer-jokes.dat
}
