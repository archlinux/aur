Terminfo Entries
================

:Author: Sebastian J. Bronner <waschtl@sbronner.com>
:Date: 2019-10-30
:URL: https://aur.archlinux.org/packages/st

The Problem
-----------

Most Linux-based distributions will have the bulk of their terminfo entries in
the ``ncurses`` package. These live in ``/usr/share/terminfo``. There you will
find several entries for ``st``. These, however, do not work well with current
versions of ``st``. You need the terminfo entries supplied with ``st``.

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

The Solution
------------

The ``ncurses`` package should stop shipping terminfo entries for ``st``. These
should then be provided in ``/usr/share/terminfo`` by this (and other) ``st``
packages. The conflicting terminfo entries are

* ``st`` and
* ``st-256color``.

Additional entries that could be considered for removal from ``ncurses`` are

* ``st-0.6``,
* ``st-0.7``,
* ``st-16color``,
* ``st-direct``,
* ``stterm`` (for distributions that rename ``st`` to ``stterm``),
* ``stterm-16color``, and
* ``stterm-256color``.

This solution cannot be implemented without the cooperation of ``ncurses``
since many distributions (including Arch Linux) do not allow for two packages
that provide files with identical paths to be installed side-by-side.
Therefore, I am bringing this to the attention of the ``ncurses`` team.

The Workaround
--------------

A somewhat painful, albeit pragmatic, workaround is as follows: A user that
encounters issues that are due to mismatched terminfo entries, such as those
above, can symlink the terminfo entries included in this package into her
user-level terminfo database using the following commands:

.. code:: shell

   mkdir ~/.terminfo/s
   ln -s /usr/share/st/terminfo/s/* ~/.terminfo/s
