# Contributor: Storm Dragon <support@stormdragon.tk>
pkgname=fortune-mod-question-answer-jokes
pkgver=4.3
pkgrel=1
pkgdesc="Q: what do you get from this fortune file? A: Some funny, and some really cheesy jokes."
arch=('any')
url="https://billy.wolfe.casa/fortunes/question-answer-jokes"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('d739cc6dc40645ca39e6079a8c75508b')

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
