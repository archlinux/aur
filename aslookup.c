<!DOCTYPE html>
<html lang="en-US" data-theme="codeberg-auto">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>aslookup/aslookup.c at main - nieldk/aslookup - Codeberg.org</title>
	<link rel="manifest" href="data:application/json;base64,eyJuYW1lIjoiQ29kZWJlcmcub3JnIiwic2hvcnRfbmFtZSI6IkNvZGViZXJnLm9yZyIsInN0YXJ0X3VybCI6Imh0dHBzOi8vY29kZWJlcmcub3JnLyIsImljb25zIjpbeyJzcmMiOiJodHRwczovL2NvZGViZXJnLm9yZy9hc3NldHMvaW1nL2xvZ28ucG5nIiwidHlwZSI6ImltYWdlL3BuZyIsInNpemVzIjoiNTEyeDUxMiJ9LHsic3JjIjoiaHR0cHM6Ly9jb2RlYmVyZy5vcmcvYXNzZXRzL2ltZy9sb2dvLnN2ZyIsInR5cGUiOiJpbWFnZS9zdmcreG1sIiwic2l6ZXMiOiI1MTJ4NTEyIn1dfQ==">
	<meta name="author" content="nieldk">
	<meta name="description" content="aslookup - tool for getting ASN, IP blocks and contact information for a given IP or domain">
	<meta name="keywords" content="git,non-profit,foss,oss,free,software,open,source,code,hosting">
	<meta name="referrer" content="no-referrer">


	<link rel="alternate" type="application/atom+xml" title="" href="/nieldk/aslookup.atom">
	<link rel="alternate" type="application/rss+xml" title="" href="/nieldk/aslookup.rss">

	<link rel="icon" href="/assets/img/favicon.svg" type="image/svg+xml">
	<link rel="alternate icon" href="/assets/img/favicon.png" type="image/png">
	
<script>
	
	window.addEventListener('error', function(e) {window._globalHandlerErrors=window._globalHandlerErrors||[]; window._globalHandlerErrors.push(e);});
	window.addEventListener('unhandledrejection', function(e) {window._globalHandlerErrors=window._globalHandlerErrors||[]; window._globalHandlerErrors.push(e);});
	window.config = {
		appUrl: 'https:\/\/codeberg.org\/',
		appSubUrl: '',
		assetVersionEncoded: encodeURIComponent('13.0.0-dev-651-a48dce80~gitea-1.22.0'), 
		assetUrlPrefix: '\/assets',
		runModeIsProd:  true ,
		customEmojis: new Set(["git","gitea","codeberg","gitlab","github","gogs","forgejo"]),
		csrfToken: '7dAF-1jBbNEz7ZSoOCRp_gbb8UI6MTc2NDY3MTk2ODI4NTk5NjM3Mw',
		pageData: {"DATETIMESTRINGS":{"FUTURE":"in future","NOW":"now","relativetime.1day":"yesterday","relativetime.1month":"last month","relativetime.1week":"last week","relativetime.1year":"last year","relativetime.2days":"two days ago","relativetime.2months":"two months ago","relativetime.2weeks":"two weeks ago","relativetime.2years":"two years ago"},"PLURALSTRINGS_FALLBACK":{},"PLURALSTRINGS_LANG":{"relativetime.days":["%d day ago","%d days ago"],"relativetime.hours":["%d hour ago","%d hours ago"],"relativetime.mins":["%d minute ago","%d minutes ago"],"relativetime.months":["%d month ago","%d months ago"],"relativetime.weeks":["%d week ago","%d weeks ago"],"relativetime.years":["%d year ago","%d years ago"]},"PLURAL_RULE_FALLBACK":0,"PLURAL_RULE_LANG":0},
		notificationSettings: {"EventSourceUpdateTime":10000,"MaxTimeout":60000,"MinTimeout":10000,"TimeoutStep":10000}, 
		enableTimeTracking:  true ,
		
		mermaidMaxSourceCharacters:  50000 ,
		
		i18n: {
			copy_success: "Copied!",
			copy_error: "Copy failed",
			error_occurred: "An error occurred",
			network_error: "Network error",
			remove_label_str: "Remove item \"%s\"",
			modal_confirm: "Confirm",
			modal_cancel: "Cancel",
			more_items: "More items",
			incorrect_root_url: "This Forgejo instance is configured to be served on \"https://codeberg.org/\". You are currently viewing Forgejo through a different URL, which may cause parts of the application to break. The canonical URL is controlled by Forgejo admins via the ROOT_URL setting in the app.ini.",
		},
	};
	
	window.config.pageData = window.config.pageData || {};
</script>
<script src="/assets/js/webcomponents.js?v=13.0.0-dev-651-a48dce80~gitea-1.22.0"></script>

	

	
	<meta property="og:title" content="aslookup/aslookup.c at main">


	<meta property="og:url" content="https://codeberg.org//nieldk/aslookup/src/branch/main/aslookup.c">


	<meta property="og:type" content="object">


	<meta property="og:image" content="https://codeberg.org/nieldk/aslookup/-/summary-card">
	
		<meta property="og:image:width" content="1200">
	
	
		<meta property="og:image:height" content="600">
	
	
		<meta property="og:image:alt" content="Summary card of repository nieldk/aslookup, described as: tool for getting ASN, IP blocks and contact information for a given IP or domain">
	

<meta property="og:site_name" content="Codeberg.org">

	<link rel="stylesheet" href="/assets/css/index.css?v=13.0.0-dev-651-a48dce80~gitea-1.22.0">
<link rel="stylesheet" href="/assets/css/theme-codeberg-auto.css?v=13.0.0-dev-651-a48dce80~gitea-1.22.0">

	
</head>
<body class="no-js" hx-headers='{"x-csrf-token": "7dAF-1jBbNEz7ZSoOCRp_gbb8UI6MTc2NDY3MTk2ODI4NTk5NjM3Mw"}' hx-swap="outerHTML" hx-ext="morph" hx-push-url="false">
	
	<noscript>
		<style>
			#tou-announcement { display: flex !important; justify-content: center; }
			#tou-announcement > :first-child, #tou-announcement > :last-child { display: none; }
		</style>
	</noscript>
	<div id="tou-announcement" class="tw-hidden">
		<div style="width: 108.3px"></div>
		<span>Codeberg has changed its Terms of Use to allow more licenses for your projects. For more information, read <a href="https://blog.codeberg.org/letter-from-codeberg-onwards-and-upwards.html">our blog post</a>.</span>
		<button class="ui secondary button small"><svg viewBox="0 0 16 16" class="svg octicon-x" aria-hidden="true" width="16" height="16"><path d="M3.72 3.72a.75.75 0 0 1 1.06 0L8 6.94l3.22-3.22a.749.749 0 0 1 1.275.326.75.75 0 0 1-.215.734L9.06 8l3.22 3.22a.749.749 0 0 1-.326 1.275.75.75 0 0 1-.734-.215L8 9.06l-3.22 3.22a.75.75 0 0 1-1.042-.018.75.75 0 0 1-.018-1.042L6.94 8 3.72 4.78a.75.75 0 0 1 0-1.06"/></svg> Dismiss</button>
	</div>
	<div class="full height">
		<noscript>
			<div class="tw-ml-2 tw-mr-2 tw-text-center tw-text-text-light-2">This website requires JavaScript.</div>
		</noscript>

		

		
			


<nav id="navbar" aria-label="Navigation bar">
	<div class="navbar-left ui secondary menu">
		
		<a class="item" id="navbar-logo" href="/" aria-label="Home">
			<img width="30" height="30" src="https://design.codeberg.org/logo-kit/icon_inverted.svg" aria-hidden="true">
		</a>

		
		<div class="ui secondary menu item navbar-mobile-right only-mobile">
			
			<button class="item tw-w-auto ui icon mini button tw-p-2 tw-m-0" id="navbar-expand-toggle" aria-label="Toggle menu"><svg viewBox="0 0 16 16" class="svg octicon-three-bars" aria-hidden="true" width="16" height="16"><path d="M1 2.75A.75.75 0 0 1 1.75 2h12.5a.75.75 0 0 1 0 1.5H1.75A.75.75 0 0 1 1 2.75m0 5A.75.75 0 0 1 1.75 7h12.5a.75.75 0 0 1 0 1.5H1.75A.75.75 0 0 1 1 7.75M1.75 12h12.5a.75.75 0 0 1 0 1.5H1.75a.75.75 0 0 1 0-1.5"/></svg></button>
		</div>

		
		
			<a class="item" href="/explore/repos">Explore</a>
		

		
			<a class="item" target="_blank" href="https://docs.codeberg.org/getting-started/what-is-codeberg/#what-is-codeberg-e.v.%3F">About</a>
			<a class="item" target="_blank" href="https://docs.codeberg.org/getting-started/faq/">FAQ</a>
			<a class="item" target="_blank" rel="noopener noreferrer" href="https://docs.codeberg.org">Help</a>
		

		<a class="item donation-pretty" href="https://donate.codeberg.org">Donate</a>

	</div>

	
	<div class="navbar-right ui secondary menu">
		
			
				<a class="item" href="/user/sign_up">
					<svg viewBox="0 0 16 16" class="tw-mr-1 svg octicon-person" aria-hidden="true" width="16" height="16"><path d="M10.561 8.073a6 6 0 0 1 3.432 5.142.75.75 0 1 1-1.498.07 4.5 4.5 0 0 0-8.99 0 .75.75 0 0 1-1.498-.07 6 6 0 0 1 3.431-5.142 3.999 3.999 0 1 1 5.123 0M10.5 5a2.5 2.5 0 1 0-5 0 2.5 2.5 0 0 0 5 0"/></svg>
					<span>Register</span>
				</a>
			
			<a class="item" rel="nofollow" href="/user/login?redirect_to=%2fnieldk%2faslookup%2fsrc%2fbranch%2fmain%2faslookup.c">
				<svg viewBox="0 0 16 16" class="tw-mr-1 svg octicon-sign-in" aria-hidden="true" width="16" height="16"><path d="M2 2.75C2 1.784 2.784 1 3.75 1h2.5a.75.75 0 0 1 0 1.5h-2.5a.25.25 0 0 0-.25.25v10.5c0 .138.112.25.25.25h2.5a.75.75 0 0 1 0 1.5h-2.5A1.75 1.75 0 0 1 2 13.25Zm6.56 4.5h5.69a.75.75 0 0 1 0 1.5H8.56l1.97 1.97a.749.749 0 0 1-.326 1.275.75.75 0 0 1-.734-.215L6.22 8.53a.75.75 0 0 1 0-1.06l3.25-3.25a.749.749 0 0 1 1.275.326.75.75 0 0 1-.215.734Z"/></svg>
				<span>Sign in</span>
			</a>
		
	</div>
</nav>

		



<div role="main" aria-label="aslookup/aslookup.c at main" class="page-content repository file list ">
	<div class="secondary-nav">

	<div class="ui container">
		<div class="repo-header">
			<div class="flex-item tw-items-center">
				<div class="flex-item-leading">
					

	<svg viewBox="0 0 16 16" class="svg octicon-repo" aria-hidden="true" width="24" height="24"><path d="M2 2.5A2.5 2.5 0 0 1 4.5 0h8.75a.75.75 0 0 1 .75.75v12.5a.75.75 0 0 1-.75.75h-2.5a.75.75 0 0 1 0-1.5h1.75v-2h-8a1 1 0 0 0-.714 1.7.75.75 0 1 1-1.072 1.05A2.5 2.5 0 0 1 2 11.5Zm10.5-1h-8a1 1 0 0 0-1 1v6.708A2.5 2.5 0 0 1 4.5 9h8ZM5 12.25a.25.25 0 0 1 .25-.25h3.5a.25.25 0 0 1 .25.25v3.25a.25.25 0 0 1-.4.2l-1.45-1.087a.25.25 0 0 0-.3 0L5.4 15.7a.25.25 0 0 1-.4-.2Z"/></svg>


				</div>
				<div class="flex-item-main">
					<div class="flex-item-title gt-font-18">
						<a class="muted gt-font-normal" href="/nieldk">nieldk</a>/<a class="muted" href="/nieldk/aslookup">aslookup</a>
					</div>
				</div>
				<div class="flex-item-trailing">
					
					
						
					
					
					
				</div>
			</div>
			
				<div class="repo-buttons button-row">
					
					
					
					
					<a class="ui compact small basic button" href="/nieldk/aslookup.rss" data-tooltip-content="RSS feed">
						<svg viewBox="0 0 16 16" class="svg octicon-rss" aria-hidden="true" width="16" height="16"><path d="M2.002 2.725a.75.75 0 0 1 .797-.699C8.79 2.42 13.58 7.21 13.974 13.201a.75.75 0 0 1-1.497.098 10.5 10.5 0 0 0-9.776-9.776.747.747 0 0 1-.7-.798ZM2.84 7.05h-.002a7 7 0 0 1 6.113 6.111.75.75 0 0 1-1.49.178 5.5 5.5 0 0 0-4.8-4.8.75.75 0 0 1 .179-1.489M2 13a1 1 0 1 1 2 0 1 1 0 0 1-2 0"/></svg>
					</a>
					
					<form hx-boost="true" hx-target="this" method="post" action="/nieldk/aslookup/action/watch">
	<div class="ui labeled button" data-tooltip-content="Sign in to watch this repository.">
		<button type="submit" class="ui compact small basic button" disabled>
			
				<svg viewBox="0 0 16 16" class="svg octicon-eye" aria-hidden="true" width="16" height="16"><path d="M8 2c1.981 0 3.671.992 4.933 2.078 1.27 1.091 2.187 2.345 2.637 3.023a1.62 1.62 0 0 1 0 1.798c-.45.678-1.367 1.932-2.637 3.023C11.67 13.008 9.981 14 8 14s-3.671-.992-4.933-2.078C1.797 10.83.88 9.576.43 8.898a1.62 1.62 0 0 1 0-1.798c.45-.677 1.367-1.931 2.637-3.022C4.33 2.992 6.019 2 8 2M1.679 7.932a.12.12 0 0 0 0 .136c.411.622 1.241 1.75 2.366 2.717C5.176 11.758 6.527 12.5 8 12.5s2.825-.742 3.955-1.715c1.124-.967 1.954-2.096 2.366-2.717a.12.12 0 0 0 0-.136c-.412-.621-1.242-1.75-2.366-2.717C10.824 4.242 9.473 3.5 8 3.5s-2.825.742-3.955 1.715c-1.124.967-1.954 2.096-2.366 2.717M8 10a2 2 0 1 1-.001-3.999A2 2 0 0 1 8 10"/></svg><span class="text not-mobile">Watch</span>
			
		</button>
		<a hx-boost="false" class="ui basic label" href="/nieldk/aslookup/watchers">
			1
		</a>
	</div>
</form>

					
					<form hx-boost="true" hx-target="this" method="post" action="/nieldk/aslookup/action/star">
	<div class="ui labeled button" data-tooltip-content="Sign in to star this repository.">
		<button type="submit" class="ui compact small basic button" disabled>
			
				<svg viewBox="0 0 16 16" class="svg octicon-star" aria-hidden="true" width="16" height="16"><path d="M8 .25a.75.75 0 0 1 .673.418l1.882 3.815 4.21.612a.75.75 0 0 1 .416 1.279l-3.046 2.97.719 4.192a.751.751 0 0 1-1.088.791L8 12.347l-3.766 1.98a.75.75 0 0 1-1.088-.79l.72-4.194L.818 6.374a.75.75 0 0 1 .416-1.28l4.21-.611L7.327.668A.75.75 0 0 1 8 .25m0 2.445L6.615 5.5a.75.75 0 0 1-.564.41l-3.097.45 2.24 2.184a.75.75 0 0 1 .216.664l-.528 3.084 2.769-1.456a.75.75 0 0 1 .698 0l2.77 1.456-.53-3.084a.75.75 0 0 1 .216-.664l2.24-2.183-3.096-.45a.75.75 0 0 1-.564-.41z"/></svg><span class="text not-mobile">Star</span>
			
		</button>
		<a hx-boost="false" class="ui basic label" href="/nieldk/aslookup/stars">
			1
		</a>
	</div>
</form>

					
					
					

	<div class="ui labeled button
		
			disabled
		"
		
			data-tooltip-content="Sign in to fork this repository."
		
	>
		<a class="ui compact small basic button"
			
				
			
		>
			<svg viewBox="0 0 16 16" class="svg octicon-repo-forked" aria-hidden="true" width="16" height="16"><path d="M5 5.372v.878c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75v-.878a2.25 2.25 0 1 1 1.5 0v.878a2.25 2.25 0 0 1-2.25 2.25h-1.5v2.128a2.251 2.251 0 1 1-1.5 0V8.5h-1.5A2.25 2.25 0 0 1 3.5 6.25v-.878a2.25 2.25 0 1 1 1.5 0M5 3.25a.75.75 0 1 0-1.5 0 .75.75 0 0 0 1.5 0m6.75.75a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5m-3 8.75a.75.75 0 1 0-1.5 0 .75.75 0 0 0 1.5 0"/></svg><span class="text not-mobile">Fork</span>
		</a>
		<div class="ui small modal" id="fork-repo-modal">
			<div class="header">
				You've already forked aslookup
			</div>
			<div class="content tw-text-left">
				<div class="ui list">
					
				</div>
				
			</div>
		</div>
		<a class="ui basic label" href="/nieldk/aslookup/forks">
			0
		</a>
	</div>



					
					
				</div>
			
		</div>
		
		
		
	</div>

	<overflow-menu class="ui container secondary pointing tabular top attached borderless menu tw-pt-0 tw-my-0">
		
			<div class="overflow-menu-items">
				
					<a class="active item" href="/nieldk/aslookup">
						<svg viewBox="0 0 16 16" class="svg octicon-code" aria-hidden="true" width="16" height="16"><path d="m11.28 3.22 4.25 4.25a.75.75 0 0 1 0 1.06l-4.25 4.25a.749.749 0 0 1-1.275-.326.75.75 0 0 1 .215-.734L13.94 8l-3.72-3.72a.749.749 0 0 1 .326-1.275.75.75 0 0 1 .734.215m-6.56 0a.75.75 0 0 1 1.042.018.75.75 0 0 1 .018 1.042L2.06 8l3.72 3.72a.749.749 0 0 1-.326 1.275.75.75 0 0 1-.734-.215L.47 8.53a.75.75 0 0 1 0-1.06Z"/></svg> Code
					</a>
				

				
					<a class="item" href="/nieldk/aslookup/issues">
						<svg viewBox="0 0 16 16" class="svg octicon-issue-opened" aria-hidden="true" width="16" height="16"><path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3"/><path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M1.5 8a6.5 6.5 0 1 0 13 0 6.5 6.5 0 0 0-13 0"/></svg> Issues
						
					</a>
				

				

				
					<a class="item" href="/nieldk/aslookup/pulls">
						<svg viewBox="0 0 16 16" class="svg octicon-git-pull-request" aria-hidden="true" width="16" height="16"><path d="M1.5 3.25a2.25 2.25 0 1 1 3 2.122v5.256a2.251 2.251 0 1 1-1.5 0V5.372A2.25 2.25 0 0 1 1.5 3.25m5.677-.177L9.573.677A.25.25 0 0 1 10 .854V2.5h1A2.5 2.5 0 0 1 13.5 5v5.628a2.251 2.251 0 1 1-1.5 0V5a1 1 0 0 0-1-1h-1v1.646a.25.25 0 0 1-.427.177L7.177 3.427a.25.25 0 0 1 0-.354M3.75 2.5a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5m0 9.5a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5m8.25.75a.75.75 0 1 0 1.5 0 .75.75 0 0 0-1.5 0"/></svg> Pull requests
						
					</a>
				

				

				
					<a class="item" href="/nieldk/aslookup/releases">
						<svg viewBox="0 0 16 16" class="svg octicon-tag" aria-hidden="true" width="16" height="16"><path d="M1 7.775V2.75C1 1.784 1.784 1 2.75 1h5.025c.464 0 .91.184 1.238.513l6.25 6.25a1.75 1.75 0 0 1 0 2.474l-5.026 5.026a1.75 1.75 0 0 1-2.474 0l-6.25-6.25A1.75 1.75 0 0 1 1 7.775m1.5 0c0 .066.026.13.073.177l6.25 6.25a.25.25 0 0 0 .354 0l5.025-5.025a.25.25 0 0 0 0-.354l-6.25-6.25a.25.25 0 0 0-.177-.073H2.75a.25.25 0 0 0-.25.25ZM6 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/></svg> Releases
						
							<span class="ui small label">2</span>
						
					</a>
				

				

				

				

				
					<a class="item" href="/nieldk/aslookup/activity">
						<svg viewBox="0 0 16 16" class="svg octicon-pulse" aria-hidden="true" width="16" height="16"><path d="M6 2c.306 0 .582.187.696.471L10 10.731l1.304-3.26A.75.75 0 0 1 12 7h3.25a.75.75 0 0 1 0 1.5h-2.742l-1.812 4.528a.751.751 0 0 1-1.392 0L6 4.77 4.696 8.03A.75.75 0 0 1 4 8.5H.75a.75.75 0 0 1 0-1.5h2.742l1.812-4.529A.75.75 0 0 1 6 2"/></svg> Activity
					</a>
				

				
					<a class="item" href="/nieldk/aslookup/actions">
						<svg viewBox="0 0 16 16" class="svg octicon-play" aria-hidden="true" width="16" height="16"><path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M1.5 8a6.5 6.5 0 1 0 13 0 6.5 6.5 0 0 0-13 0m4.879-2.773 4.264 2.559a.25.25 0 0 1 0 .428l-4.264 2.559A.25.25 0 0 1 6 10.559V5.442a.25.25 0 0 1 .379-.215"/></svg> Actions
						
					</a>
				

				

				

				
			</div>
		
	</overflow-menu>
	<div class="ui tabs divider"></div>
</div>

	<div class="ui container ">
		




	<div id="flash-message" hx-swap-oob="true"></div>


		
		

		
		










		
		

		
		
		
		<div class="repo-button-row">
			<div class="tw-gap-y-2 button-sequence">
				






	




<script type="module">
	const data = {
		'textReleaseCompare': "Compare",
		'textCreateTag': "Create tag %s",
		'textCreateBranch': "Create branch %s",
		'textCreateBranchFrom': "from \"%s\"",
		'textBranches': "Branches",
		'textTags': "Tags",
		'textDefaultBranchLabel': "default",

		'mode': 'branches',
		'showBranchesInDropdown':  true ,
		'searchFieldPlaceholder': 'Filter branch or tag...',
		'branchForm':  null ,
		'disableCreateBranch':  true ,
		'setAction':  null ,
		'submitForm':  null ,
		'viewType': "branch",
		'refName': "main",
		'commitIdShort': "1629e85f85",
		'tagName': "",
		'branchName': "main",
		'noTag':  null ,
		'defaultSelectedRefName': "main",
		'repoDefaultBranch': "main",
		'enableFeed':  true ,
		'rssURLPrefix': '\/nieldk\/aslookup/rss/branch/',
		'branchURLPrefix': '\/nieldk\/aslookup/src/branch/',
		'branchURLSuffix': '/aslookup.c',
		'tagURLPrefix': '\/nieldk\/aslookup/src/tag/',
		'tagURLSuffix': '/aslookup.c',
		'repoLink': "/nieldk/aslookup",
		'treePath': "aslookup.c",
		'branchNameSubURL': "branch/main",
		'noResults': "No results found.",
	};
	
	window.config.pageData.branchDropdownDataList = window.config.pageData.branchDropdownDataList || [];
	window.config.pageData.branchDropdownDataList.push(data);
</script>

<div class="js-branch-tag-selector ">
	
	<div class="ui dropdown custom">
		<button class="branch-dropdown-button gt-ellipsis ui basic small compact button tw-flex tw-m-0">
			<span class="text tw-flex tw-items-center tw-mr-1 gt-ellipsis">
				
					
						<svg viewBox="0 0 16 16" class="svg octicon-git-branch" aria-hidden="true" width="16" height="16"><path d="M9.5 3.25a2.25 2.25 0 1 1 3 2.122V6A2.5 2.5 0 0 1 10 8.5H6a1 1 0 0 0-1 1v1.128a2.251 2.251 0 1 1-1.5 0V5.372a2.25 2.25 0 1 1 1.5 0v1.836A2.5 2.5 0 0 1 6 7h4a1 1 0 0 0 1-1v-.628A2.25 2.25 0 0 1 9.5 3.25m-6 0a.75.75 0 1 0 1.5 0 .75.75 0 0 0-1.5 0m8.25-.75a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5M4.25 12a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5"/></svg>
					
					<strong ref="dropdownRefName" class="tw-ml-2 tw-inline-block gt-ellipsis">main</strong>
				
			</span>
			<svg viewBox="0 0 16 16" class="dropdown icon svg octicon-triangle-down" aria-hidden="true" width="14" height="14"><path d="m4.427 7.427 3.396 3.396a.25.25 0 0 0 .354 0l3.396-3.396A.25.25 0 0 0 11.396 7H4.604a.25.25 0 0 0-.177.427"/></svg>
		</button>
	</div>
</div>

				
					
					
					
					
					<a id="new-pull-request" role="button" class="ui compact basic button" href="/nieldk/aslookup/compare/main...main"
						data-tooltip-content="Compare">
						<svg viewBox="0 0 16 16" class="svg octicon-git-pull-request" aria-hidden="true" width="16" height="16"><path d="M1.5 3.25a2.25 2.25 0 1 1 3 2.122v5.256a2.251 2.251 0 1 1-1.5 0V5.372A2.25 2.25 0 0 1 1.5 3.25m5.677-.177L9.573.677A.25.25 0 0 1 10 .854V2.5h1A2.5 2.5 0 0 1 13.5 5v5.628a2.251 2.251 0 1 1-1.5 0V5a1 1 0 0 0-1-1h-1v1.646a.25.25 0 0 1-.427.177L7.177 3.427a.25.25 0 0 1 0-.354M3.75 2.5a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5m0 9.5a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5m8.25.75a.75.75 0 1 0 1.5 0 .75.75 0 0 0-1.5 0"/></svg>
					</a>
				
				
				

				

				
				
					<span class="breadcrumb repo-path tw-ml-1">
						<a class="section" href="/nieldk/aslookup/src/branch/main" title="aslookup">aslookup</a><span class="breadcrumb-divider">/</span><span class="active section" title="aslookup.c">aslookup.c</span>
								<button class="btn interact-fg tw-p-2" data-clipboard-text="aslookup.c" data-tooltip-content="Copy path"><svg viewBox="0 0 16 16" class="svg octicon-copy" aria-hidden="true" width="14" height="14"><path d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 0 1 0 1.5h-1.5a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-1.5a.75.75 0 0 1 1.5 0v1.5A1.75 1.75 0 0 1 9.25 16h-7.5A1.75 1.75 0 0 1 0 14.25Z"/><path d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0 1 14.25 11h-7.5A1.75 1.75 0 0 1 5 9.25Zm1.75-.25a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-7.5a.25.25 0 0 0-.25-.25Z"/></svg></button></span>
				
			</div>
			<div class="tw-flex tw-items-center">
				
				
				
			</div>
		</div>

		

		


		
			<div class="tab-size-4 non-diff-file-content">

	
		<div id="repo-file-commit-box" class="ui segment list-header tw-mb-4 tw-flex tw-justify-between">
			<div class="latest-commit">
				
	
		<img loading="lazy" alt="" class="ui avatar tw-align-middle tw-mr-2" src="/avatars/4f7b65c92ed27349206d393e156f51ee?size=48" title="nieldk" width="24" height="24"/>
		
			<a class="muted author-wrapper" title="nieldk" href="/nieldk"><strong>nieldk</strong></a>
		
	
	

<a href="/nieldk/aslookup/commit/1629e85f8557d89e6d2339237d2fba1022556ae9" rel="nofollow" class="sha label">
	<span class="shortsha">1629e85f85</span></a>

	
	
		<span class="tw-align-middle " data-tippy="commit-statuses" tabindex="0">
			


	<svg viewBox="0 0 16 16" class="commit-status icon text green svg octicon-check" aria-hidden="true" width="18" height="18"><path d="M13.78 4.22a.75.75 0 0 1 0 1.06l-7.25 7.25a.75.75 0 0 1-1.06 0L2.22 9.28a.75.75 0 0 1 .018-1.042.75.75 0 0 1 1.042-.018L6 10.94l6.72-6.72a.75.75 0 0 1 1.06 0"/></svg>





		</span>
	
	<div class="tippy-target">
		


<div class="commit-status-panel">
	<div class="ui top attached header commit-status-header">
		
			All checks were successful
		

		
	</div>

	<div class="commit-status-list">
		
			<div class="commit-status-item">
				


	<svg viewBox="0 0 16 16" class="commit-status icon text green svg octicon-check" aria-hidden="true" width="18" height="18"><path d="M13.78 4.22a.75.75 0 0 1 0 1.06l-7.25 7.25a.75.75 0 0 1-1.06 0L2.22 9.28a.75.75 0 0 1 .018-1.042.75.75 0 0 1 1.042-.018L6 10.94l6.72-6.72a.75.75 0 0 1 1.06 0"/></svg>





				<div class="status-context gt-ellipsis">Build and Release Packages / build-ubuntu (push) <span class="text light-2">Successful in 20s</span></div>
				<div class="ui status-details">
					
					<span><a href="/nieldk/aslookup/actions/runs/285/jobs/0">Details</a></span>
				</div>
			</div>
		
			<div class="commit-status-item">
				


	<svg viewBox="0 0 16 16" class="commit-status icon text green svg octicon-check" aria-hidden="true" width="18" height="18"><path d="M13.78 4.22a.75.75 0 0 1 0 1.06l-7.25 7.25a.75.75 0 0 1-1.06 0L2.22 9.28a.75.75 0 0 1 .018-1.042.75.75 0 0 1 1.042-.018L6 10.94l6.72-6.72a.75.75 0 0 1 1.06 0"/></svg>





				<div class="status-context gt-ellipsis">Build and Release Packages / build-arch (push) <span class="text light-2">Successful in 18s</span></div>
				<div class="ui status-details">
					
					<span><a href="/nieldk/aslookup/actions/runs/285/jobs/1">Details</a></span>
				</div>
			</div>
		
		
	</div>
</div>


	</div>


	
	<span class="grey commit-summary" title="Update aslookup.c"><span class="message-wrapper"><a href="/nieldk/aslookup/commit/1629e85f8557d89e6d2339237d2fba1022556ae9" class="default-link muted">Update aslookup.c</a></span>
		
	</span>


			</div>
			
				
					<div class="text grey age">
						<relative-time prefix="" tense="past" datetime="2025-12-02T11:37:50+01:00" data-tooltip-content data-tooltip-interactive="true">2025-12-02 11:37:50 +01:00</relative-time>
					</div>
				
			
		</div>
	

	<h4 class="file-header ui top attached header tw-flex tw-items-center tw-justify-between tw-flex-wrap">
		<div class="file-header-left tw-flex tw-items-center tw-py-2 tw-pr-4">
			
				<div class="file-info tw-font-mono">
	
	
		<div class="file-info-entry">
			316 lines
		</div>
	
	
	
		<div class="file-info-entry">
			11 KiB
		</div>
	
	
	
		<div class="file-info-entry">
			C
		</div>
	
	
	
	
	
</div>

			
		</div>
		<div class="file-header-right file-actions tw-flex tw-items-center tw-flex-wrap">
			
			
				<div class="ui buttons tw-mr-1">
					
					<a class="ui mini basic button" href="/nieldk/aslookup/raw/branch/main/aslookup.c">Raw</a>
					
						<a class="ui mini basic button" href="/nieldk/aslookup/src/commit/1629e85f8557d89e6d2339237d2fba1022556ae9/aslookup.c">Permalink</a>
					
					
						<a class="ui mini basic button" href="/nieldk/aslookup/blame/branch/main/aslookup.c">Blame</a>
					
					<a class="ui mini basic button" href="/nieldk/aslookup/commits/branch/main/aslookup.c">History</a>
					
				</div>
				<a download class="btn-octicon" href="/nieldk/aslookup/raw/branch/main/aslookup.c" data-tooltip-content="Download file">
					<svg viewBox="0 0 16 16" class="svg octicon-download" aria-hidden="true" width="16" height="16"><path d="M2.75 14A1.75 1.75 0 0 1 1 12.25v-2.5a.75.75 0 0 1 1.5 0v2.5c0 .138.112.25.25.25h10.5a.25.25 0 0 0 .25-.25v-2.5a.75.75 0 0 1 1.5 0v2.5A1.75 1.75 0 0 1 13.25 14Z"/><path d="M7.25 7.689V2a.75.75 0 0 1 1.5 0v5.689l1.97-1.969a.749.749 0 1 1 1.06 1.06l-3.25 3.25a.75.75 0 0 1-1.06 0L4.22 6.78a.749.749 0 1 1 1.06-1.06z"/></svg>
				</a>
				<a href="#" id="copy-content" class="btn-octicon " data-tooltip-content="Copy content">
					<svg viewBox="0 0 16 16" class="svg octicon-copy" aria-hidden="true" width="14" height="14"><path d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 0 1 0 1.5h-1.5a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-1.5a.75.75 0 0 1 1.5 0v1.5A1.75 1.75 0 0 1 9.25 16h-7.5A1.75 1.75 0 0 1 0 14.25Z"/><path d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0 1 14.25 11h-7.5A1.75 1.75 0 0 1 5 9.25Zm1.75-.25a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-7.5a.25.25 0 0 0-.25-.25Z"/></svg>
				</a>
				
					
						<a class="btn-octicon" href="/nieldk/aslookup/rss/branch/main/aslookup.c" data-tooltip-content="RSS feed">
							<svg viewBox="0 0 16 16" class="svg octicon-rss" aria-hidden="true" width="14" height="14"><path d="M2.002 2.725a.75.75 0 0 1 .797-.699C8.79 2.42 13.58 7.21 13.974 13.201a.75.75 0 0 1-1.497.098 10.5 10.5 0 0 0-9.776-9.776.747.747 0 0 1-.7-.798ZM2.84 7.05h-.002a7 7 0 0 1 6.113 6.111.75.75 0 0 1-1.49.178 5.5 5.5 0 0 0-4.8-4.8.75.75 0 0 1 .179-1.489M2 13a1 1 0 1 1 2 0 1 1 0 0 1-2 0"/></svg>
						</a>
					
				
				
					
						<span class="btn-octicon disabled" data-tooltip-content="You must fork this repository to make or propose changes to this file.">
							<svg viewBox="0 0 16 16" class="svg octicon-pencil" aria-hidden="true" width="16" height="16"><path d="M11.013 1.427a1.75 1.75 0 0 1 2.474 0l1.086 1.086a1.75 1.75 0 0 1 0 2.474l-8.61 8.61c-.21.21-.47.364-.756.445l-3.251.93a.75.75 0 0 1-.927-.928l.929-3.25c.081-.286.235-.547.445-.758l8.61-8.61Zm.176 4.823L9.75 4.81l-6.286 6.287a.25.25 0 0 0-.064.108l-.558 1.953 1.953-.558a.25.25 0 0 0 .108-.064Zm1.238-3.763a.25.25 0 0 0-.354 0L10.811 3.75l1.439 1.44 1.263-1.263a.25.25 0 0 0 0-.354Z"/></svg>
						</span>
					
					
						<span class="btn-octicon disabled" data-tooltip-content="You must have write access to make or propose changes to this file.">
							<svg viewBox="0 0 16 16" class="svg octicon-trash" aria-hidden="true" width="16" height="16"><path d="M11 1.75V3h2.25a.75.75 0 0 1 0 1.5H2.75a.75.75 0 0 1 0-1.5H5V1.75C5 .784 5.784 0 6.75 0h2.5C10.216 0 11 .784 11 1.75M4.496 6.675l.66 6.6a.25.25 0 0 0 .249.225h5.19a.25.25 0 0 0 .249-.225l.66-6.6a.75.75 0 0 1 1.492.149l-.66 6.6A1.75 1.75 0 0 1 10.595 15h-5.19a1.75 1.75 0 0 1-1.741-1.575l-.66-6.6a.75.75 0 1 1 1.492-.15M6.5 1.75V3h3V1.75a.25.25 0 0 0-.25-.25h-2.5a.25.25 0 0 0-.25.25"/></svg>
						</span>
					
				
			
			
		</div>
	</h4>
	<div class="ui bottom attached table unstackable segment">
		
			
	


		
		<div class="file-view code-view">
			
				
				<table>
					<tbody>
						
						
						<tr>
							<td class="lines-num"><span id="L1" data-line-number="1"></span></td>
							
							<td rel="L1" class="lines-code chroma"><code class="code-inner"><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;stdio.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L2" data-line-number="2"></span></td>
							
							<td rel="L2" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;stdlib.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L3" data-line-number="3"></span></td>
							
							<td rel="L3" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;string.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L4" data-line-number="4"></span></td>
							
							<td rel="L4" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;curl/curl.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L5" data-line-number="5"></span></td>
							
							<td rel="L5" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;resolv.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L6" data-line-number="6"></span></td>
							
							<td rel="L6" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;netinet/in.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L7" data-line-number="7"></span></td>
							
							<td rel="L7" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;arpa/nameser.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L8" data-line-number="8"></span></td>
							
							<td rel="L8" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;cjson/cJSON.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L9" data-line-number="9"></span></td>
							
							<td rel="L9" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;unistd.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L10" data-line-number="10"></span></td>
							
							<td rel="L10" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;netdb.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L11" data-line-number="11"></span></td>
							
							<td rel="L11" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;arpa/inet.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L12" data-line-number="12"></span></td>
							
							<td rel="L12" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">include</span> <span class="cpf">&lt;sys/socket.h&gt;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L13" data-line-number="13"></span></td>
							
							<td rel="L13" class="lines-code chroma"><code class="code-inner"><span class="cp"></span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L14" data-line-number="14"></span></td>
							
							<td rel="L14" class="lines-code chroma"><code class="code-inner"><span class="cp">#</span><span class="cp">define GREEN &#34;\033[32m&#34;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L15" data-line-number="15"></span></td>
							
							<td rel="L15" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">define CYAN &#34;\033[36m&#34;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L16" data-line-number="16"></span></td>
							
							<td rel="L16" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">define RED &#34;\033[31m&#34;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L17" data-line-number="17"></span></td>
							
							<td rel="L17" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">define YELLOW &#34;\033[33m&#34;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L18" data-line-number="18"></span></td>
							
							<td rel="L18" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">define WHITE &#34;\033[37m&#34;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L19" data-line-number="19"></span></td>
							
							<td rel="L19" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">define RESET &#34;\033[0m&#34;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L20" data-line-number="20"></span></td>
							
							<td rel="L20" class="lines-code chroma"><code class="code-inner"><span class="cp"></span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L21" data-line-number="21"></span></td>
							
							<td rel="L21" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L22" data-line-number="22"></span></td>
							
							<td rel="L22" class="lines-code chroma"><code class="code-inner"><span class="cp">#</span><span class="cp">ifndef VERSION</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L23" data-line-number="23"></span></td>
							
							<td rel="L23" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">define VERSION &#34;unknown&#34;</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L24" data-line-number="24"></span></td>
							
							<td rel="L24" class="lines-code chroma"><code class="code-inner"><span class="cp"></span><span class="cp">#</span><span class="cp">endif</span><span class="cp">
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L25" data-line-number="25"></span></td>
							
							<td rel="L25" class="lines-code chroma"><code class="code-inner"><span class="cp"></span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L26" data-line-number="26"></span></td>
							
							<td rel="L26" class="lines-code chroma"><code class="code-inner"><span class="kt">void</span> <span class="nf">print_author_info</span><span class="p">(</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L27" data-line-number="27"></span></td>
							
							<td rel="L27" class="lines-code chroma"><code class="code-inner">    <span class="nf">printf</span><span class="p">(</span><span class="n">YELLOW</span> <span class="sa"></span><span class="s">&#34;</span><span class="se">\n</span><span class="s">Thank you for installing aslookup!</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L28" data-line-number="28"></span></td>
							
							<td rel="L28" class="lines-code chroma"><code class="code-inner">    <span class="nf">printf</span><span class="p">(</span><span class="n">CYAN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Author: Niel Nielsen</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L29" data-line-number="29"></span></td>
							
							<td rel="L29" class="lines-code chroma"><code class="code-inner">    <span class="nf">printf</span><span class="p">(</span><span class="n">CYAN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Repository: https://codeberg.org/nieldk/aslookup</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L30" data-line-number="30"></span></td>
							
							<td rel="L30" class="lines-code chroma"><code class="code-inner">    <span class="nf">printf</span><span class="p">(</span><span class="n">YELLOW</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">-------------------------------------------</span><span class="se">\n</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L31" data-line-number="31"></span></td>
							
							<td rel="L31" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L32" data-line-number="32"></span></td>
							
							<td rel="L32" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L33" data-line-number="33"></span></td>
							
							<td rel="L33" class="lines-code chroma"><code class="code-inner"><span class="kt">void</span> <span class="nf">print_installed_version</span><span class="p">(</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L34" data-line-number="34"></span></td>
							
							<td rel="L34" class="lines-code chroma"><code class="code-inner">    <span class="nf">printf</span><span class="p">(</span><span class="sa"></span><span class="s">&#34;</span><span class="s">aslookup version: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="n">VERSION</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L35" data-line-number="35"></span></td>
							
							<td rel="L35" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L36" data-line-number="36"></span></td>
							
							<td rel="L36" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L37" data-line-number="37"></span></td>
							
							<td rel="L37" class="lines-code chroma"><code class="code-inner"><span class="k">struct</span> <span class="n">MemoryStruct</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L38" data-line-number="38"></span></td>
							
							<td rel="L38" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="o">*</span><span class="n">memory</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L39" data-line-number="39"></span></td>
							
							<td rel="L39" class="lines-code chroma"><code class="code-inner">    <span class="kt">size_t</span> <span class="n">size</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L40" data-line-number="40"></span></td>
							
							<td rel="L40" class="lines-code chroma"><code class="code-inner"><span class="p">}</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L41" data-line-number="41"></span></td>
							
							<td rel="L41" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L42" data-line-number="42"></span></td>
							
							<td rel="L42" class="lines-code chroma"><code class="code-inner"><span class="kt">size_t</span> <span class="nf">WriteMemoryCallback</span><span class="p">(</span><span class="kt">void</span> <span class="o">*</span><span class="n">contents</span><span class="p">,</span> <span class="kt">size_t</span> <span class="n">size</span><span class="p">,</span> <span class="kt">size_t</span> <span class="n">nmemb</span><span class="p">,</span> <span class="kt">void</span> <span class="o">*</span><span class="n">userp</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L43" data-line-number="43"></span></td>
							
							<td rel="L43" class="lines-code chroma"><code class="code-inner">    <span class="kt">size_t</span> <span class="n">total</span> <span class="o">=</span> <span class="n">size</span> <span class="o">*</span> <span class="n">nmemb</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L44" data-line-number="44"></span></td>
							
							<td rel="L44" class="lines-code chroma"><code class="code-inner">    <span class="k">struct</span> <span class="n">MemoryStruct</span> <span class="o">*</span><span class="n">mem</span> <span class="o">=</span> <span class="p">(</span><span class="k">struct</span> <span class="n">MemoryStruct</span> <span class="o">*</span><span class="p">)</span><span class="n">userp</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L45" data-line-number="45"></span></td>
							
							<td rel="L45" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="o">*</span><span class="n">ptr</span> <span class="o">=</span> <span class="nf">realloc</span><span class="p">(</span><span class="n">mem</span><span class="o">-</span><span class="o">&gt;</span><span class="n">memory</span><span class="p">,</span> <span class="n">mem</span><span class="o">-</span><span class="o">&gt;</span><span class="n">size</span> <span class="o">+</span> <span class="n">total</span> <span class="o">+</span> <span class="mi">1</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L46" data-line-number="46"></span></td>
							
							<td rel="L46" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">ptr</span><span class="p">)</span> <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L47" data-line-number="47"></span></td>
							
							<td rel="L47" class="lines-code chroma"><code class="code-inner">    <span class="n">mem</span><span class="o">-</span><span class="o">&gt;</span><span class="n">memory</span> <span class="o">=</span> <span class="n">ptr</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L48" data-line-number="48"></span></td>
							
							<td rel="L48" class="lines-code chroma"><code class="code-inner">    <span class="nf">memcpy</span><span class="p">(</span><span class="o">&amp;</span><span class="p">(</span><span class="n">mem</span><span class="o">-</span><span class="o">&gt;</span><span class="n">memory</span><span class="p">[</span><span class="n">mem</span><span class="o">-</span><span class="o">&gt;</span><span class="n">size</span><span class="p">]</span><span class="p">)</span><span class="p">,</span> <span class="n">contents</span><span class="p">,</span> <span class="n">total</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L49" data-line-number="49"></span></td>
							
							<td rel="L49" class="lines-code chroma"><code class="code-inner">    <span class="n">mem</span><span class="o">-</span><span class="o">&gt;</span><span class="n">size</span> <span class="o">+</span><span class="o">=</span> <span class="n">total</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L50" data-line-number="50"></span></td>
							
							<td rel="L50" class="lines-code chroma"><code class="code-inner">    <span class="n">mem</span><span class="o">-</span><span class="o">&gt;</span><span class="n">memory</span><span class="p">[</span><span class="n">mem</span><span class="o">-</span><span class="o">&gt;</span><span class="n">size</span><span class="p">]</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L51" data-line-number="51"></span></td>
							
							<td rel="L51" class="lines-code chroma"><code class="code-inner">    <span class="k">return</span> <span class="n">total</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L52" data-line-number="52"></span></td>
							
							<td rel="L52" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L53" data-line-number="53"></span></td>
							
							<td rel="L53" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L54" data-line-number="54"></span></td>
							
							<td rel="L54" class="lines-code chroma"><code class="code-inner"><span class="kt">void</span> <span class="nf">print_latest_github_version</span><span class="p">(</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L55" data-line-number="55"></span></td>
							
							<td rel="L55" class="lines-code chroma"><code class="code-inner">    <span class="n">CURL</span> <span class="o">*</span><span class="n">curl</span> <span class="o">=</span> <span class="nf">curl_easy_init</span><span class="p">(</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L56" data-line-number="56"></span></td>
							
							<td rel="L56" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">curl</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L57" data-line-number="57"></span></td>
							
							<td rel="L57" class="lines-code chroma"><code class="code-inner">        <span class="nf">printf</span><span class="p">(</span><span class="sa"></span><span class="s">&#34;</span><span class="s">curl init failed</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L58" data-line-number="58"></span></td>
							
							<td rel="L58" class="lines-code chroma"><code class="code-inner">        <span class="k">return</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L59" data-line-number="59"></span></td>
							
							<td rel="L59" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L60" data-line-number="60"></span></td>
							
							<td rel="L60" class="lines-code chroma"><code class="code-inner">    <span class="k">struct</span> <span class="n">MemoryStruct</span> <span class="n">chunk</span> <span class="o">=</span> <span class="p">{</span><span class="nf">malloc</span><span class="p">(</span><span class="mi">1</span><span class="p">)</span><span class="p">,</span> <span class="mi">0</span><span class="p">}</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L61" data-line-number="61"></span></td>
							
							<td rel="L61" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_URL</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">https://codeberg.org/api/v1/repos/nieldk/aslookup/releases</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L62" data-line-number="62"></span></td>
							
							<td rel="L62" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_WRITEFUNCTION</span><span class="p">,</span> <span class="n">WriteMemoryCallback</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L63" data-line-number="63"></span></td>
							
							<td rel="L63" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_WRITEDATA</span><span class="p">,</span> <span class="p">(</span><span class="kt">void</span> <span class="o">*</span><span class="p">)</span><span class="o">&amp;</span><span class="n">chunk</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L64" data-line-number="64"></span></td>
							
							<td rel="L64" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_USERAGENT</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">aslookup-c-client/1.0</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L65" data-line-number="65"></span></td>
							
							<td rel="L65" class="lines-code chroma"><code class="code-inner">    <span class="n">CURLcode</span> <span class="n">res</span> <span class="o">=</span> <span class="nf">curl_easy_perform</span><span class="p">(</span><span class="n">curl</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L66" data-line-number="66"></span></td>
							
							<td rel="L66" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="n">res</span> <span class="o">=</span><span class="o">=</span> <span class="n">CURLE_OK</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L67" data-line-number="67"></span></td>
							
							<td rel="L67" class="lines-code chroma"><code class="code-inner">        <span class="n">cJSON</span> <span class="o">*</span><span class="n">root</span> <span class="o">=</span> <span class="nf">cJSON_Parse</span><span class="p">(</span><span class="n">chunk</span><span class="p">.</span><span class="n">memory</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L68" data-line-number="68"></span></td>
							
							<td rel="L68" class="lines-code chroma"><code class="code-inner">        <span class="k">if</span> <span class="p">(</span><span class="n">root</span> <span class="o">&amp;</span><span class="o">&amp;</span> <span class="nf">cJSON_IsArray</span><span class="p">(</span><span class="n">root</span><span class="p">)</span> <span class="o">&amp;</span><span class="o">&amp;</span> <span class="nf">cJSON_GetArraySize</span><span class="p">(</span><span class="n">root</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mi">0</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L69" data-line-number="69"></span></td>
							
							<td rel="L69" class="lines-code chroma"><code class="code-inner">            <span class="c1">// Get the first item in the array (the latest release)
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L70" data-line-number="70"></span></td>
							
							<td rel="L70" class="lines-code chroma"><code class="code-inner"><span class="c1"></span>            <span class="n">cJSON</span> <span class="o">*</span><span class="n">latest_release</span> <span class="o">=</span> <span class="nf">cJSON_GetArrayItem</span><span class="p">(</span><span class="n">root</span><span class="p">,</span> <span class="mi">0</span><span class="p">)</span><span class="p">;</span> 
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L71" data-line-number="71"></span></td>
							
							<td rel="L71" class="lines-code chroma"><code class="code-inner">            
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L72" data-line-number="72"></span></td>
							
							<td rel="L72" class="lines-code chroma"><code class="code-inner">            <span class="c1">// Now, get the &#34;tag_name&#34; from that object
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L73" data-line-number="73"></span></td>
							
							<td rel="L73" class="lines-code chroma"><code class="code-inner"><span class="c1"></span>            <span class="n">cJSON</span> <span class="o">*</span><span class="n">tag</span> <span class="o">=</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">latest_release</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">tag_name</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L74" data-line-number="74"></span></td>
							
							<td rel="L74" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L75" data-line-number="75"></span></td>
							
							<td rel="L75" class="lines-code chroma"><code class="code-inner">            <span class="k">if</span> <span class="p">(</span><span class="n">tag</span> <span class="o">&amp;</span><span class="o">&amp;</span> <span class="n">tag</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L76" data-line-number="76"></span></td>
							
							<td rel="L76" class="lines-code chroma"><code class="code-inner">                <span class="nf">printf</span><span class="p">(</span><span class="sa"></span><span class="s">&#34;</span><span class="s">Latest Codeberg release: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="n">tag</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L77" data-line-number="77"></span></td>
							
							<td rel="L77" class="lines-code chroma"><code class="code-inner">            <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L78" data-line-number="78"></span></td>
							
							<td rel="L78" class="lines-code chroma"><code class="code-inner">                <span class="nf">printf</span><span class="p">(</span><span class="sa"></span><span class="s">&#34;</span><span class="s">Could not find version info in Codeberg release.</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L79" data-line-number="79"></span></td>
							
							<td rel="L79" class="lines-code chroma"><code class="code-inner">            <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L80" data-line-number="80"></span></td>
							
							<td rel="L80" class="lines-code chroma"><code class="code-inner">            <span class="nf">cJSON_Delete</span><span class="p">(</span><span class="n">root</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L81" data-line-number="81"></span></td>
							
							<td rel="L81" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L82" data-line-number="82"></span></td>
							
							<td rel="L82" class="lines-code chroma"><code class="code-inner">            <span class="nf">printf</span><span class="p">(</span><span class="sa"></span><span class="s">&#34;</span><span class="s">Failed to parse JSON from Codeberg or received an empty list.</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L83" data-line-number="83"></span></td>
							
							<td rel="L83" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L84" data-line-number="84"></span></td>
							
							<td rel="L84" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span> <span class="k">else</span> <span class="p">{</span> <span class="c1">// This &#39;else&#39; is now correctly paired with &#39;if (res == CURLE_OK)&#39;
</span></code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L85" data-line-number="85"></span></td>
							
							<td rel="L85" class="lines-code chroma"><code class="code-inner"><span class="c1"></span>        <span class="nf">printf</span><span class="p">(</span><span class="sa"></span><span class="s">&#34;</span><span class="s">Failed to fetch release info from Codeberg: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">curl_easy_strerror</span><span class="p">(</span><span class="n">res</span><span class="p">)</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L86" data-line-number="86"></span></td>
							
							<td rel="L86" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L87" data-line-number="87"></span></td>
							
							<td rel="L87" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_cleanup</span><span class="p">(</span><span class="n">curl</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L88" data-line-number="88"></span></td>
							
							<td rel="L88" class="lines-code chroma"><code class="code-inner">    <span class="nf">free</span><span class="p">(</span><span class="n">chunk</span><span class="p">.</span><span class="n">memory</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L89" data-line-number="89"></span></td>
							
							<td rel="L89" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L90" data-line-number="90"></span></td>
							
							<td rel="L90" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L91" data-line-number="91"></span></td>
							
							<td rel="L91" class="lines-code chroma"><code class="code-inner"><span class="kt">char</span> <span class="o">*</span><span class="nf">get_asn_from_ip</span><span class="p">(</span><span class="k">const</span> <span class="kt">char</span> <span class="o">*</span><span class="n">ip</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L92" data-line-number="92"></span></td>
							
							<td rel="L92" class="lines-code chroma"><code class="code-inner">    <span class="k">static</span> <span class="kt">char</span> <span class="n">asn</span><span class="p">[</span><span class="mi">16</span><span class="p">]</span> <span class="o">=</span> <span class="p">{</span><span class="mi">0</span><span class="p">}</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L93" data-line-number="93"></span></td>
							
							<td rel="L93" class="lines-code chroma"><code class="code-inner">    <span class="kt">int</span> <span class="n">a</span><span class="p">,</span> <span class="n">b</span><span class="p">,</span> <span class="n">c</span><span class="p">,</span> <span class="n">d</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L94" data-line-number="94"></span></td>
							
							<td rel="L94" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="nf">sscanf</span><span class="p">(</span><span class="n">ip</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">%d.%d.%d.%d</span><span class="s">&#34;</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">a</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">b</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">c</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">d</span><span class="p">)</span> <span class="o">!</span><span class="o">=</span> <span class="mi">4</span><span class="p">)</span> <span class="k">return</span> <span class="nb">NULL</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L95" data-line-number="95"></span></td>
							
							<td rel="L95" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="n">query</span><span class="p">[</span><span class="mi">256</span><span class="p">]</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L96" data-line-number="96"></span></td>
							
							<td rel="L96" class="lines-code chroma"><code class="code-inner">    <span class="nf">snprintf</span><span class="p">(</span><span class="n">query</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">query</span><span class="p">)</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">%d.%d.%d.%d.origin.asn.cymru.com</span><span class="s">&#34;</span><span class="p">,</span> <span class="n">d</span><span class="p">,</span> <span class="n">c</span><span class="p">,</span> <span class="n">b</span><span class="p">,</span> <span class="n">a</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L97" data-line-number="97"></span></td>
							
							<td rel="L97" class="lines-code chroma"><code class="code-inner">    <span class="kt">unsigned</span> <span class="kt">char</span> <span class="n">response</span><span class="p">[</span><span class="mi">512</span><span class="p">]</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L98" data-line-number="98"></span></td>
							
							<td rel="L98" class="lines-code chroma"><code class="code-inner">    <span class="n">ns_msg</span> <span class="n">handle</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L99" data-line-number="99"></span></td>
							
							<td rel="L99" class="lines-code chroma"><code class="code-inner">    <span class="n">ns_rr</span> <span class="n">rr</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L100" data-line-number="100"></span></td>
							
							<td rel="L100" class="lines-code chroma"><code class="code-inner">    <span class="kt">int</span> <span class="n">len</span> <span class="o">=</span> <span class="nf">res_query</span><span class="p">(</span><span class="n">query</span><span class="p">,</span> <span class="n">ns_c_in</span><span class="p">,</span> <span class="n">ns_t_txt</span><span class="p">,</span> <span class="n">response</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">response</span><span class="p">)</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L101" data-line-number="101"></span></td>
							
							<td rel="L101" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="n">len</span> <span class="o">&lt;</span> <span class="mi">0</span><span class="p">)</span> <span class="k">return</span> <span class="nb">NULL</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L102" data-line-number="102"></span></td>
							
							<td rel="L102" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="nf">ns_initparse</span><span class="p">(</span><span class="n">response</span><span class="p">,</span> <span class="n">len</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">handle</span><span class="p">)</span> <span class="o">&lt;</span> <span class="mi">0</span><span class="p">)</span> <span class="k">return</span> <span class="nb">NULL</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L103" data-line-number="103"></span></td>
							
							<td rel="L103" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="nf">ns_parserr</span><span class="p">(</span><span class="o">&amp;</span><span class="n">handle</span><span class="p">,</span> <span class="n">ns_s_an</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">rr</span><span class="p">)</span> <span class="o">&lt;</span> <span class="mi">0</span><span class="p">)</span> <span class="k">return</span> <span class="nb">NULL</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L104" data-line-number="104"></span></td>
							
							<td rel="L104" class="lines-code chroma"><code class="code-inner">    <span class="k">const</span> <span class="kt">unsigned</span> <span class="kt">char</span> <span class="o">*</span><span class="n">rdata</span> <span class="o">=</span> <span class="nf">ns_rr_rdata</span><span class="p">(</span><span class="n">rr</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L105" data-line-number="105"></span></td>
							
							<td rel="L105" class="lines-code chroma"><code class="code-inner">    <span class="kt">int</span> <span class="n">txt_len</span> <span class="o">=</span> <span class="n">rdata</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L106" data-line-number="106"></span></td>
							
							<td rel="L106" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="n">txt</span><span class="p">[</span><span class="mi">256</span><span class="p">]</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L107" data-line-number="107"></span></td>
							
							<td rel="L107" class="lines-code chroma"><code class="code-inner">    <span class="nf">strncpy</span><span class="p">(</span><span class="n">txt</span><span class="p">,</span> <span class="p">(</span><span class="kt">char</span> <span class="o">*</span><span class="p">)</span><span class="o">&amp;</span><span class="n">rdata</span><span class="p">[</span><span class="mi">1</span><span class="p">]</span><span class="p">,</span> <span class="n">txt_len</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L108" data-line-number="108"></span></td>
							
							<td rel="L108" class="lines-code chroma"><code class="code-inner">    <span class="n">txt</span><span class="p">[</span><span class="n">txt_len</span><span class="p">]</span> <span class="o">=</span> <span class="sa"></span><span class="sc">&#39;</span><span class="sc">\0</span><span class="sc">&#39;</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L109" data-line-number="109"></span></td>
							
							<td rel="L109" class="lines-code chroma"><code class="code-inner">    <span class="nf">sscanf</span><span class="p">(</span><span class="n">txt</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">%15s</span><span class="s">&#34;</span><span class="p">,</span> <span class="n">asn</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L110" data-line-number="110"></span></td>
							
							<td rel="L110" class="lines-code chroma"><code class="code-inner">    <span class="k">return</span> <span class="n">asn</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L111" data-line-number="111"></span></td>
							
							<td rel="L111" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L112" data-line-number="112"></span></td>
							
							<td rel="L112" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L113" data-line-number="113"></span></td>
							
							<td rel="L113" class="lines-code chroma"><code class="code-inner"><span class="kt">void</span> <span class="nf">fetch_ip_ranges</span><span class="p">(</span><span class="k">const</span> <span class="kt">char</span> <span class="o">*</span><span class="n">asn</span><span class="p">,</span> <span class="n">FILE</span> <span class="o">*</span><span class="n">output</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L114" data-line-number="114"></span></td>
							
							<td rel="L114" class="lines-code chroma"><code class="code-inner">    <span class="n">CURL</span> <span class="o">*</span><span class="n">curl</span> <span class="o">=</span> <span class="nf">curl_easy_init</span><span class="p">(</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L115" data-line-number="115"></span></td>
							
							<td rel="L115" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">curl</span><span class="p">)</span> <span class="k">return</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L116" data-line-number="116"></span></td>
							
							<td rel="L116" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="n">url</span><span class="p">[</span><span class="mi">256</span><span class="p">]</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L117" data-line-number="117"></span></td>
							
							<td rel="L117" class="lines-code chroma"><code class="code-inner">    <span class="nf">snprintf</span><span class="p">(</span><span class="n">url</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">url</span><span class="p">)</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">https://api.hackertarget.com/aslookup/?q=AS%s</span><span class="s">&#34;</span><span class="p">,</span> <span class="n">asn</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L118" data-line-number="118"></span></td>
							
							<td rel="L118" class="lines-code chroma"><code class="code-inner">    <span class="k">struct</span> <span class="n">MemoryStruct</span> <span class="n">chunk</span> <span class="o">=</span> <span class="p">{</span><span class="nf">malloc</span><span class="p">(</span><span class="mi">1</span><span class="p">)</span><span class="p">,</span> <span class="mi">0</span><span class="p">}</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L119" data-line-number="119"></span></td>
							
							<td rel="L119" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_URL</span><span class="p">,</span> <span class="n">url</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L120" data-line-number="120"></span></td>
							
							<td rel="L120" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_WRITEFUNCTION</span><span class="p">,</span> <span class="n">WriteMemoryCallback</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L121" data-line-number="121"></span></td>
							
							<td rel="L121" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_WRITEDATA</span><span class="p">,</span> <span class="p">(</span><span class="kt">void</span> <span class="o">*</span><span class="p">)</span><span class="o">&amp;</span><span class="n">chunk</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L122" data-line-number="122"></span></td>
							
							<td rel="L122" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_USERAGENT</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">asnlookup-c-client/1.0</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L123" data-line-number="123"></span></td>
							
							<td rel="L123" class="lines-code chroma"><code class="code-inner">    <span class="n">CURLcode</span> <span class="n">res</span> <span class="o">=</span> <span class="nf">curl_easy_perform</span><span class="p">(</span><span class="n">curl</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L124" data-line-number="124"></span></td>
							
							<td rel="L124" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="n">res</span> <span class="o">=</span><span class="o">=</span> <span class="n">CURLE_OK</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L125" data-line-number="125"></span></td>
							
							<td rel="L125" class="lines-code chroma"><code class="code-inner">        <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">CYAN</span> <span class="sa"></span><span class="s">&#34;</span><span class="se">\n</span><span class="s">IP Ranges:</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">%s</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">,</span> <span class="n">chunk</span><span class="p">.</span><span class="n">memory</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L126" data-line-number="126"></span></td>
							
							<td rel="L126" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L127" data-line-number="127"></span></td>
							
							<td rel="L127" class="lines-code chroma"><code class="code-inner">        <span class="nf">fprintf</span><span class="p">(</span><span class="n">stderr</span><span class="p">,</span> <span class="n">RED</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Error fetching IP ranges: %s</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">,</span> <span class="nf">curl_easy_strerror</span><span class="p">(</span><span class="n">res</span><span class="p">)</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L128" data-line-number="128"></span></td>
							
							<td rel="L128" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L129" data-line-number="129"></span></td>
							
							<td rel="L129" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_cleanup</span><span class="p">(</span><span class="n">curl</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L130" data-line-number="130"></span></td>
							
							<td rel="L130" class="lines-code chroma"><code class="code-inner">    <span class="nf">free</span><span class="p">(</span><span class="n">chunk</span><span class="p">.</span><span class="n">memory</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L131" data-line-number="131"></span></td>
							
							<td rel="L131" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L132" data-line-number="132"></span></td>
							
							<td rel="L132" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L133" data-line-number="133"></span></td>
							
							<td rel="L133" class="lines-code chroma"><code class="code-inner"><span class="kt">void</span> <span class="nf">fetch_bgpview_info</span><span class="p">(</span><span class="k">const</span> <span class="kt">char</span> <span class="o">*</span><span class="n">asn</span><span class="p">,</span> <span class="n">FILE</span> <span class="o">*</span><span class="n">output</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L134" data-line-number="134"></span></td>
							
							<td rel="L134" class="lines-code chroma"><code class="code-inner">    <span class="n">CURL</span> <span class="o">*</span><span class="n">curl</span> <span class="o">=</span> <span class="nf">curl_easy_init</span><span class="p">(</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L135" data-line-number="135"></span></td>
							
							<td rel="L135" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">curl</span><span class="p">)</span> <span class="k">return</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L136" data-line-number="136"></span></td>
							
							<td rel="L136" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="n">url</span><span class="p">[</span><span class="mi">256</span><span class="p">]</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L137" data-line-number="137"></span></td>
							
							<td rel="L137" class="lines-code chroma"><code class="code-inner">    <span class="nf">snprintf</span><span class="p">(</span><span class="n">url</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">url</span><span class="p">)</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">https://api.bgpview.io/asn/%s</span><span class="s">&#34;</span><span class="p">,</span> <span class="n">asn</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L138" data-line-number="138"></span></td>
							
							<td rel="L138" class="lines-code chroma"><code class="code-inner">    <span class="k">struct</span> <span class="n">MemoryStruct</span> <span class="n">chunk</span> <span class="o">=</span> <span class="p">{</span><span class="nf">malloc</span><span class="p">(</span><span class="mi">1</span><span class="p">)</span><span class="p">,</span> <span class="mi">0</span><span class="p">}</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L139" data-line-number="139"></span></td>
							
							<td rel="L139" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_URL</span><span class="p">,</span> <span class="n">url</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L140" data-line-number="140"></span></td>
							
							<td rel="L140" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_WRITEFUNCTION</span><span class="p">,</span> <span class="n">WriteMemoryCallback</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L141" data-line-number="141"></span></td>
							
							<td rel="L141" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_WRITEDATA</span><span class="p">,</span> <span class="p">(</span><span class="kt">void</span> <span class="o">*</span><span class="p">)</span><span class="o">&amp;</span><span class="n">chunk</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L142" data-line-number="142"></span></td>
							
							<td rel="L142" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_setopt</span><span class="p">(</span><span class="n">curl</span><span class="p">,</span> <span class="n">CURLOPT_USERAGENT</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">asnlookup-c-client/1.0</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L143" data-line-number="143"></span></td>
							
							<td rel="L143" class="lines-code chroma"><code class="code-inner">    <span class="n">CURLcode</span> <span class="n">res</span> <span class="o">=</span> <span class="nf">curl_easy_perform</span><span class="p">(</span><span class="n">curl</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L144" data-line-number="144"></span></td>
							
							<td rel="L144" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="n">res</span> <span class="o">!</span><span class="o">=</span> <span class="n">CURLE_OK</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L145" data-line-number="145"></span></td>
							
							<td rel="L145" class="lines-code chroma"><code class="code-inner">        <span class="nf">fprintf</span><span class="p">(</span><span class="n">stderr</span><span class="p">,</span> <span class="n">RED</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Error fetching BGPView info: %s</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">,</span> <span class="nf">curl_easy_strerror</span><span class="p">(</span><span class="n">res</span><span class="p">)</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L146" data-line-number="146"></span></td>
							
							<td rel="L146" class="lines-code chroma"><code class="code-inner">        <span class="nf">curl_easy_cleanup</span><span class="p">(</span><span class="n">curl</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L147" data-line-number="147"></span></td>
							
							<td rel="L147" class="lines-code chroma"><code class="code-inner">        <span class="nf">free</span><span class="p">(</span><span class="n">chunk</span><span class="p">.</span><span class="n">memory</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L148" data-line-number="148"></span></td>
							
							<td rel="L148" class="lines-code chroma"><code class="code-inner">        <span class="k">return</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L149" data-line-number="149"></span></td>
							
							<td rel="L149" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L150" data-line-number="150"></span></td>
							
							<td rel="L150" class="lines-code chroma"><code class="code-inner">    <span class="n">cJSON</span> <span class="o">*</span><span class="n">root</span> <span class="o">=</span> <span class="nf">cJSON_Parse</span><span class="p">(</span><span class="n">chunk</span><span class="p">.</span><span class="n">memory</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L151" data-line-number="151"></span></td>
							
							<td rel="L151" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">root</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L152" data-line-number="152"></span></td>
							
							<td rel="L152" class="lines-code chroma"><code class="code-inner">        <span class="nf">fprintf</span><span class="p">(</span><span class="n">stderr</span><span class="p">,</span> <span class="n">RED</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Failed to parse JSON.</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L153" data-line-number="153"></span></td>
							
							<td rel="L153" class="lines-code chroma"><code class="code-inner">        <span class="nf">curl_easy_cleanup</span><span class="p">(</span><span class="n">curl</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L154" data-line-number="154"></span></td>
							
							<td rel="L154" class="lines-code chroma"><code class="code-inner">        <span class="nf">free</span><span class="p">(</span><span class="n">chunk</span><span class="p">.</span><span class="n">memory</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L155" data-line-number="155"></span></td>
							
							<td rel="L155" class="lines-code chroma"><code class="code-inner">        <span class="k">return</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L156" data-line-number="156"></span></td>
							
							<td rel="L156" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L157" data-line-number="157"></span></td>
							
							<td rel="L157" class="lines-code chroma"><code class="code-inner">    <span class="n">cJSON</span> <span class="o">*</span><span class="n">data</span> <span class="o">=</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">root</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">data</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L158" data-line-number="158"></span></td>
							
							<td rel="L158" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">data</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L159" data-line-number="159"></span></td>
							
							<td rel="L159" class="lines-code chroma"><code class="code-inner">        <span class="nf">fprintf</span><span class="p">(</span><span class="n">stderr</span><span class="p">,</span> <span class="n">RED</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">No data in JSON.</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L160" data-line-number="160"></span></td>
							
							<td rel="L160" class="lines-code chroma"><code class="code-inner">        <span class="nf">cJSON_Delete</span><span class="p">(</span><span class="n">root</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L161" data-line-number="161"></span></td>
							
							<td rel="L161" class="lines-code chroma"><code class="code-inner">        <span class="nf">curl_easy_cleanup</span><span class="p">(</span><span class="n">curl</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L162" data-line-number="162"></span></td>
							
							<td rel="L162" class="lines-code chroma"><code class="code-inner">        <span class="nf">free</span><span class="p">(</span><span class="n">chunk</span><span class="p">.</span><span class="n">memory</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L163" data-line-number="163"></span></td>
							
							<td rel="L163" class="lines-code chroma"><code class="code-inner">        <span class="k">return</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L164" data-line-number="164"></span></td>
							
							<td rel="L164" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L165" data-line-number="165"></span></td>
							
							<td rel="L165" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">GREEN</span> <span class="sa"></span><span class="s">&#34;</span><span class="se">\n</span><span class="s">ASN Number: %d</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">asn</span><span class="s">&#34;</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valueint</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L166" data-line-number="166"></span></td>
							
							<td rel="L166" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">GREEN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Name: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">name</span><span class="s">&#34;</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L167" data-line-number="167"></span></td>
							
							<td rel="L167" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">GREEN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Description: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">description_short</span><span class="s">&#34;</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L168" data-line-number="168"></span></td>
							
							<td rel="L168" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">GREEN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Country: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">country_code</span><span class="s">&#34;</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L169" data-line-number="169"></span></td>
							
							<td rel="L169" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">GREEN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Website: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">website</span><span class="s">&#34;</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L170" data-line-number="170"></span></td>
							
							<td rel="L170" class="lines-code chroma"><code class="code-inner">    <span class="n">cJSON</span> <span class="o">*</span><span class="n">emails</span> <span class="o">=</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">email_contacts</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L171" data-line-number="171"></span></td>
							
							<td rel="L171" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="n">emails</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L172" data-line-number="172"></span></td>
							
							<td rel="L172" class="lines-code chroma"><code class="code-inner">        <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">CYAN</span> <span class="sa"></span><span class="s">&#34;</span><span class="se">\n</span><span class="s">Email Contacts:</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L173" data-line-number="173"></span></td>
							
							<td rel="L173" class="lines-code chroma"><code class="code-inner">        <span class="k">for</span> <span class="p">(</span><span class="kt">int</span> <span class="n">i</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span> <span class="n">i</span> <span class="o">&lt;</span> <span class="nf">cJSON_GetArraySize</span><span class="p">(</span><span class="n">emails</span><span class="p">)</span><span class="p">;</span> <span class="n">i</span><span class="o">+</span><span class="o">+</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L174" data-line-number="174"></span></td>
							
							<td rel="L174" class="lines-code chroma"><code class="code-inner">            <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s"> - %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetArrayItem</span><span class="p">(</span><span class="n">emails</span><span class="p">,</span> <span class="n">i</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L175" data-line-number="175"></span></td>
							
							<td rel="L175" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L176" data-line-number="176"></span></td>
							
							<td rel="L176" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L177" data-line-number="177"></span></td>
							
							<td rel="L177" class="lines-code chroma"><code class="code-inner">    <span class="n">cJSON</span> <span class="o">*</span><span class="n">abuse</span> <span class="o">=</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">abuse_contacts</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L178" data-line-number="178"></span></td>
							
							<td rel="L178" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="n">abuse</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L179" data-line-number="179"></span></td>
							
							<td rel="L179" class="lines-code chroma"><code class="code-inner">        <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">RED</span> <span class="sa"></span><span class="s">&#34;</span><span class="se">\n</span><span class="s">Abuse Contacts:</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L180" data-line-number="180"></span></td>
							
							<td rel="L180" class="lines-code chroma"><code class="code-inner">        <span class="k">for</span> <span class="p">(</span><span class="kt">int</span> <span class="n">i</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span> <span class="n">i</span> <span class="o">&lt;</span> <span class="nf">cJSON_GetArraySize</span><span class="p">(</span><span class="n">abuse</span><span class="p">)</span><span class="p">;</span> <span class="n">i</span><span class="o">+</span><span class="o">+</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L181" data-line-number="181"></span></td>
							
							<td rel="L181" class="lines-code chroma"><code class="code-inner">            <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s"> - %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetArrayItem</span><span class="p">(</span><span class="n">abuse</span><span class="p">,</span> <span class="n">i</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L182" data-line-number="182"></span></td>
							
							<td rel="L182" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L183" data-line-number="183"></span></td>
							
							<td rel="L183" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L184" data-line-number="184"></span></td>
							
							<td rel="L184" class="lines-code chroma"><code class="code-inner">    <span class="n">cJSON</span> <span class="o">*</span><span class="n">address</span> <span class="o">=</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">owner_address</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L185" data-line-number="185"></span></td>
							
							<td rel="L185" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="n">address</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L186" data-line-number="186"></span></td>
							
							<td rel="L186" class="lines-code chroma"><code class="code-inner">        <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">YELLOW</span> <span class="sa"></span><span class="s">&#34;</span><span class="se">\n</span><span class="s">Owner Address:</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L187" data-line-number="187"></span></td>
							
							<td rel="L187" class="lines-code chroma"><code class="code-inner">        <span class="k">for</span> <span class="p">(</span><span class="kt">int</span> <span class="n">i</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span> <span class="n">i</span> <span class="o">&lt;</span> <span class="nf">cJSON_GetArraySize</span><span class="p">(</span><span class="n">address</span><span class="p">)</span><span class="p">;</span> <span class="n">i</span><span class="o">+</span><span class="o">+</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L188" data-line-number="188"></span></td>
							
							<td rel="L188" class="lines-code chroma"><code class="code-inner">            <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s"> %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetArrayItem</span><span class="p">(</span><span class="n">address</span><span class="p">,</span> <span class="n">i</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L189" data-line-number="189"></span></td>
							
							<td rel="L189" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L190" data-line-number="190"></span></td>
							
							<td rel="L190" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L191" data-line-number="191"></span></td>
							
							<td rel="L191" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">GREEN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Traffic Ratio: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">traffic_ratio</span><span class="s">&#34;</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L192" data-line-number="192"></span></td>
							
							<td rel="L192" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">GREEN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Updated: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="nf">cJSON_GetObjectItem</span><span class="p">(</span><span class="n">data</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">date_updated</span><span class="s">&#34;</span><span class="p">)</span><span class="o">-</span><span class="o">&gt;</span><span class="n">valuestring</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L193" data-line-number="193"></span></td>
							
							<td rel="L193" class="lines-code chroma"><code class="code-inner">    <span class="nf">cJSON_Delete</span><span class="p">(</span><span class="n">root</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L194" data-line-number="194"></span></td>
							
							<td rel="L194" class="lines-code chroma"><code class="code-inner">    <span class="nf">curl_easy_cleanup</span><span class="p">(</span><span class="n">curl</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L195" data-line-number="195"></span></td>
							
							<td rel="L195" class="lines-code chroma"><code class="code-inner">    <span class="nf">free</span><span class="p">(</span><span class="n">chunk</span><span class="p">.</span><span class="n">memory</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L196" data-line-number="196"></span></td>
							
							<td rel="L196" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L197" data-line-number="197"></span></td>
							
							<td rel="L197" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L198" data-line-number="198"></span></td>
							
							<td rel="L198" class="lines-code chroma"><code class="code-inner"><span class="kt">void</span> <span class="nf">print_help</span><span class="p">(</span><span class="k">const</span> <span class="kt">char</span> <span class="o">*</span><span class="n">progname</span><span class="p">,</span> <span class="n">FILE</span> <span class="o">*</span><span class="n">output</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L199" data-line-number="199"></span></td>
							
							<td rel="L199" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">CYAN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Usage: %s &lt;options&gt;</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="n">progname</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L200" data-line-number="200"></span></td>
							
							<td rel="L200" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">CYAN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Options:</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L201" data-line-number="201"></span></td>
							
							<td rel="L201" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s"> -i &lt;IP[,IP,...]&gt; Specify one or more IP addresses (comma-separated)</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L202" data-line-number="202"></span></td>
							
							<td rel="L202" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s"> -d &lt;domain[,domain,...]&gt; Specify one or more domain names (comma-separated)</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L203" data-line-number="203"></span></td>
							
							<td rel="L203" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s"> -f &lt;file&gt; Save output to a formatted text file</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L204" data-line-number="204"></span></td>
							
							<td rel="L204" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s"> --help Show this help message</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L205" data-line-number="205"></span></td>
							
							<td rel="L205" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s"> --version Show installed version</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L206" data-line-number="206"></span></td>
							
							<td rel="L206" class="lines-code chroma"><code class="code-inner">    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">WHITE</span> <span class="sa"></span><span class="s">&#34;</span><span class="s"> --ghversion Show latest GitHub release version</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L207" data-line-number="207"></span></td>
							
							<td rel="L207" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L208" data-line-number="208"></span></td>
							
							<td rel="L208" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L209" data-line-number="209"></span></td>
							
							<td rel="L209" class="lines-code chroma"><code class="code-inner"><span class="kt">char</span> <span class="o">*</span><span class="nf">resolve_domain_to_ip</span><span class="p">(</span><span class="k">const</span> <span class="kt">char</span> <span class="o">*</span><span class="n">domain</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L210" data-line-number="210"></span></td>
							
							<td rel="L210" class="lines-code chroma"><code class="code-inner">    <span class="k">struct</span> <span class="n">addrinfo</span> <span class="n">hints</span><span class="p">,</span> <span class="o">*</span><span class="n">res</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L211" data-line-number="211"></span></td>
							
							<td rel="L211" class="lines-code chroma"><code class="code-inner">    <span class="k">static</span> <span class="kt">char</span> <span class="n">ip</span><span class="p">[</span><span class="n">INET6_ADDRSTRLEN</span><span class="p">]</span> <span class="o">=</span> <span class="p">{</span><span class="mi">0</span><span class="p">}</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L212" data-line-number="212"></span></td>
							
							<td rel="L212" class="lines-code chroma"><code class="code-inner">    <span class="nf">memset</span><span class="p">(</span><span class="o">&amp;</span><span class="n">hints</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">hints</span><span class="p">)</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L213" data-line-number="213"></span></td>
							
							<td rel="L213" class="lines-code chroma"><code class="code-inner">    <span class="n">hints</span><span class="p">.</span><span class="n">ai_family</span> <span class="o">=</span> <span class="n">AF_INET</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L214" data-line-number="214"></span></td>
							
							<td rel="L214" class="lines-code chroma"><code class="code-inner">    <span class="n">hints</span><span class="p">.</span><span class="n">ai_socktype</span> <span class="o">=</span> <span class="n">SOCK_STREAM</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L215" data-line-number="215"></span></td>
							
							<td rel="L215" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="nf">getaddrinfo</span><span class="p">(</span><span class="n">domain</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">hints</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">res</span><span class="p">)</span> <span class="o">!</span><span class="o">=</span> <span class="mi">0</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L216" data-line-number="216"></span></td>
							
							<td rel="L216" class="lines-code chroma"><code class="code-inner">        <span class="k">return</span> <span class="nb">NULL</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L217" data-line-number="217"></span></td>
							
							<td rel="L217" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L218" data-line-number="218"></span></td>
							
							<td rel="L218" class="lines-code chroma"><code class="code-inner">    <span class="k">struct</span> <span class="n">sockaddr_in</span> <span class="o">*</span><span class="n">ipv4</span> <span class="o">=</span> <span class="p">(</span><span class="k">struct</span> <span class="n">sockaddr_in</span> <span class="o">*</span><span class="p">)</span><span class="n">res</span><span class="o">-</span><span class="o">&gt;</span><span class="n">ai_addr</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L219" data-line-number="219"></span></td>
							
							<td rel="L219" class="lines-code chroma"><code class="code-inner">    <span class="nf">inet_ntop</span><span class="p">(</span><span class="n">AF_INET</span><span class="p">,</span> <span class="o">&amp;</span><span class="p">(</span><span class="n">ipv4</span><span class="o">-</span><span class="o">&gt;</span><span class="n">sin_addr</span><span class="p">)</span><span class="p">,</span> <span class="n">ip</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">ip</span><span class="p">)</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L220" data-line-number="220"></span></td>
							
							<td rel="L220" class="lines-code chroma"><code class="code-inner">    <span class="nf">freeaddrinfo</span><span class="p">(</span><span class="n">res</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L221" data-line-number="221"></span></td>
							
							<td rel="L221" class="lines-code chroma"><code class="code-inner">    <span class="k">return</span> <span class="n">ip</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L222" data-line-number="222"></span></td>
							
							<td rel="L222" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L223" data-line-number="223"></span></td>
							
							<td rel="L223" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L224" data-line-number="224"></span></td>
							
							<td rel="L224" class="lines-code chroma"><code class="code-inner"><span class="kt">int</span> <span class="nf">main</span><span class="p">(</span><span class="kt">int</span> <span class="n">argc</span><span class="p">,</span> <span class="kt">char</span> <span class="o">*</span><span class="n">argv</span><span class="p">[</span><span class="p">]</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L225" data-line-number="225"></span></td>
							
							<td rel="L225" class="lines-code chroma"><code class="code-inner">    <span class="nf">print_author_info</span><span class="p">(</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L226" data-line-number="226"></span></td>
							
							<td rel="L226" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="n">ips</span><span class="p">[</span><span class="mi">1024</span><span class="p">]</span> <span class="o">=</span> <span class="p">{</span><span class="mi">0</span><span class="p">}</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L227" data-line-number="227"></span></td>
							
							<td rel="L227" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="n">domains</span><span class="p">[</span><span class="mi">1024</span><span class="p">]</span> <span class="o">=</span> <span class="p">{</span><span class="mi">0</span><span class="p">}</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L228" data-line-number="228"></span></td>
							
							<td rel="L228" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="n">filename</span><span class="p">[</span><span class="mi">256</span><span class="p">]</span> <span class="o">=</span> <span class="p">{</span><span class="mi">0</span><span class="p">}</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L229" data-line-number="229"></span></td>
							
							<td rel="L229" class="lines-code chroma"><code class="code-inner">    <span class="n">FILE</span> <span class="o">*</span><span class="n">output</span> <span class="o">=</span> <span class="n">stdout</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L230" data-line-number="230"></span></td>
							
							<td rel="L230" class="lines-code chroma"><code class="code-inner">    <span class="kt">int</span> <span class="n">opt</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L231" data-line-number="231"></span></td>
							
							<td rel="L231" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L232" data-line-number="232"></span></td>
							
							<td rel="L232" class="lines-code chroma"><code class="code-inner">    <span class="k">for</span> <span class="p">(</span><span class="kt">int</span> <span class="n">i</span> <span class="o">=</span> <span class="mi">1</span><span class="p">;</span> <span class="n">i</span> <span class="o">&lt;</span> <span class="n">argc</span><span class="p">;</span> <span class="n">i</span><span class="o">+</span><span class="o">+</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L233" data-line-number="233"></span></td>
							
							<td rel="L233" class="lines-code chroma"><code class="code-inner">        <span class="k">if</span> <span class="p">(</span><span class="nf">strcmp</span><span class="p">(</span><span class="n">argv</span><span class="p">[</span><span class="n">i</span><span class="p">]</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">--version</span><span class="s">&#34;</span><span class="p">)</span> <span class="o">=</span><span class="o">=</span> <span class="mi">0</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L234" data-line-number="234"></span></td>
							
							<td rel="L234" class="lines-code chroma"><code class="code-inner">            <span class="nf">print_installed_version</span><span class="p">(</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L235" data-line-number="235"></span></td>
							
							<td rel="L235" class="lines-code chroma"><code class="code-inner">            <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L236" data-line-number="236"></span></td>
							
							<td rel="L236" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L237" data-line-number="237"></span></td>
							
							<td rel="L237" class="lines-code chroma"><code class="code-inner">        <span class="k">if</span> <span class="p">(</span><span class="nf">strcmp</span><span class="p">(</span><span class="n">argv</span><span class="p">[</span><span class="n">i</span><span class="p">]</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">--ghversion</span><span class="s">&#34;</span><span class="p">)</span> <span class="o">=</span><span class="o">=</span> <span class="mi">0</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L238" data-line-number="238"></span></td>
							
							<td rel="L238" class="lines-code chroma"><code class="code-inner">            <span class="nf">print_latest_github_version</span><span class="p">(</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L239" data-line-number="239"></span></td>
							
							<td rel="L239" class="lines-code chroma"><code class="code-inner">            <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L240" data-line-number="240"></span></td>
							
							<td rel="L240" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L241" data-line-number="241"></span></td>
							
							<td rel="L241" class="lines-code chroma"><code class="code-inner">        <span class="k">if</span> <span class="p">(</span><span class="nf">strcmp</span><span class="p">(</span><span class="n">argv</span><span class="p">[</span><span class="n">i</span><span class="p">]</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">--help</span><span class="s">&#34;</span><span class="p">)</span> <span class="o">=</span><span class="o">=</span> <span class="mi">0</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L242" data-line-number="242"></span></td>
							
							<td rel="L242" class="lines-code chroma"><code class="code-inner">            <span class="nf">print_help</span><span class="p">(</span><span class="n">argv</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="p">,</span> <span class="n">stdout</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L243" data-line-number="243"></span></td>
							
							<td rel="L243" class="lines-code chroma"><code class="code-inner">            <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L244" data-line-number="244"></span></td>
							
							<td rel="L244" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L245" data-line-number="245"></span></td>
							
							<td rel="L245" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L246" data-line-number="246"></span></td>
							
							<td rel="L246" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L247" data-line-number="247"></span></td>
							
							<td rel="L247" class="lines-code chroma"><code class="code-inner">    <span class="k">while</span> <span class="p">(</span><span class="p">(</span><span class="n">opt</span> <span class="o">=</span> <span class="nf">getopt</span><span class="p">(</span><span class="n">argc</span><span class="p">,</span> <span class="n">argv</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">i:d:f:</span><span class="s">&#34;</span><span class="p">)</span><span class="p">)</span> <span class="o">!</span><span class="o">=</span> <span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L248" data-line-number="248"></span></td>
							
							<td rel="L248" class="lines-code chroma"><code class="code-inner">        <span class="k">switch</span> <span class="p">(</span><span class="n">opt</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L249" data-line-number="249"></span></td>
							
							<td rel="L249" class="lines-code chroma"><code class="code-inner">            <span class="k">case</span> <span class="sa"></span><span class="sc">&#39;</span><span class="sc">i</span><span class="sc">&#39;</span><span class="o">:</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L250" data-line-number="250"></span></td>
							
							<td rel="L250" class="lines-code chroma"><code class="code-inner">                <span class="nf">strncpy</span><span class="p">(</span><span class="n">ips</span><span class="p">,</span> <span class="n">optarg</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">ips</span><span class="p">)</span> <span class="o">-</span> <span class="mi">1</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L251" data-line-number="251"></span></td>
							
							<td rel="L251" class="lines-code chroma"><code class="code-inner">                <span class="k">break</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L252" data-line-number="252"></span></td>
							
							<td rel="L252" class="lines-code chroma"><code class="code-inner">            <span class="k">case</span> <span class="sa"></span><span class="sc">&#39;</span><span class="sc">d</span><span class="sc">&#39;</span><span class="o">:</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L253" data-line-number="253"></span></td>
							
							<td rel="L253" class="lines-code chroma"><code class="code-inner">                <span class="nf">strncpy</span><span class="p">(</span><span class="n">domains</span><span class="p">,</span> <span class="n">optarg</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">domains</span><span class="p">)</span> <span class="o">-</span> <span class="mi">1</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L254" data-line-number="254"></span></td>
							
							<td rel="L254" class="lines-code chroma"><code class="code-inner">                <span class="k">break</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L255" data-line-number="255"></span></td>
							
							<td rel="L255" class="lines-code chroma"><code class="code-inner">            <span class="k">case</span> <span class="sa"></span><span class="sc">&#39;</span><span class="sc">f</span><span class="sc">&#39;</span><span class="o">:</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L256" data-line-number="256"></span></td>
							
							<td rel="L256" class="lines-code chroma"><code class="code-inner">                <span class="nf">strncpy</span><span class="p">(</span><span class="n">filename</span><span class="p">,</span> <span class="n">optarg</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">filename</span><span class="p">)</span> <span class="o">-</span> <span class="mi">1</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L257" data-line-number="257"></span></td>
							
							<td rel="L257" class="lines-code chroma"><code class="code-inner">                <span class="k">break</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L258" data-line-number="258"></span></td>
							
							<td rel="L258" class="lines-code chroma"><code class="code-inner">            <span class="k">case</span> <span class="sa"></span><span class="sc">&#39;</span><span class="sc">?</span><span class="sc">&#39;</span><span class="o">:</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L259" data-line-number="259"></span></td>
							
							<td rel="L259" class="lines-code chroma"><code class="code-inner">                <span class="nf">print_help</span><span class="p">(</span><span class="n">argv</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="p">,</span> <span class="n">stdout</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L260" data-line-number="260"></span></td>
							
							<td rel="L260" class="lines-code chroma"><code class="code-inner">                <span class="k">return</span> <span class="mi">1</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L261" data-line-number="261"></span></td>
							
							<td rel="L261" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L262" data-line-number="262"></span></td>
							
							<td rel="L262" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L263" data-line-number="263"></span></td>
							
							<td rel="L263" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L264" data-line-number="264"></span></td>
							
							<td rel="L264" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="nf">strlen</span><span class="p">(</span><span class="n">filename</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mi">0</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L265" data-line-number="265"></span></td>
							
							<td rel="L265" class="lines-code chroma"><code class="code-inner">        <span class="n">output</span> <span class="o">=</span> <span class="nf">fopen</span><span class="p">(</span><span class="n">filename</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">w</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L266" data-line-number="266"></span></td>
							
							<td rel="L266" class="lines-code chroma"><code class="code-inner">        <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">output</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L267" data-line-number="267"></span></td>
							
							<td rel="L267" class="lines-code chroma"><code class="code-inner">            <span class="nf">fprintf</span><span class="p">(</span><span class="n">stderr</span><span class="p">,</span> <span class="n">RED</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Failed to open file for writing.</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L268" data-line-number="268"></span></td>
							
							<td rel="L268" class="lines-code chroma"><code class="code-inner">            <span class="k">return</span> <span class="mi">1</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L269" data-line-number="269"></span></td>
							
							<td rel="L269" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L270" data-line-number="270"></span></td>
							
							<td rel="L270" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L271" data-line-number="271"></span></td>
							
							<td rel="L271" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L272" data-line-number="272"></span></td>
							
							<td rel="L272" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="nf">strlen</span><span class="p">(</span><span class="n">ips</span><span class="p">)</span> <span class="o">=</span><span class="o">=</span> <span class="mi">0</span> <span class="o">&amp;</span><span class="o">&amp;</span> <span class="nf">strlen</span><span class="p">(</span><span class="n">domains</span><span class="p">)</span> <span class="o">=</span><span class="o">=</span> <span class="mi">0</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L273" data-line-number="273"></span></td>
							
							<td rel="L273" class="lines-code chroma"><code class="code-inner">        <span class="nf">print_help</span><span class="p">(</span><span class="n">argv</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="p">,</span> <span class="n">output</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L274" data-line-number="274"></span></td>
							
							<td rel="L274" class="lines-code chroma"><code class="code-inner">        <span class="k">if</span> <span class="p">(</span><span class="n">output</span> <span class="o">!</span><span class="o">=</span> <span class="n">stdout</span><span class="p">)</span> <span class="nf">fclose</span><span class="p">(</span><span class="n">output</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L275" data-line-number="275"></span></td>
							
							<td rel="L275" class="lines-code chroma"><code class="code-inner">        <span class="k">return</span> <span class="mi">1</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L276" data-line-number="276"></span></td>
							
							<td rel="L276" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L277" data-line-number="277"></span></td>
							
							<td rel="L277" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L278" data-line-number="278"></span></td>
							
							<td rel="L278" class="lines-code chroma"><code class="code-inner">    <span class="kt">char</span> <span class="o">*</span><span class="n">token</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L279" data-line-number="279"></span></td>
							
							<td rel="L279" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="nf">strlen</span><span class="p">(</span><span class="n">ips</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mi">0</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L280" data-line-number="280"></span></td>
							
							<td rel="L280" class="lines-code chroma"><code class="code-inner">        <span class="n">token</span> <span class="o">=</span> <span class="nf">strtok</span><span class="p">(</span><span class="n">ips</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">,</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L281" data-line-number="281"></span></td>
							
							<td rel="L281" class="lines-code chroma"><code class="code-inner">        <span class="k">while</span> <span class="p">(</span><span class="n">token</span> <span class="o">!</span><span class="o">=</span> <span class="nb">NULL</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L282" data-line-number="282"></span></td>
							
							<td rel="L282" class="lines-code chroma"><code class="code-inner">            <span class="kt">char</span> <span class="o">*</span><span class="n">asn</span> <span class="o">=</span> <span class="nf">get_asn_from_ip</span><span class="p">(</span><span class="n">token</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L283" data-line-number="283"></span></td>
							
							<td rel="L283" class="lines-code chroma"><code class="code-inner">            <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">asn</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L284" data-line-number="284"></span></td>
							
							<td rel="L284" class="lines-code chroma"><code class="code-inner">                <span class="nf">fprintf</span><span class="p">(</span><span class="n">stderr</span><span class="p">,</span> <span class="n">RED</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Failed to resolve ASN from IP: %s</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">,</span> <span class="n">token</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L285" data-line-number="285"></span></td>
							
							<td rel="L285" class="lines-code chroma"><code class="code-inner">            <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L286" data-line-number="286"></span></td>
							
							<td rel="L286" class="lines-code chroma"><code class="code-inner">                <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">GREEN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Resolved ASN for IP %s: %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="n">token</span><span class="p">,</span> <span class="n">asn</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L287" data-line-number="287"></span></td>
							
							<td rel="L287" class="lines-code chroma"><code class="code-inner">                <span class="nf">fetch_ip_ranges</span><span class="p">(</span><span class="n">asn</span><span class="p">,</span> <span class="n">output</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L288" data-line-number="288"></span></td>
							
							<td rel="L288" class="lines-code chroma"><code class="code-inner">                <span class="nf">fetch_bgpview_info</span><span class="p">(</span><span class="n">asn</span><span class="p">,</span> <span class="n">output</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L289" data-line-number="289"></span></td>
							
							<td rel="L289" class="lines-code chroma"><code class="code-inner">            <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L290" data-line-number="290"></span></td>
							
							<td rel="L290" class="lines-code chroma"><code class="code-inner">            <span class="n">token</span> <span class="o">=</span> <span class="nf">strtok</span><span class="p">(</span><span class="nb">NULL</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">,</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L291" data-line-number="291"></span></td>
							
							<td rel="L291" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L292" data-line-number="292"></span></td>
							
							<td rel="L292" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L293" data-line-number="293"></span></td>
							
							<td rel="L293" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L294" data-line-number="294"></span></td>
							
							<td rel="L294" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="nf">strlen</span><span class="p">(</span><span class="n">domains</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mi">0</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L295" data-line-number="295"></span></td>
							
							<td rel="L295" class="lines-code chroma"><code class="code-inner">        <span class="n">token</span> <span class="o">=</span> <span class="nf">strtok</span><span class="p">(</span><span class="n">domains</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">,</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L296" data-line-number="296"></span></td>
							
							<td rel="L296" class="lines-code chroma"><code class="code-inner">        <span class="k">while</span> <span class="p">(</span><span class="n">token</span> <span class="o">!</span><span class="o">=</span> <span class="nb">NULL</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L297" data-line-number="297"></span></td>
							
							<td rel="L297" class="lines-code chroma"><code class="code-inner">            <span class="kt">char</span> <span class="o">*</span><span class="n">resolved_ip</span> <span class="o">=</span> <span class="nf">resolve_domain_to_ip</span><span class="p">(</span><span class="n">token</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L298" data-line-number="298"></span></td>
							
							<td rel="L298" class="lines-code chroma"><code class="code-inner">            <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">resolved_ip</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L299" data-line-number="299"></span></td>
							
							<td rel="L299" class="lines-code chroma"><code class="code-inner">                <span class="nf">fprintf</span><span class="p">(</span><span class="n">stderr</span><span class="p">,</span> <span class="n">RED</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Failed to resolve domain to IP: %s</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">,</span> <span class="n">token</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L300" data-line-number="300"></span></td>
							
							<td rel="L300" class="lines-code chroma"><code class="code-inner">            <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L301" data-line-number="301"></span></td>
							
							<td rel="L301" class="lines-code chroma"><code class="code-inner">                <span class="kt">char</span> <span class="o">*</span><span class="n">asn</span> <span class="o">=</span> <span class="nf">get_asn_from_ip</span><span class="p">(</span><span class="n">resolved_ip</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L302" data-line-number="302"></span></td>
							
							<td rel="L302" class="lines-code chroma"><code class="code-inner">                <span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n">asn</span><span class="p">)</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L303" data-line-number="303"></span></td>
							
							<td rel="L303" class="lines-code chroma"><code class="code-inner">                    <span class="nf">fprintf</span><span class="p">(</span><span class="n">stderr</span><span class="p">,</span> <span class="n">RED</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Failed to resolve ASN from domain %s (IP %s)</span><span class="se">\n</span><span class="s">&#34;</span> <span class="n">RESET</span><span class="p">,</span> <span class="n">token</span><span class="p">,</span> <span class="n">resolved_ip</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L304" data-line-number="304"></span></td>
							
							<td rel="L304" class="lines-code chroma"><code class="code-inner">                <span class="p">}</span> <span class="k">else</span> <span class="p">{</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L305" data-line-number="305"></span></td>
							
							<td rel="L305" class="lines-code chroma"><code class="code-inner">                    <span class="nf">fprintf</span><span class="p">(</span><span class="n">output</span><span class="p">,</span> <span class="n">GREEN</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">Resolved ASN for domain %s (IP %s): %s</span><span class="se">\n</span><span class="s">&#34;</span><span class="p">,</span> <span class="n">token</span><span class="p">,</span> <span class="n">resolved_ip</span><span class="p">,</span> <span class="n">asn</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L306" data-line-number="306"></span></td>
							
							<td rel="L306" class="lines-code chroma"><code class="code-inner">                    <span class="nf">fetch_ip_ranges</span><span class="p">(</span><span class="n">asn</span><span class="p">,</span> <span class="n">output</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L307" data-line-number="307"></span></td>
							
							<td rel="L307" class="lines-code chroma"><code class="code-inner">                    <span class="nf">fetch_bgpview_info</span><span class="p">(</span><span class="n">asn</span><span class="p">,</span> <span class="n">output</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L308" data-line-number="308"></span></td>
							
							<td rel="L308" class="lines-code chroma"><code class="code-inner">                <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L309" data-line-number="309"></span></td>
							
							<td rel="L309" class="lines-code chroma"><code class="code-inner">            <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L310" data-line-number="310"></span></td>
							
							<td rel="L310" class="lines-code chroma"><code class="code-inner">            <span class="n">token</span> <span class="o">=</span> <span class="nf">strtok</span><span class="p">(</span><span class="nb">NULL</span><span class="p">,</span> <span class="sa"></span><span class="s">&#34;</span><span class="s">,</span><span class="s">&#34;</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L311" data-line-number="311"></span></td>
							
							<td rel="L311" class="lines-code chroma"><code class="code-inner">        <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L312" data-line-number="312"></span></td>
							
							<td rel="L312" class="lines-code chroma"><code class="code-inner">    <span class="p">}</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L313" data-line-number="313"></span></td>
							
							<td rel="L313" class="lines-code chroma"><code class="code-inner">
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L314" data-line-number="314"></span></td>
							
							<td rel="L314" class="lines-code chroma"><code class="code-inner">    <span class="k">if</span> <span class="p">(</span><span class="n">output</span> <span class="o">!</span><span class="o">=</span> <span class="n">stdout</span><span class="p">)</span> <span class="nf">fclose</span><span class="p">(</span><span class="n">output</span><span class="p">)</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L315" data-line-number="315"></span></td>
							
							<td rel="L315" class="lines-code chroma"><code class="code-inner">    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
</code></td>
						</tr>
						
						
						<tr>
							<td class="lines-num"><span id="L316" data-line-number="316"></span></td>
							
							<td rel="L316" class="lines-code chroma"><code class="code-inner"><span class="p">}</span>
</code></td>
						</tr>
						
					</tbody>
				</table>
				<div class="code-line-menu tippy-target">
					
						<a class="item ref-in-new-issue" role="menuitem" data-url-issue-new="/nieldk/aslookup/issues/new" data-url-param-body-link="/nieldk/aslookup/src/commit/1629e85f8557d89e6d2339237d2fba1022556ae9/aslookup.c" rel="nofollow noindex">Reference in a new issue</a>
					
					<a class="item view_git_blame" role="menuitem" href="/nieldk/aslookup/blame/commit/1629e85f8557d89e6d2339237d2fba1022556ae9/aslookup.c">View git blame</a>
					<a class="item copy-line-permalink" role="menuitem" data-url="/nieldk/aslookup/src/commit/1629e85f8557d89e6d2339237d2fba1022556ae9/aslookup.c">Copy permalink</a>
				</div>
				
			
		</div>
	</div>
</div>

		
	</div>
</div>


	

	</div>

	

	<footer class="page-footer" role="group" aria-label="Footer">
	<div class="grid" aria-label="Links">
		<div class="not-mobile">
			<div class="branding" aria-hidden="true">
				<img src="https://design.codeberg.org/logo-kit/icon_inverted.svg" alt="Logo">
			</div>
			<div class="powered-by">
				<div class="title">Powered by</div>
				<p class="tw-mb-0">
					<a target="_blank" rel="noopener noreferrer" href="https://forgejo.org" aria-label="Forgejo">
						<img class="light-logo" loading="lazy" src="/assets/img/svg/forgejo-wordmark.svg" alt="Forgejo logo">
						<img class="dark-logo" loading="lazy" src="/assets/img/svg/forgejo-wordmark-mono.svg" alt="Forgejo logo">
					</a>
				</p>
				with <a class="tw-mt-0" href="/Codeberg-Infrastructure/forgejo" target="_blank">modifications</a>
			</div>
		</div>
		<div>
			<b id="codeberg-codeberg">Codeberg</b>
			<ul>
				<a href="https://blog.codeberg.org" target="_blank">Blog</a>
				<li><a href="https://docs.codeberg.org" target="_blank">Documentation</a></li>
				<li><a href="/Codeberg/Community/issues">Community Issues</a></li>
				
				<li><a href="/Codeberg/Contributing">Contributing</a>
				<li><a href="https://docs.codeberg.org/contact/#abuse" target="_blank">Report Abuse</a>
			</ul>
		</div>
		<div>
			<b id="codeberg-association">Association</b>
			<ul>
				<li><a href="https://docs.codeberg.org/getting-started/what-is-codeberg/#what-is-codeberg-e.v.%3F" target="_blank">Who are we?</a></li>
				<li><a href="/codeberg/org/src/en/bylaws.md" target="_blank">Bylaws / Satzung</a></li>
				<li><a href="https://docs.codeberg.org/improving-codeberg/donate/" target="_blank">Donate</a></li>
				<li><a href="https://join.codeberg.org" target="_blank">Join / Support</a></li>
				<li><a href="https://docs.codeberg.org/contact/" target="_blank">Contact</a></li>
			</ul>
		</div>
		<div>
			<b id="codeberg-service">Services</b>
			<ul>
				<li><a href="https://codeberg.page" target="_blank">Codeberg Pages</a></li>
				<li><a href="https://translate.codeberg.org" target="_blank">Codeberg Translate</a></li>
				<li><a href="https://docs.codeberg.org/ci/#using-codeberg's-instance-of-woodpecker-ci" target="_blank">Woodpecker CI</a></li>
				
					<li><a href="/api/swagger">Forgejo API</a></li>
				
				<li><a href="https://status.codeberg.eu" target="_blank">Status Page</a></li>
			</ul>
		</div>
		<div>
			<b id="codeberg-legal">Legal</b>
			<ul>
				<li><a href="/codeberg/org/src/Imprint.md" target="_blank">Imprint / Impressum</a></li>
				<li><a href="/codeberg/org/src/PrivacyPolicy.md" target="_blank">Privacy Policy</a></li>
				<li><a href="/assets/licenses.txt">Licenses</a></li>
				<li><a href="/codeberg/org/src/TermsOfUse.md">Terms of Use</a></li>
			</ul>
		</div>
	</div>
	<div class="footer-bottom-grid">
		<div class="footer-social">
			<a href="https://social.anoxinon.de/@Codeberg" target="_blank" rel="noopener noreferrer">Mastodon</a> |
			<a href="matrix:r/codeberg-space:matrix.org?action=join" target="_blank" rel="noopener noreferrer">Matrix Space</a>
			<a href="https://matrix.to/#/#codeberg-space:matrix.org" target="_blank" rel="noopener noreferrer">(Web link)</a>
			<button class="btn interact-fg tw-p-2" data-clipboard-text="#codeberg-space:matrix.org" data-tooltip-content="Copy to clipboard"><svg viewBox="0 0 16 16" class="svg octicon-copy" aria-hidden="true" width="14" height="14"><path d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 0 1 0 1.5h-1.5a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-1.5a.75.75 0 0 1 1.5 0v1.5A1.75 1.75 0 0 1 9.25 16h-7.5A1.75 1.75 0 0 1 0 14.25Z"/><path d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0 1 14.25 11h-7.5A1.75 1.75 0 0 1 5 9.25Zm1.75-.25a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-7.5a.25.25 0 0 0-.25-.25Z"/></svg></button>
			<p class="only-mobile">
				<a target="_blank" rel="noopener noreferrer" href="https://forgejo.org">Powered by Forgejo</a>
			</p>
		</div>
		<div class="footer-language-switch">
			<div class="ui language bottom floating slide up dropdown link item button">
				<svg viewBox="0 0 16 16" class="svg octicon-globe" aria-hidden="true" width="16" height="16"><path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M5.78 8.75a9.64 9.64 0 0 0 1.363 4.177q.383.64.857 1.215c.245-.296.551-.705.857-1.215A9.64 9.64 0 0 0 10.22 8.75Zm4.44-1.5a9.64 9.64 0 0 0-1.363-4.177c-.307-.51-.612-.919-.857-1.215a10 10 0 0 0-.857 1.215A9.64 9.64 0 0 0 5.78 7.25Zm-5.944 1.5H1.543a6.51 6.51 0 0 0 4.666 5.5q-.184-.271-.352-.552c-.715-1.192-1.437-2.874-1.581-4.948m-2.733-1.5h2.733c.144-2.074.866-3.756 1.58-4.948q.18-.295.353-.552a6.51 6.51 0 0 0-4.666 5.5m10.181 1.5c-.144 2.074-.866 3.756-1.58 4.948q-.18.296-.353.552a6.51 6.51 0 0 0 4.666-5.5Zm2.733-1.5a6.51 6.51 0 0 0-4.666-5.5q.184.272.353.552c.714 1.192 1.436 2.874 1.58 4.948Z"/></svg>
				<div class="text">English</div>
				<div class="menu language-menu">
					
						<a lang="id-ID" data-url="/?lang=id-ID" class="item ">Bahasa Indonesia</a>
					
						<a lang="da" data-url="/?lang=da" class="item ">Dansk</a>
					
						<a lang="de-DE" data-url="/?lang=de-DE" class="item ">Deutsch</a>
					
						<a lang="en-US" data-url="/?lang=en-US" class="item active selected">English</a>
					
						<a lang="es-ES" data-url="/?lang=es-ES" class="item ">Español</a>
					
						<a lang="eo" data-url="/?lang=eo" class="item ">Esperanto</a>
					
						<a lang="fil" data-url="/?lang=fil" class="item ">Filipino</a>
					
						<a lang="fr-FR" data-url="/?lang=fr-FR" class="item ">Français</a>
					
						<a lang="it-IT" data-url="/?lang=it-IT" class="item ">Italiano</a>
					
						<a lang="lv-LV" data-url="/?lang=lv-LV" class="item ">Latviešu</a>
					
						<a lang="hu-HU" data-url="/?lang=hu-HU" class="item ">Magyar nyelv</a>
					
						<a lang="nl-NL" data-url="/?lang=nl-NL" class="item ">Nederlands</a>
					
						<a lang="nds" data-url="/?lang=nds" class="item ">Plattdüütsch</a>
					
						<a lang="pl-PL" data-url="/?lang=pl-PL" class="item ">Polski</a>
					
						<a lang="pt-PT" data-url="/?lang=pt-PT" class="item ">Português de Portugal</a>
					
						<a lang="pt-BR" data-url="/?lang=pt-BR" class="item ">Português do Brasil</a>
					
						<a lang="sl" data-url="/?lang=sl" class="item ">Slovenščina</a>
					
						<a lang="fi-FI" data-url="/?lang=fi-FI" class="item ">Suomi</a>
					
						<a lang="sv-SE" data-url="/?lang=sv-SE" class="item ">Svenska</a>
					
						<a lang="tr-TR" data-url="/?lang=tr-TR" class="item ">Türkçe</a>
					
						<a lang="cs-CZ" data-url="/?lang=cs-CZ" class="item ">Čeština</a>
					
						<a lang="el-GR" data-url="/?lang=el-GR" class="item ">Ελληνικά</a>
					
						<a lang="bg" data-url="/?lang=bg" class="item ">Български</a>
					
						<a lang="ru-RU" data-url="/?lang=ru-RU" class="item ">Русский</a>
					
						<a lang="uk-UA" data-url="/?lang=uk-UA" class="item ">Українська</a>
					
						<a lang="fa-IR" data-url="/?lang=fa-IR" class="item ">فارسی</a>
					
						<a lang="ja-JP" data-url="/?lang=ja-JP" class="item ">日本語</a>
					
						<a lang="zh-CN" data-url="/?lang=zh-CN" class="item ">简体中文</a>
					
						<a lang="zh-TW" data-url="/?lang=zh-TW" class="item ">繁體中文（台灣）</a>
					
						<a lang="zh-HK" data-url="/?lang=zh-HK" class="item ">繁體中文（香港）</a>
					
						<a lang="ko-KR" data-url="/?lang=ko-KR" class="item ">한국어</a>
					
				</div>
			</div>
		</div>
	</div>
	<div class="tw-hidden">
		
			Page: 170ms<br>
			Template: 18ms
		
	</div>
    
	
		<div class="symbol-of-tolerance" role="img"></div>
	
</footer>


	<script src="/assets/js/index.js?v=13.0.0-dev-651-a48dce80~gitea-1.22.0" onerror="alert('Failed to load asset files from {path}. Please make sure the asset files can be accessed.'.replace('{path}', this.src))"></script>

	
</body>
</html>

