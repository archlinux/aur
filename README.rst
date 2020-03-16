f5vpn for Linux
===============

The F5 VPN client can be used to connect to F5Networks BIG-IP APM 13.0.

Usage
-----

1. In a web browser, go to `<https://[your-BIG-IP-APM-server]/>`_ and log in (including 2-factor authentication, if you use it).

2. Open Developer Tools and run this JavaScript:

    .. code-block:: javascript

        snaGetLaunchLink('network_access', '/Common/Desktop-Remote_splitv6')['link']

    You should have received a URL starting with ``f5-vpn://``.

3. In a terminal, run ``f5vpn`` using the URL from Step 2 as its argument (including single quotes):

   .. code-block:: shell

        f5vpn 'f5-vpn://...'

If everything worked, the GUI for F5 VPN should be visible. Assuming continuous Internet connectivity, you should remain connected for several hours.

Known Bugs
----------

If you resize the window, it disconnects. If that happens, you can re-run the ``f5vpn`` command with the same URL as before.
