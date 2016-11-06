# synapse-bzr: bzr AUR PKGBUILD for synapse

This package contains special parameters to build the package synapse from bebehei's branch on launchpad. This branch contains personal fixes which either have no intention to push them into upstream repo or their merge request is not accepted yet in upstream.

***To consult the Standard VCS-PKGBUILD for synapse (using trunk-branch of launchpad-repo), consider the branch aur inside this repository.***

## Correct checkout of this repo

    git clone https://github.com/bebehei/synapse-bzr
    cd synapse-bzr
    git remote add aur https://aur.archlinux.org/synapse-bzr.git
    git remote fetch aur
    git branch -u aur/master aur
    git branch -u origin/master master
