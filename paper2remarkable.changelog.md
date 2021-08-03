## Version 0.9.6

* Bugfix for Springer provider (metadata)
* Bugfix for Nature provider (metadata)
* Increase flexibility for ACM provider pdf urls

## Version 0.9.5

* Bugfix for ACL provider
* Bugfix for Semantic Scholar test case

## Version 0.9.4

* Bugfix for uploading multiple files 
  ([#110](https://github.com/GjjvdBurg/paper2remarkable/issues/110))
* Add support for IACR ePrints 
  ([#113](https://github.com/GjjvdBurg/paper2remarkable/pull/113))
* Add support for ECCC reports 
  ([114](https://github.com/GjjvdBurg/paper2remarkable/pull/114))

## Version 0.9.3

* Bugfix for Taylor & Francis provider (thanks to @gwtaylor 
  [#107](https://github.com/GjjvdBurg/paper2remarkable/pull/107))
* Add illustration image to readme (thanks to @ReinierKoops 
  [#106](https://github.com/GjjvdBurg/paper2remarkable/pull/106))

## Version 0.9.2

* Fix bug that broke blank pages functionality 
  ([#98](https://github.com/GjjvdBurg/paper2remarkable/issues/98))
* Bugfix for SemanticScholar provider

## Version 0.9.1

* Bugfix for ScienceDirect Provider

## Version 0.9.0

* Replace PyPDF2 with pikepdf (thanks to @Kazy 
  [#94](https://github.com/GjjvdBurg/paper2remarkable/pull/94))
* Preserve ToC when present in the file (thanks to @Kazy, 
  [#94](https://github.com/GjjvdBurg/paper2remarkable/pull/94))
* Bump minimum Python version to 3.6
* Remove unnecessary delay in CiteSeerX provider

## Version 0.8.9

* Add provider for ACLWeb

## Version 0.8.8

* Bugfix for NeurIPS provider

## Version 0.8.7

* Fix issues with merging configuration settings and command line flags

## Version 0.8.6

* Rename default configuration file

## Version 0.8.5

* Handle the case where the configuration file doesn't contain all sections.

## Version 0.8.4

* Add support for using a configuration file to avoid having to use command 
  line flags.

## Version 0.8.3

* Add support for providing custom styling for HTML output (closes 
  [#82](https://github.com/GjjvdBurg/paper2remarkable/issues/82)).

## Version 0.8.2

* Add provider for ScienceDirect
* Add man page to package
* Add short flag, -f, for --filename

## Version 0.8.1

* Add experimental fix for lazy loaded images in HTML

## Version 0.8.0

* Add provider for Nature
* Add provider for Taylor & Francis
* Minor bugfixes

## Version 0.7.4

* Add provider for CVF

## Version 0.7.3

* Increase robustness for arXiv sources
* Fix NBER provider after site update
* Add support for multiple command line inputs

## Version 0.7.2

* Add support to optionally use 
  [ReadabiliPy](https://github.com/alan-turing-institute/ReadabiliPy), a 
  wrapper around Mozilla's 
  [Readability.js](https://github.com/mozilla/readability), to improve text 
  extraction of web articles. This closes 
  [#53](https://github.com/GjjvdBurg/paper2remarkable/issues/53), thanks to 
  @sirupsen for reporting the problem.
* Improve NeurIPS provider to add support for papers.neurips.cc

## Version 0.7.1

* Fix OpenReview provider after site change

## Version 0.7.0

* Add provider for SagePub

## Version 0.6.9

* Improve robustness of Springer provider

## Version 0.6.8

* Add provider for SemanticScholar papers
* Fix bug that made ``no_crop`` option no longer work

## Version 0.6.7

* Increase robustness to PDF issues by passing through GhostScript (fixes 
  [#51](https://github.com/GjjvdBurg/paper2remarkable/issues/51)). Thanks to 
  @sirupsen.
* Bugfix for code that removes arXiv stamp.

## Version 0.6.6

* Bugfix to url validation: allow underscore in subdomains.

## Version 0.6.5

* Corrections to code that removes the arXiv stamp 
  ([#49](https://github.com/GjjvdBurg/paper2remarkable/issues/49)). Thanks to 
  @mr-ubik.

## Version 0.6.4

* Further fixes for images in HTML sources 
  ([#45](https://github.com/GjjvdBurg/paper2remarkable/issues/45)). Thanks to 
  @sirupsen.

## Version 0.6.3

* Properly resolve image urls in HTML sources 
  ([#45](https://github.com/GjjvdBurg/paper2remarkable/issues/45)). Thanks to 
  @sirupsen.
* Allow ``+`` in urls

## Version 0.6.2

* Print to log whether removing arXiv stamp was successful.
* Fix bug that failed to correctly detect the pdf tool 
  ([#42](https://github.com/GjjvdBurg/paper2remarkable/issues/42)).

## Version 0.6.1

* Bugfix that makes removing the arXiv stamp more robust.

## Version 0.6.0

* The Dockerfile has been updated to use a more recent version of Cairo
  ([#35](https://github.com/GjjvdBurg/paper2remarkable/issues/35)). Thanks to 
  @ClaytonJY.
* We've added support for optionally using qpdf instead of pdftk
  ([#36](https://github.com/GjjvdBurg/paper2remarkable/pull/36)). Thanks to 
  @delaere.
* Resolving redirects has been improved, which solves an issue for the 
  Springer provider 
  ([#38](https://github.com/GjjvdBurg/paper2remarkable/pull/38)) and an issue 
  with some arXiv urls 
  ([#39](https://github.com/GjjvdBurg/paper2remarkable/pull/39)).
* Unit tests were added for the provider selection.
* The code that removes the arXiv stamp has been improved 
  ([#40](https://github.com/GjjvdBurg/paper2remarkable/pull/40)).
* Tracebacks have been disabled outside of debug mode, showing clearer errors 
  ([#41](https://github.com/GjjvdBurg/paper2remarkable/pull/41)).

## Version 0.5.6

* Be more robust against missing pdftoppm executable.

## Version 0.5.5

* Fix bug for when the shrink operation returns bigger files 
  ([#33](https://github.com/GjjvdBurg/paper2remarkable/issues/33)).

## Version 0.5.4

* Add the option to not crop the file at all
  ([#28](https://github.com/GjjvdBurg/paper2remarkable/pull/30)).
* Add the option to right-align the file so the menu doesn't overlap
  ([#28](https://github.com/GjjvdBurg/paper2remarkable/pull/31)).
* Bugfix for validation for the JMLR provider

## Version 0.5.3

* Significantly speed up the program 
  ([#26](https://github.com/GjjvdBurg/paper2remarkable/issues/26))
* Add provider for JMLR 
  ([#28](https://github.com/GjjvdBurg/paper2remarkable/pull/28)).
* Bugfix for creating nested directories with ``-p`` option.

## Version 0.5.2

* Add provider for US National Bureau of Economic Research
  ([#27](https://github.com/GjjvdBurg/paper2remarkable/pull/27)).
* Automatically extract the filename from a pdf url where possible 
  ([#25](https://github.com/GjjvdBurg/paper2remarkable/issues/25)).
* Speed up centering of pdfs by removing unnecessary cropping operation.
* Improve robustness against missing metadata, remove spaces in author names, 
  and other minor improvements.

## Version 0.5.1

* Automatically detect when a HTML source is provided 
  ([#24](https://github.com/GjjvdBurg/paper2remarkable/pull/24))

## Version 0.5.0

* Add support for articles from the web using the ``--html`` flag 
  ([#23](https://github.com/GjjvdBurg/paper2remarkable/pull/23))
* Add ``--version`` command to command line interface
* Fix cropping bug that resulted in occassional rotated pages

## Version 0.4.6

* Add support for older arXiv URL scheme

## Version 0.4.5

* Add logging of long running crop/center operations
* Keep cookies during requests
* Add wait for CiteSeerX provider
* Make determining the provider more robust (issue 
  [#21](https://github.com/GjjvdBurg/paper2remarkable/issues/21))

## Version 0.4.4

* Bugfix for creating a directory on the reMarkable 
  ([#20](https://github.com/GjjvdBurg/paper2remarkable/issues/20))

## Version 0.4.3

* Add provider for CiteSeerX
* Update provider for ACM (website redesign)
* Properly use exceptions when errors occur

## Version 0.4.2

* Add provider for Proceedings of Machine Learning Research 
  ([#8](https://github.com/GjjvdBurg/paper2remarkable/issues/8))
* Add provider for NeurIPS papers 
  ([#12](https://github.com/GjjvdBurg/paper2remarkable/issues/12))

## Version 0.4.1

* Add support for alternative arXiv URLS
* Always run all redirects on specified urls before choosing provider

## Version 0.4.0

* Refactor code to make it a real Python package
* Rename to ``paper2remarkable``
