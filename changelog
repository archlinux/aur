### Added

* Support for WoW 'Forever'
    - detected from `release.json` files, `_Camelot.toc` files and interface versions `16000` to `19999`
    - Forever falls back to Retail when 'Strict' is unchecked

### Changed

* URLs are parsed more strictly, malformed URLs such as `http://` are no longer accepted
* Linting now covers the whole project on every run, not just recently modified files
* README game track priorities updated with Mists and Forever

### Fixed

* Interface versions with a two digit minor or patch version are converted correctly
    - for example, `11507` is now `1.15.7` rather than `1.5.7`
* The 'no release found' warning now names the addon host correctly when 'Strict' is unchecked
* Deprecation warnings from newer JDK and JavaFX versions
* Linting no longer hangs after a run with no warnings
* Tests and linting no longer conflict with an X display already in use
* A partially drawn log pane no longer appears over the installed addons after resizing the window
* Remaining non-determinism in test `utils_test/with-lock--contention`
    - the test now runs its scenario 300 times to catch any recurrence
