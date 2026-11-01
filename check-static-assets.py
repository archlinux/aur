# SPDX-License-Identifier: 0BSD
"""Exercise the rebuilt static browser assets from an installed wheel."""
from pathlib import Path
import subprocess
import sys
import tempfile

if len(sys.argv) > 1:
    assets = Path(sys.argv[1]).resolve()
else:
    import q2templates
    assets = Path(q2templates.__file__).resolve().parent / 'templates/assets'
html = '''<!doctype html><html><head><meta charset="utf-8">
<link rel="stylesheet" href="ASSETS/css/bootstrap.min.css">
<script src="ASSETS/js/jquery-3.2.0.min.js"></script>
<script src="ASSETS/js/bootstrap.min.js"></script></head><body>
<div class="container"><ul id="items"><li>A</li><li>B</li><li>C</li></ul>
<button id="toggle" class="btn btn-primary" data-toggle="button">Toggle</button>
<div id="panel" class="collapse">Panel</div><span class="glyphicon glyphicon-ok"></span></div>
<script>
window.addEventListener('load', async () => {
  try {
    function check(ok, message) { if (!ok) throw Error(message); }
    check(jQuery.fn.jquery === '3.2.0', 'jQuery version');
    check(jQuery.fn.tooltip.Constructor.VERSION === '3.3.7', 'Bootstrap version');
    check(jQuery('#items li:odd').text() === 'B', 'Sizzle selector');
    check(jQuery('#items').data('probe', 7).data('probe') === 7, 'jQuery data');
    check(await new Promise(resolve => jQuery.Deferred().resolve(9).then(resolve)) === 9,
          'jQuery deferred');
    jQuery('#toggle').button('toggle');
    check(jQuery('#toggle').hasClass('active'), 'Bootstrap button');
    jQuery('#panel').collapse({toggle:false}).collapse('show');
    await new Promise(resolve => setTimeout(resolve, 500));
    check(jQuery('#panel').hasClass('in'), 'Bootstrap collapse');
    check(getComputedStyle(document.querySelector('#toggle')).paddingTop === '6px',
          'Bootstrap compiled CSS');
    check((await document.fonts.load('14px "Glyphicons Halflings"')).length === 1,
          'Glyphicons font resource');
    document.body.dataset.result = 'PASS';
  } catch (error) { document.body.dataset.result = 'FAIL';
    document.body.appendChild(document.createTextNode(error.stack)); }
});
</script></body></html>'''.replace('ASSETS', assets.as_uri())
with tempfile.TemporaryDirectory() as directory:
    root = Path(directory)
    page = root / 'probe.html'
    page.write_text(html)
    result = subprocess.run(['chromium', '--headless', '--no-sandbox', '--disable-gpu',
                             '--disable-dev-shm-usage', '--no-first-run',
                             '--user-data-dir=' + str(root / 'profile'), '--dump-dom',
                             '--virtual-time-budget=3000', page.as_uri()],
                            capture_output=True, text=True, timeout=45)
    assert result.returncode == 0, result.stderr
    assert '<body data-result="PASS">' in result.stdout, result.stdout + result.stderr
print('PASS: installed jQuery 3.2.0 selectors/data/deferred, Bootstrap 3.3.7 button/collapse/CSS and Glyphicons font')
