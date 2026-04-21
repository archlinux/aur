f5vpn for Linux
===============

The F5 VPN client uses the Point-to-Point Protocol to connect to F5Networks BIG-IP APM 13.0.

Usage
-----

1. In a web browser, go to `<https://[your-BIG-IP-APM-server]/>`_ and log in (including 2-factor authentication, if you use it).

2. Choose Web Network Access. If this works for you, the following steps do not apply to you.
   If you prefer connecting from the command line, open Developer Tools and run this JavaScript:

   .. code-block:: javascript

       resourceType = "network_access";
       with (new XMLHttpRequest()) with (location) {
           open("GET", `https://${host}:${port}/vdesk/resource_list.xml?resourcetype=res`);
           onload = () => console.log(`f5-vpn://${host}:${port || 443}/?server=${host}&resourcename=${responseXML.querySelector(`list[type=${resourceType}] entry`).textContent}&resourcetype=${resourceType}&cmd=launch&protocol=https&port=${port || 443}&sid=${document.cookie.match(/MRHSession=(.*?); /)[1]}`);
           send();
       }

   You should have received a URL starting with ``f5-vpn://``.

3. In a terminal, run ``f5vpn`` using the URL from Step 2 as its argument (including single quotes):

   .. code-block:: shell

        f5vpn 'f5-vpn://...'

If everything worked, the GUI for F5 VPN should be visible. Assuming continuous Internet connectivity, you should remain connected for several hours.

CLI-Only Alternatives
---------------------

* `kayrus/gof5 <https://github.com/kayrus/gof5>`_ - FOSS

* `openvpn <https://www.infradead.org/openconnect/f5.html>`_ - FOSS (example supporting 2FA: ``echo MRHSession=0123456789abcdef0123456789abcdef | sudo openconnect --protocol=f5 --cookie-on-stdin your-BIG-IP-APM-server``)

* `zrhoffman/svpn-login <https://github.com/zrhoffman/svpn-login>`_ CLI wrapper for ``svpn``, the proprietary ``f5vpn`` backend
