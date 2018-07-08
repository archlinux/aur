# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=broom
_cranver=0.4.5
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Convert statistical analysis objects into tidy data frames."
url="https://CRAN.R-project.org/package=broom"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-dplyr' 'r-plyr' 'r-psych' 'r-reshape2' 'r-stringr' 'r-tidyr')
optdepends=('r-aer' 'r-akima' 'r-auc' 'r-bbmle' 'r-betareg' 'r-biglm' 'r-bingroup' 'r-brms' 'r-btergm' 'r-coda' 'r-covr' 'r-emmeans' 'r-ergm' 'r-gam' 'r-gamlss' 'r-gamlss.data' 'r-gamlss.dist' 'r-geepack' 'r-ggplot2' 'r-glmnet' 'r-gmm' 'r-hmisc' 'r-knitr' 'r-ks' 'r-lahman' 'r-lfe' 'r-lme4' 'r-lmodel2' 'r-lmtest' 'r-lsmeans' 'r-maps' 'r-maptools' 'r-mclust' 'r-muhaz' 'r-multcomp' 'r-network' 'r-orcutt' 'r-plm' 'r-polca' 'r-purrr' 'r-quantreg' 'r-rgeos' 'r-robust' 'r-rstan' 'r-rstanarm' 'r-sp' 'r-speedglm' 'r-statnet.common' 'r-testthat' 'r-tibble' 'r-xergm' 'r-zoo')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('09da5846863e640ab73ccfee6ac7f258') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
