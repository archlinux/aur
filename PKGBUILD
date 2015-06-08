# Contributor: Benjamin Hedrich <kiwisauce (a) pagenotfound (dot) de>

pkgname=bash-completion-django
pkgver=20130925
pkgrel=1
pkgdesc="Bash completion for django"
arch=(any)
url="https://docs.djangoproject.com/en/dev/ref/django-admin/?from=olddocs#bash-completion"
license=('GPL')
depends=('bash-completion')
source=('https://github.com/django/django/raw/master/extras/django_bash_completion')
md5sums=('2723e26eb4d796a1fe35b20d33798fbf')


package() {
   install -Dm644 ${srcdir}/django_bash_completion  ${pkgdir}/etc/bash_completion.d/django

}