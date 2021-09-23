<h2>Purpose of Rename My TV Series</h2>
<p>Originally the application was built as a purpose to learn more about <a title="Lazarus Pascal - Free, Delphi 7 like, developers environment" href="https://www.lazarus-ide.org/">Lazarus Pascal</a> and cross-platform development.</p>
<p>In the meanwhile, the tool is being used be a lot of users to help them rename TV-Series files.<br />
Just keep in mind that this tool is not to promote illegal downloading or illegal sharing of copyrighted materials. It&#8217;s just a handy tool to occasionally rename some of your TV show files.</p>
<p>The philosophy is a simple work flow; you have a few odd named TV Show episodes and you&#8217;d like to give them a proper name, based on the TV Show name, season, episode and title of the episode. This has been expanded with features like resolution, year, data first aired, etc.</p>
<p>This tool by no means pretends to be anything else than just that.</p>
<p><em>Some features:</em></p>
<ul>
<li>Support the new TheTVDB.com API (v2)</li>
<li>Caching shows and banners (so reloading at the later time could go faster)</li>
<li>Dark Theme support (MacOS and Linux only, accent color observed)</li>
<li>Automatically move files into a desired directory structure</li>
<li>Define your own file and directory name format</li>
<li>Create NFO files for the TV Show and for the individual Episodes</li>
<li>Store a banner for the TV Show</li>
<li>Merge 2 Episodes into 1 (filename only of course)</li>
<li>Detection of resolution, video format, Audio and Video codec, and audio channels</li>
<li>Log file of what files have been renamed</li>
</ul>

<h2>Versions</h2>
<ul>
	<li>2.1.6-beta - No info provided<li>
  <li>2.0.6 – Bug fix with database packetsize (Replace Chars) and some minor other bug fixes</li>
  <li>2.0.5 – Bug fix similar named files<br>
  <li>2.0.4 – Bug fixes and some new features<br>
    – Fixed counter bug in list found episodes<br>
    – Added Force Refresh button (forces to redownload TheTVDB data)<br>
    – Added a splitter allowing you to resize the SelectedEpisodes and SelectedFiles lists<br>
    – Added button to reset the splitter position back to the middle<br>
    – Added # and ? to default replacement special chars to be replaced with nothing (removed)<br>
    – Added in Preferences: when double clicking a row in the “History”, that row will be removed<br>
    – Added in Preferences: Optional have no leading zero’s for the “Extras” (season 0)<br>
    – Added the option to load episodes right away when selecting a search result as an alternative to double clicking a show (see Preferences)<br>
    – Added the option to use both titles when merging 2 episodes (Eg. title 1 – title 2)<br>
    – Bug fixed: when more files are shown than episodes listed a would show name dummy for the missing episode in the list<br>
    – Renamed and repositioned some buttons in the main window (space needed for the new buttons)<br>
    – Work around for selecting from history and clicking search a second time – now shows results (removed year from edit field)<br>
    – Resolved issue with minimum number of characters for Season and Episode (for example with shows that have a year number instead of a season number)<br>
    – Fixed: For TV shows that miss a First Aired date, an attempt will be made to retrieve it from the first episode’s airdate.<br>
    – Added AutoLog option with fixed path for log files – logs will be stored in that directory automatically when this option is enabled.<br>
    – Added an optional default log location<br>
    – Added seconds to log filename (for those who are really quick)</li>
  <li>v2.0.2 – Added parameter for %NY (see below), implemented Database upgrade mechanism, improved language support</li>
  <li>v2.0.1b – Linux only: Minor refresh issue in the preferences made menus look transparent (thanks Mike for reporting!).</li>
  <li>v2.0.1 – Minor bug fixes and some cosmetic improvements mostly for macOS dark theme.</li>
  <li>v2.0.0 – Initial release of Rename My TV Series v2</li>
</ul>

<h2>Support and information</h2>
<p>I'm not the developer of this application, I just manage the build packages for the developer. Don't post bug reports here!</p>
<p>Visit https://www.tweaking4all.com/home-theatre/rename-my-tv-series-v2 for more info and bug reports.</p>

<h2>Installation</h2>
<p># git clone https://github.com/zynexiz/RenameMyTVSeries<br>
# cd RenameMyTVSeries<br>
# makepkg -i
</p><br>

<p>Alternatively, download the zip file directly and unpack it yourself before you build it.</p>
<p>KaOS users kan install the application from KCP with <b>kcp -i renamemytvseries</b> or from Octopi GUI.</p>
