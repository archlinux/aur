Terminfo Entries
================

:Author: Sebastian J. Bronner <waschtl@sbronner.com>
:Date: 2019-11-06
:URL: https://aur.archlinux.org/packages/st

The Problem
-----------

Most Linux-based distributions will have their terminfo entries in the
``ncurses`` package. These live in ``/usr/share/terminfo``. There you will find
several entries for ``st``. As of ``ncurses-6.1`` as packaged in ArchLinux,
these, do not work well with current versions of ``st``.

Specifically, I have observed the following issues when using the terminfo
entries supplied with ``ncurses``:

* Start ``st``.
* Run ``tmux`` in the ``st`` window.
* Run ``nvim`` in ``tmux``.

  * ``tmux`` will crash immediately with the following message:

    .. code:: console

       [lost server]
                    %

* Run ``w3m`` with any URL in ``tmux``.

  * ``w3m`` will not react to any key presses (most notably the arrow keys and
    ``q``) and must be terminated with ``killall w3m``.
  * The command line returned where ``w3m`` was running will show all the
    missing keypresses.

For reference, I performed these tests using the following software versions:
``st`` 0.8.2, ``tmux`` 2.9_a, ``neovim`` 0.4.2, and ``w3m``
0.5.3.git20190105-1.

A couple of issues have been filed against ``tmux`` for this. Although it is
not a problem with ``tmux`` the issues remain for reference:

| https://github.com/tmux/tmux/issues/1264
| https://github.com/tmux/tmux/issues/1593

Complications
-------------

While it may be tempting to use the terminfo files shipped with ``st``, that
would be a bad idea from a packaging standpoint. There are two reasons for
this: (1) As of ``st-0.8.2`` they have errors in them. This has been fixed and
will roll out in the next release, though.

| https://lists.gnu.org/archive/html/bug-ncurses/2019-10/msg00071.html
| https://lists.suckless.org/hackers/1911/17006.html

(2) It is vital that remote terminals connecting via ``ssh`` are known. That is
accomplished by having all terminfo files in one package (like ``ncurses``).

``ncurses`` has released updated terminfo entries. The problem as described
above is fixed. However, the updated terminfo entries are not installed on
ArchLinux because they were released as a standalone file without a new release
of the rest of ``ncurses``.

The Solution
------------

The solution must be to get the updated terminfo entries packaged for
ArchLinux. I believe that the ``ncurses`` package should be updated to that
effect.

https://bugs.archlinux.org/task/57596

The Workaround
--------------

A somewhat painful, albeit pragmatic, workaround is as follows: A user that
encounters issues that are due to mismatched terminfo entries, such as those
above, can populate a user-level terminfo database from the terminfo entries
supplied by ``st``. The following command will do this:

.. code:: shell

   tic -sx /usr/share/st/st.info

The generated terminfo database will most likely be placed in ``~/.terminfo``.
The command will print the actual location used. Unfortunately, these files
need to be kept up to date by hand. Actually they should probably be removed as
soon as a new version of ``ncurses`` is released.
