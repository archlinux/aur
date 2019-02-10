**Note:** *This a fork of the original* ``better_exceptions`` *library.
This fork is intended to fix some edge cases I reported (see*
`#47 <https://github.com/Qix-/better-exceptions/issues/47>`__), *but for
this it adds two dependencies to the project. The fixed errors are too
small to justify the addition of dependency to the main library, hence
this fork that I publish for personal use.*

better-exceptions |Travis|
==========================

Pretty and more helpful exceptions in Python, automatically.

.. image:: https://github.com/Delgan/better-exceptions/raw/master_fork/screenshot.png
    :alt: Example screenshot of exceptions

Usage
-----

Install ``better_exceptions`` via pip:

.. code:: console

    $ pip install better_exceptions

And set the ``BETTER_EXCEPTIONS`` environment variable to any value:

.. code:: bash

    export BETTER_EXCEPTIONS=1  # Linux / OSX
    setx BETTER_EXCEPTIONS 1    # Windows

That's it!

Python REPL (Interactive Shell)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to use ``better_exceptions`` in the Python REPL, first install the
package (as instructed above) and run:

.. code:: console

    $ python -m better_exceptions
    Type "help", "copyright", "credits" or "license" for more information.
    (BetterExceptionsConsole)
    >>>

in order to drop into a ``better_exceptions``-enabled Python interactive shell.

Advanced Usage
~~~~~~~~~~~~~~

If you want to allow the entirety of values to be outputted instead of
being truncated to a certain amount of characters:

.. code:: python

    import better_exceptions
    better_exceptions.MAX_LENGTH = None

While using ``better_exceptions`` in production, do not forget to unset
the ``BETTER_EXCEPTIONS`` variable to avoid leaking sensitive data in
your logs.

Troubleshooting
---------------

If you do not see beautiful exceptions, first make sure that the
environment variable does exist. You can try ``echo $BETTER_EXCEPTIONS``
(Linux / OSX) or ``echo %BETTER_EXCEPTIONS%`` (Windows). On Linux and
OSX, the ``export`` command does not add the variable permanently, you
will probably need to edit the ``~/.profile`` file to make it
persistent. On Windows, you need to open a new terminal after the
``setx`` command.

Check that there is no conflict with another library, and that the
``sys.excepthook`` function has been correctly replaced with the
``better_exceptions``'s one. Sometimes other components can set up their
own exception handlers, such as the ``python3-apport`` Ubuntu package
that you may need to uninstall.

Make sure that you have not inadvertently deleted the
``better_exceptions_hook.pth`` file that should be in the same place as
the ``better_exceptions`` folder where all of your Python packages are
installed. Otherwise, try re-installing ``better_exceptions``.

You can also try to manually activate the hook by adding
``import better_exceptions; better_exceptions.hook()`` at the beginning
of your script.

Finally, if you still can not get this module to work, `open a new
issue <https://github.com/Qix-/better-exceptions/issues/new>`__ by
describing your problem precisely and detailing your configuration
(Python and ``better_exceptions`` versions, OS, code snippet,
interpeter, etc.) so that we can reproduce the bug you are experiencing.

License
=======

Copyright © 2017, Josh Junon. Licensed under the `MIT
license <LICENSE.txt>`__.

.. |Travis| image:: https://img.shields.io/travis/Delgan/better-exceptions.svg?style=flat-square
   :target: https://travis-ci.org/Delgan/better-exceptions
