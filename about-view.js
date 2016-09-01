(function() {
  var AboutView, Disposable, ScrollView, UpdateManager, shell,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ScrollView = require('atom-space-pen-views').ScrollView;

  Disposable = require('atom').Disposable;

  shell = require('electron').shell;

  UpdateManager = require('./update-manager');

  module.exports = AboutView = (function(_super) {
    __extends(AboutView, _super);

    function AboutView() {
      return AboutView.__super__.constructor.apply(this, arguments);
    }

    AboutView.content = function() {
      return this.div({
        "class": 'pane-item native-key-bindings about',
        tabindex: -1
      }, (function(_this) {
        return function() {
          return _this.div({
            "class": 'about-container'
          }, function() {
            _this.header({
              "class": 'about-header'
            }, function() {
              _this.a({
                "class": 'about-atom-io',
                href: 'https://atom.io/'
              }, function() {
                return _this.raw('<svg class="about-logo" width="330px" height="68px" viewBox="0 0 330 68" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"> <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g transform="translate(2.000000, 1.000000)"> <g transform="translate(96.000000, 8.000000)" fill="currentColor"> <path d="M185.498,3.399 C185.498,2.417 186.34,1.573 187.324,1.573 L187.674,1.573 C188.447,1.573 189.01,1.995 189.5,2.628 L208.676,30.862 L227.852,2.628 C228.272,1.995 228.905,1.573 229.676,1.573 L230.028,1.573 C231.01,1.573 231.854,2.417 231.854,3.399 L231.854,49.403 C231.854,50.387 231.01,51.231 230.028,51.231 C229.044,51.231 228.202,50.387 228.202,49.403 L228.202,8.246 L210.151,34.515 C209.729,35.148 209.237,35.428 208.606,35.428 C207.973,35.428 207.481,35.148 207.061,34.515 L189.01,8.246 L189.01,49.475 C189.01,50.457 188.237,51.231 187.254,51.231 C186.27,51.231 185.498,50.458 185.498,49.475 L185.498,3.399 L185.498,3.399 Z"></path> <path d="M113.086,26.507 L113.086,26.367 C113.086,12.952 122.99,0.941 137.881,0.941 C152.77,0.941 162.533,12.811 162.533,26.225 L162.533,26.367 C162.533,39.782 152.629,51.792 137.74,51.792 C122.85,51.792 113.086,39.923 113.086,26.507 M158.74,26.507 L158.74,26.367 C158.74,14.216 149.89,4.242 137.74,4.242 C125.588,4.242 116.879,14.075 116.879,26.225 L116.879,26.367 C116.879,38.518 125.729,48.491 137.881,48.491 C150.031,48.491 158.74,38.658 158.74,26.507"></path> <path d="M76.705,5.155 L60.972,5.155 C60.06,5.155 59.287,4.384 59.287,3.469 C59.287,2.556 60.059,1.783 60.972,1.783 L96.092,1.783 C97.004,1.783 97.778,2.555 97.778,3.469 C97.778,4.383 97.005,5.155 96.092,5.155 L80.358,5.155 L80.358,49.405 C80.358,50.387 79.516,51.231 78.532,51.231 C77.55,51.231 76.706,50.387 76.706,49.405 L76.706,5.155 L76.705,5.155 Z"></path> <path d="M0.291,48.562 L21.291,3.05 C21.783,1.995 22.485,1.292 23.75,1.292 L23.891,1.292 C25.155,1.292 25.858,1.995 26.348,3.05 L47.279,48.421 C47.49,48.843 47.56,49.194 47.56,49.546 C47.56,50.458 46.788,51.231 45.803,51.231 C44.961,51.231 44.329,50.599 43.978,49.826 L38.219,37.183 L9.21,37.183 L3.45,49.897 C3.099,50.739 2.538,51.231 1.694,51.231 C0.781,51.231 0.008,50.529 0.008,49.685 C0.009,49.404 0.08,48.983 0.291,48.562 L0.291,48.562 Z M36.673,33.882 L23.749,5.437 L10.755,33.882 L36.673,33.882 L36.673,33.882 Z"></path> </g> <g> <path d="M40.363,32.075 C40.874,34.44 39.371,36.77 37.006,37.282 C34.641,37.793 32.311,36.29 31.799,33.925 C31.289,31.56 32.791,29.23 35.156,28.718 C37.521,28.207 39.851,29.71 40.363,32.075" fill="currentColor"></path> <path d="M48.578,28.615 C56.851,45.587 58.558,61.581 52.288,64.778 C45.822,68.076 33.326,56.521 24.375,38.969 C15.424,21.418 13.409,4.518 19.874,1.221 C22.689,-0.216 26.648,1.166 30.959,4.629" stroke="currentColor" stroke-width="3.08" stroke-linecap="round"></path> <path d="M7.64,39.45 C2.806,36.94 -0.009,33.915 0.154,30.79 C0.531,23.542 16.787,18.497 36.462,19.52 C56.137,20.544 71.781,27.249 71.404,34.497 C71.241,37.622 68.127,40.338 63.06,42.333" stroke="currentColor" stroke-width="3.08" stroke-linecap="round"></path> <path d="M28.828,59.354 C23.545,63.168 18.843,64.561 15.902,62.653 C9.814,58.702 13.572,42.102 24.296,25.575 C35.02,9.048 48.649,-1.149 54.736,2.803 C57.566,4.639 58.269,9.208 57.133,15.232" stroke="currentColor" stroke-width="3.08" stroke-linecap="round"></path> </g> </g> </g> </svg>');
              });
              return _this.div({
                "class": 'about-header-info'
              }, function() {
                _this.span({
                  "class": 'about-version-container inline-block',
                  outlet: 'copyAtomVersion'
                }, function() {
                  _this.span({
                    "class": 'about-version',
                    outlet: 'atomVersion'
                  });
                  return _this.span({
                    "class": 'icon icon-clippy about-copy-version'
                  });
                });
                return _this.a({
                  "class": 'about-header-release-notes',
                  outlet: 'viewReleaseNotes'
                }, 'Release Notes');
              });
            });
            _this.div({
              "class": 'about-updates group-start',
              outlet: 'updatesContainer'
            }, function() {
              _this.div({
                "class": 'about-updates-box'
              }, function() {
                _this.div({
                  "class": 'about-updates-status'
                }, function() {
                  _this.div({
                    "class": 'about-updates-item is-shown about-default-update-message',
                    outlet: 'defaultUpdateMessage'
                  }, function() {
                    _this.span({
                      "class": 'about-updates-label about-default-enabled-update-message',
                      outlet: 'defaultEnabledUpdateMessage'
                    }, 'Atom will check for updates automatically');
                    return _this.span({
                      "class": 'about-updates-label about-default-disabled-update-message',
                      outlet: 'defaultDisabledUpdateMessage'
                    }, 'Automatic updates are disabled, please check manually');
                  });
                  _this.div({
                    "class": 'about-updates-item app-up-to-date',
                    outlet: 'upToDate'
                  }, function() {
                    _this.span({
                      "class": 'icon icon-check'
                    });
                    return _this.span({
                      "class": 'about-updates-label is-strong'
                    }, 'Atom is up to date!');
                  });
                  _this.div({
                    "class": 'about-updates-item app-checking-for-updates',
                    outlet: 'checkingForUpdates'
                  }, function() {
                    return _this.span({
                      "class": 'about-updates-label icon icon-search'
                    }, 'Checking for updates...');
                  });
                  _this.div({
                    "class": 'about-updates-item app-downloading-update',
                    outlet: 'downloadingUpdate'
                  }, function() {
                    _this.span({
                      "class": 'loading loading-spinner-tiny inline-block'
                    });
                    return _this.span({
                      "class": 'about-updates-label'
                    }, 'Downloading update');
                  });
                  _this.div({
                    "class": 'about-updates-item app-update-available-to-install',
                    outlet: 'updateAvailableToInstall'
                  }, function() {
                    _this.span({
                      "class": 'about-updates-label icon icon-squirrel'
                    }, 'New update');
                    _this.span({
                      "class": 'about-updates-version',
                      outlet: 'updateAvailableVersion'
                    }, '1.5.0');
                    return _this.a({
                      "class": 'about-updates-release-notes',
                      outlet: 'viewUpdateReleaseNotes'
                    }, 'Release Notes');
                  });
                  return _this.div({
                    "class": 'about-updates-item app-update-error',
                    outlet: 'updateError'
                  }, function() {
                    _this.span({
                      "class": 'icon icon-x'
                    });
                    return _this.span({
                      "class": 'about-updates-label app-error-message is-strong',
                      outlet: 'updateErrorMessage'
                    });
                  });
                });
                return _this.button({
                  "class": 'btn about-update-action-button',
                  outlet: 'updateActionButton'
                }, 'Check for update');
              });
              return _this.div({
                "class": 'about-auto-updates'
              }, function() {
                return _this.label(function() {
                  _this.input({
                    type: 'checkbox',
                    checked: true,
                    outlet: 'automaticallyUpdateCheckbox'
                  });
                  return _this.span('Automatically download updates');
                });
              });
            });
            _this.div({
              "class": 'about-inline'
            }, function() {
              _this.span('Atom is a hackable text editor for the 21st century, that is built using web technologies, on top of the ');
              _this.a({
                href: 'https://electron.atom.io'
              }, 'Electron');
              _this.span(' framework. This build of Atom, was built from the atom-bleeding ');
              _this.a({
                href: 'https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=atom-bleeding'
              }, 'PKGBUILD');
              _this.span(', in the ');
              _this.a({
                href: 'https://aur.archlinux.org/packages/atom-bleeding'
              }, 'Arch User Repository');
              return _this.span('.');
            });
            _this.div({
              "class": 'about-actions group-item'
            }, function() {
              return _this.div({
                "class": 'btn-group'
              }, function() {
                _this.button({
                  "class": 'btn view-license',
                  outlet: 'viewLicense'
                }, 'License');
                _this.button({
                  "class": 'btn terms-of-use',
                  outlet: 'viewTerms'
                }, 'Terms of Use');
              });
            });
            _this.div({
              "class": 'about-love group-start',
              outlet: 'love'
            }, function() {
              _this.span({
                "class": 'icon icon-code'
              });
              _this.span({
                "class": 'inline'
              }, ' with ');
              _this.span({
                "class": 'icon icon-heart'
              });
              _this.span({
                "class": 'inline'
              }, ' by ');
              return _this.a({
                "class": 'icon icon-logo-github',
                href: 'https://github.com'
              });
            });
            return _this.div({
              "class": 'about-credits group-item',
              outlet: 'credits'
            }, function() {
              _this.span({
                "class": 'inline'
              }, 'And the awesome ');
              _this.a({
                href: 'https://github.com/atom/atom/contributors'
              }, 'Atom Community');
              _this.span({
                "class": 'inline'
              }, ' and packaged for Arch Linux by ');
              _this.a({
                "class": 'inline',
                href: 'https://fusion809.github.io'
              }, 'Brenton Horne');
              _this.span({
                "class": 'inline'
              }, ' <');
              _this.a({
                "class": 'inline',
                href: 'mailto:brentonhorne77@gmail.com'
              }, 'brentonhorne77@gmail.com');
              _this.span({
                "class": 'inline'
              }, '> and Nicola Squartini <');
              _this.a({
                "class": 'inline',
                href: 'mailto:tensor5@gmail.com'
              }, 'tensor5@gmail.com');
              return _this.span({
                "class": 'inline'
              }, '>.');
            });
          });
        };
      })(this));
    };

    AboutView.prototype.onDidChangeTitle = function() {
      return new Disposable(function() {});
    };

    AboutView.prototype.onDidChangeModified = function() {
      return new Disposable(function() {});
    };

    AboutView.prototype.initialize = function(_arg) {
      this.uri = _arg.uri, this.updateManager = _arg.updateManager;
      this.handleUIEvents();
      this.handleUpdateEvents();
      return this.updateAutoUpdateElements();
    };

    AboutView.prototype.handleUIEvents = function() {
      this.atomVersion.text(atom.getVersion());
      this.copyAtomVersion.on('click', (function(_this) {
        return function() {
          return atom.clipboard.write(_this.atomVersion.text());
        };
      })(this));
      this.viewLicense.on('click', function() {
        return atom.commands.dispatch(atom.views.getView(atom.workspace), 'application:open-license');
      });
      this.viewTerms.on('click', function() {
        return shell.openExternal('https://help.github.com/articles/github-terms-of-service');
      });
      this.viewReleaseNotes.on('click', function() {
        return atom.commands.dispatch(atom.views.getView(atom.workspace), 'about:view-release-notes');
      });
      this.viewUpdateReleaseNotes.on('click', (function(_this) {
        return function() {
          return shell.openExternal(_this.updateManager.getReleaseNotesURLForAvailableVersion());
        };
      })(this));
      this.automaticallyUpdateCheckbox.on('change', function() {
        return atom.config.set('core.automaticallyUpdate', this.checked);
      });
      this.updateActionButton.on('click', (function(_this) {
        return function() {
          return _this.executeUpateActionForState(_this.updateManager.getState());
        };
      })(this));
    };

    AboutView.prototype.attached = function() {
      if (this.updateManager.getAutoUpdatesEnabled() && this.updateManager.getState() === UpdateManager.State.Idle) {
        return this.updateManager.checkForUpdate();
      }
    };

    AboutView.prototype.handleUpdateEvents = function() {
      return this.updateManager.onDidChange((function(_this) {
        return function() {
          return _this.updateAutoUpdateElements();
        };
      })(this));
    };

    AboutView.prototype.updateAutoUpdateElements = function() {
      var autoUpdatesEnabled, state;
      this.find('.about-updates-item').removeClass('is-shown');
      state = this.updateManager.getState();
      if (state === UpdateManager.State.Unsupported) {
        this.updatesContainer.hide();
      } else {
        this.updatesContainer.show();
      }
      this.updateActionButton.text(this.getUpdateActionButtonTextForState(state));
      this.updateActionButton[0].disabled = !this.getUpdateActionButtonEnablementForState(state);
      switch (state) {
        case UpdateManager.State.Idle:
          autoUpdatesEnabled = this.updateManager.getAutoUpdatesEnabled();
          this.automaticallyUpdateCheckbox[0].checked = autoUpdatesEnabled;
          if (autoUpdatesEnabled) {
            this.defaultEnabledUpdateMessage.addClass('is-shown');
            this.defaultDisabledUpdateMessage.removeClass('is-shown');
          } else {
            this.defaultEnabledUpdateMessage.removeClass('is-shown');
            this.defaultDisabledUpdateMessage.addClass('is-shown');
          }
          return this.defaultUpdateMessage.addClass('is-shown');
        case UpdateManager.State.CheckingForUpdate:
          return this.checkingForUpdates.addClass('is-shown');
        case UpdateManager.State.DownloadingUpdate:
          return this.downloadingUpdate.addClass('is-shown');
        case UpdateManager.State.UpdateAvailableToInstall:
          this.updateAvailableVersion.text(this.updateManager.getAvailableVersion());
          return this.updateAvailableToInstall.addClass('is-shown');
        case UpdateManager.State.UpToDate:
          return this.upToDate.addClass('is-shown');
        case UpdateManager.State.Error:
          this.updateErrorMessage.text(this.updateManager.getErrorMessage());
          return this.updateError.addClass('is-shown');
      }
    };

    AboutView.prototype.executeUpateActionForState = function(state) {
      switch (state) {
        case UpdateManager.State.UpdateAvailableToInstall:
          return this.updateManager.restartAndInstallUpdate();
        default:
          return this.updateManager.checkForUpdate();
      }
    };

    AboutView.prototype.getUpdateActionButtonTextForState = function(state) {
      switch (state) {
        case UpdateManager.State.UpdateAvailableToInstall:
          return 'Restart and install';
        default:
          return 'Check now';
      }
    };

    AboutView.prototype.getUpdateActionButtonEnablementForState = function(state) {
      switch (state) {
        case UpdateManager.State.CheckingForUpdate:
        case UpdateManager.State.DownloadingUpdate:
          return false;
        default:
          return true;
      }
    };

    AboutView.prototype.serialize = function() {
      return {
        deserializer: 'AboutView',
        uri: this.getURI()
      };
    };

    AboutView.prototype.getURI = function() {
      return this.uri;
    };

    AboutView.prototype.getTitle = function() {
      return 'About';
    };

    AboutView.prototype.getIconName = function() {
      return 'info';
    };

    return AboutView;

  })(ScrollView);

}).call(this);
