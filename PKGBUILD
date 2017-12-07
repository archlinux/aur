# Maintainer: MrSoup678 <slawekwaga@gmail.com>

pkgname=nodejs-crontab-ui-server
pkgver=0.3.3
pkgrel=1
pkgdesc="Easy management of crontab file - server component"
arch=("any")
license=("MIT")
depends=("nodejs")
makedepends=("npm")
provides=("nodejs-express nodejs-ejs nodejs-nedb nodejs-body-parser nodejs-mine-types nodejs-cron-parser nodejs-connect-busboy nodejs-moment nodejs-nodemailer") #if somebody uses aur packages 
# TODO move this under dependencies
md5sums=()


package() {
    npm install -g --user root --prefix "$pkgdir"/usr crontab-ui

}
