# Contributor: Storm Dragon <support@stormdragon.tk>
pkgname=fortune-mod-question-answer-jokes
pkgver=4.1
pkgrel=3
pkgdesc="Q: what do you get from this fortune file? A: Some funny, and some really cheesy jokes."
arch=('any')
url="http://stormdragon.tk/fortunes/question-answer-jokes"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('985e2fe024f9ccdf0b3196fa32789b5f')

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
