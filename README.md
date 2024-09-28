# Reduce Algebra - Arch User Repositories (AUR) package development

> **Do not install the _reduce_ package group from this repository,
> use the released package(s) on the AUR.**

_Reduce_ is a portable general-purpose computer algebra system with
many features. Visit the homepage for more information:
<https://reduce-algebra.sourceforge.io/>

This repository is used for developing/updating the package for the
AUR.  The rationale behind the update work is two-fold:

* The current package in the AUR is flagged "out-of-date" as newer
  official releases are available.
* The package should be built from source to comply with the
  [AUR submission guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines).
  (also see the
  [flag comment](https://aur.archlinux.org/pkgbase/reduce/flag-comment)).

## Short term goals

* Build from source and mimic the official Debian releases
* Report changes/bugs/... upstream
* Release a `reduce-bin` package from the offical release packages
