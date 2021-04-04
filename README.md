# Librewolf 

When librewolf's defaults are way to strict and your custom values are lost during update.

Disable cfg values and polies by making sure they are commented out :)

Very simple design, feed a list of values and the hooks will sed it out.

## Why would you want this?

The browser [librewolf](https://librewolf-community.gitlab.io/) 
comes with very opinionated defaults. 
The defaults are fine tuned for maximum privacy and security but you might find 
few settings and policies that goes against your usecase.

For example, you might want
 * to enable DRM
 * to enable Firefox Sync for bookmarks only
 * to enable WebGL
 * to disable titlebar paint for dark GTK themes

This hook package will allow you to unblock defaults that are blocked
by `librewolf.cfg` and `policies.json` post install.

If there is a entry blocking you in any way, 
this package will allow you to undo the hardoced values. 

** But keep in mind ** 
It's not for setting up your values. 
You should do create a new files with your custom prefs yourself.

Put your created files here
```
$ ls /usr/lib/librewolf/browser/defaults/preferences 
ctrl-q-disable.js          urlbar-suggestions.js  wayland.js
disable-drawInTiltebar.js 
```

## How it works

Any values blocked by `librewolf.cfg` and `policies.json` can be *unblocked* 
by commenting out the said value.

Many setting from `librewolf.cfg` and `policies.json` cannot bet set via `*.js` 
file at `$HOME/.librewolf` or at `/usr/lib/librewolf`

Basically this package will put 2 pacman hooks into the ALPM directories.

The first hook `/usr/share/libalpm/hooks/librewolf-cfg-comment-out.hook` 
will be applied post install of this package and post upgrade of Librewolf itself.

The second hook `/usr/share/libalpm/hooks/librewolf-cfg-uncomment-out.hook` will
undo every modification from first hook prior the Librewolf update. 

It's there to basically return the `librewolf.cfg` and `policies.json` 
back to stock to prevent any `*.pacnew` files from being created by deault.

Note - currently there is no backup() in the PKGBUILD of librewolf so uncomment-hook
is redundant, however that might change in future.

## Caveats and what to take pay more attention

`librewolf.cfg` states 

```
// "pref"           : Sets the preference as if a user had set it, every time you start the browser. So users can make changes,
//                    but they will be erased on restart. If you set a particular preference this way,
//                    it shows up in about:config as "user set".
```

however, any function call `pref();` from a `/usr/lib/librewolf/browser/defaults/preferences/*.js`
does behave more or less like "defaultPref" instead, so user changes done via GUI will be kept on restart.

Also `lockPref, lock_pref, defaultPref, default_pref` are not working function calls in `/usr/lib/librewolf/browser/defaults/preferences/*.js` so they have no effect but does work at `$HOME/.librewolf/user-profile/user.js`.


## TODOs for future? 

I am mostly responsive on mail `dach@protonmail.com` don't hesitate to ask, send PR or issue to me.

### Implementing some sort value changer for policies

Currently the `policies.json` can only comment out keys, not change a value.

The only scenario I can imagine that there is policy being set by librewolf 
	and is the same as the firefox default. 
You might want to set a different value.

Not implemented due to high complexity. Validating json + multiline parsing.


