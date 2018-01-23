#!/bin/sh

#Subreddit Scraper - to download posts (eg. images) fitting certain criteria from a subreddit, and commonly linked sites
#Oliver Galvin - 2017-18

### User Modifiable Parameters
###
target=25		#Number of posts to try to scrape, 0 for no target
limit=100		#Max number of posts to search, should be >= target, 0 for no limit
post=0			#1 to allow text posts, 0 to only allow links
nonimage=0		#1 to allow non-image links, 0 to allow only images
gif=0			#1 to allow animations/videos, 0 to only allow static images
album=1			#1 to allow imgur albums, 0 to only allow single images
insta=1			#1 to also get images from instagram posts
tumblr=1		#1 to also get images from tumblr posts
###

#Error handling
depends="sh curl jq sed grep find"
for c in $depends; do if ! command -v "$c" >/dev/null 2>&1; then echo "Dependency ${c} is missing. Aborting."; exit 1; fi; done
if [ $# -gt 2 ]; then echo "Too many options. Aborting."; exit 1; fi
if [ $# = 1 ] && [ ! "$1" = "-h" ]; then echo "Missing option. Aborting."; exit 1; fi
trap 'echo "Interrupted, finishing early."; exit 1' INT

#Global variables
name=$(date +%s)
tally=0
url=$2; url=${url#*//}; url=${url#m.}

clean () {
	sub="$1"
	if [ -z "${sub}" ] || [ ! -d "${sub}" ]; then echo "Dump ${sub} does not exist. Aborting."; exit; fi
	echo "Tidying dump of /r/${sub} to remove failed downloads or duplicates/reposts."
	rm -f "${sub}/temp" "${sub}/found"

	printf "Removing empty files... "
	c=$(find "${sub}" -type f | wc -l)
	du -a "$sub" | grep '^0' | cut -f2 | xargs rm -f
	d=$(find "${sub}" -type f | wc -l)
	echo "done, $(( c-d )) files removed"

	printf "Removing corrupt/invalid files... "
	if [ "$post" = 0 ] && [ "$nonimage" = 0 ] || [ "$gif" = 0 ]; then
		data=$(file -i "$sub"/*)
		if [ "$post" = 0 ] && [ "$nonimage" = 0 ]; then echo "$data" | grep 'text/' | cut -d':' -f1 | xargs rm -f; fi
		if [ "$gif" = 0 ]; then echo "$data" | grep '/gif' | cut -d':' -f1 | xargs rm -f; fi
	fi
	if [ "$album" = 0 ]; then find "$sub" -name '*-*' -exec rm -f {} + ; fi
	c=$(find "${sub}" -type f | wc -l)
	echo "done, $(( d-c )) files removed"

	printf "Removing duplicates... "
	old=""
	b2sum "$sub"/* | sort | uniq -Dw 128 | while IFS= read -r line; do
		new=${line% *}
		if [ "$new" = "$old" ]; then rm -f "${line#*  }"; fi
		old="$new"
	done
	d=$(find "${sub}" -type f | wc -l)
	echo "done, $(( c-d )) files removed"

	echo
	echo "${d} files remaining."
}

getinsta () {
	#Downloads image from an instagram post, a video if gifs are enabled, multiple images if albums are enabled
	url="$1"; term="sharedData = "
	url="https://www.instagram.com$(echo "$url" | grep -Po '/p/[[:alnum:]]*')/" 
	data=$(curl -sk --retry 1 "${url}" | grep -Po "${term}{.*}" | sed "s/$term//g")
	[ -z "$data" ] && return
	type=$(echo "$data" | jq -r '.entry_data.PostPage[0].graphql.shortcode_media.__typename')
	case ${type} in
		GraphImage)	#Static image
			: $(( tally=tally+1 ))
			url=$(echo "$data" | jq -r '.entry_data.PostPage[0].graphql.shortcode_media.display_resources[2].src')
			ext=${url##*.}
			curl -sk --retry 1 "$url" -o "${name}.${ext}" & ;;
		GraphSidecar)	#Album
			: $(( tally=tally+1 ))
			c=$(echo "$data" | jq -r '.entry_data.PostPage[0].graphql.shortcode_media.edge_sidecar_to_children.edges | length')
			l=${#c}; i=0
			list=$(echo "$data" | jq -r '.entry_data.PostPage[0].graphql.shortcode_media.edge_sidecar_to_children.edges[].node.display_resources[2].src')
			for url in $list; do
				: $(( i=i+1 ))
				j=$(printf "%0${l}d" $i)
				ext=${url##*.}
				curl -sk --retry 1 "$url" -o "${name}-${j}.${ext}" &
			done ;;
		GraphVideo) 	#Video clip
			if [ "$gif" = 1 ]; then
				: $(( tally=tally+1 ))
				url=$(echo "$data" | jq -r '.entry_data.PostPage[0].graphql.shortcode_media.video_url')
				ext=${url##*.}
				curl -sk --retry 1 "$url" -o "${name}.${ext}" &
			fi ;;
	esac
}

gettumblr () {
	#Find single image link from Open Graph tag and download from a tumblr post
	url="$1"; url=${url#*//}; url=${url%\?*}; term="\"og:image\" content="
	url=$(curl -sLk --retry 1 "http://${url}" | grep -Po "${term}\".*?\"" | sed "s/${term}//g" | tr -d '"')
	[ -z "$url" ] && return
	ext=${url##*.}
	if [ "$gif" = 0 ]; then case "$ext" in gif|gifv|webm|mp4) return ;; esac; fi
	[ -f "${name}.${ext}" ] && return
	: $(( tally=tally+1 ))
	curl -sk --retry 1 "$url" -o "${name}.${ext}" &
}

getalbum () {
	#Downloads all images from an imgur album, if they are new and they match gif preference
	url="$1"; url=${url#*//}; url=${url%\?*}; term="item: "
	data=$(curl -sk --retry 1 "https://${url}" | grep -Po "${term}{.*}" | sed "s/${term}//g")
	[ -z "$data" ] && return
	base="http://i.imgur.com/"
	case "${url%/*}" in
		*/a|*/gallery)
			c=$(echo "$data" | jq -r '.album_images.images | length')
			list=$(echo "$data" | jq -r '.album_images.images | map(.hash,.ext) | join(",")' | sed -e 's/,\./\./g' -e 's/,/\n/g')
			i=0; l=${#c}
			for img in $list; do
				img=${img%\?*}
				ext=${img##*.}
				if [ "$gif" = 0 ]; then case "$ext" in gif|gifv|webm|mp4) continue ;; esac; fi
				: $(( i=i+1 ))
				j=$(printf "%0${l}d" $i)
				if [ "$c" = 1 ]; then new="${name}.${ext}"
				else new="${name}-${j}.${ext}"; fi
				[ -f "$new" ] && continue
				url="${base}${img}"
				curl -sk --retry 1 "$url" -o "${new}" &
			done
			if [ "$i" -gt 0 ]; then : $(( tally=tally+1 )); fi ;;
		*)
			ext=$(echo "$data" | jq -r '.ext')
			ext=${ext%\?*}
			if [ "$gif" = 0 ]; then case "$ext" in .gif|.gifv|.webm|.mp4) return ;; esac; fi
			hash=$(echo "$data" | jq -r '.hash')
			url="${base}${hash}${ext}"
			curl -sk --retry 1 "$url" -o "${name}${ext}" &
			: $(( tally=tally+1 ))
			;;
	esac
}

getsub () {
	echo "Scraping ${target} posts from /r/${sub} matching your criteria."
	echo

	printf "Initialising... "
	sub=$1; page=0; max=1000; per=$max; before=$(date +%s)
	if [ -z "$sub" ]; then echo "No subreddit given. Aborting."; exit 1; fi
	api="https://elastic.pushshift.io/rs/submissions/_search/?sort=created_utc:desc&_source=url,permalink,created_utc"
	if ! ping -c1 elastic.pushshift.io > /dev/null 2>&1; then echo "pushshift.io API is down, try again later. Aborting."; exit 1; fi
	mkdir -p "$sub"; cd "$sub" || exit
	trap 'echo "Interrupted, removing temporary files and finishing early."; rm -f temp found; exit 1' INT
	find . -type f -printf "%f\\n" | sed 's/[\.-].*//g' | sort -u | sed ':r;s/^0//g;tr' > found
	if [ "$limit" -gt 0 ] && [ "$limit" -le "$per" ]; then per=$limit; fi
	echo "done."

	#Loop for each subreddit page
	until [ "$tally" -ge "$target" ] && [ "$target" -gt 0 ] || [ "$per" -le 0 ] || [ "$before" = "null" ]; do
		printf "Getting JSON data... "
		url="${api}&size=${per}&q=(subreddit:${sub}%20AND%20created_utc:%3C${before})"
		curl -sk --retry 1 "$url" -o temp
		list=$(jq -j '.hits.hits[]._source | .url + ",",(.permalink | split("/")[4] + "\n")' temp | grep -vf found | sed 's/amp;//g')
		[ "$gif" = 0 ] && list=$(echo "$list" | grep -v -e 'gfycat' -e '\.gif')
		before=$(jq -r ".hits.hits[$(( per-1 ))]._source.created_utc" temp)
		echo "done."
		printf "Searching page... "
		#Loop for each post
		for pair in $list; do
			if [ ! "$target" = 0 ] && [ "$tally" -ge "$target" ]; then break; fi
			name="${pair##*,}"
			[ "$name" = "$pair" ] && continue
			p=0; n=0; a=0; g=0; i=0; t=0
			url=${pair%,*}; url=${url#*//}; url=${url#m.}
			ext=.${url##*.}; ext=${ext%\?*}
			case ${url%%/*} in
				*reddit.com) p=1; ext=".html" ;;
				i.reddituploads.com)
					ext=$(curl -skI "$url" | grep 'content-type:')
					ext=${ext##*/} ;;
				gfycat.com|www.gfycat.com) ext=".webm"; url="giant.${url}${ext}" ;;
				instagram.com|www.instagram.com) i=1; url=${url%\?*} ;;
				*.tumblr.com) [ ${#ext} -gt 5 ] && t=1 ;;
				imgur.com|www.imgur.com)
					if [ ${#ext} -le 5 ]; then url="i.${url}";
					else a=1; fi ;;
				*) if [ "${url##*_}" = "d${ext}" ]; then url="${url%_*}${ext%\?*}"; fi ;;
			esac
			case "$ext" in
				.gif|.gifv|.webm|.mp4) g=1 ;;
				.jpg|.jpeg|.png|.webp|.svg) ;;
				.htm|.html|.php) n=1 ;;
				*)
					if [ "$a" = 0 ] && [ "$i" = 0 ] && [ "$t" = 0 ]; then n=1; fi
					ext="" ;;
			esac
			[ ${#name} -lt 6 ] && name=$(printf "%0$((6-${#name}))d$name")
			name="${name}${ext}"
			if [ "$p" -le "$post" ] && \
			   [ "$n" -le "$nonimage" ] && \
			   [ "$a" -le "$album" ] && \
			   [ "$g" -le "$gif" ] && \
			   [ "$i" -le "$insta" ] && \
			   [ "$t" -le "$tumblr" ]; then
				if [ "$a" = 1 ]; then getalbum "$url"
				elif [ "$i" = 1 ]; then getinsta "$url"
				elif [ "$t" = 1 ]; then gettumblr "$url"
				else curl -sk --retry 1 "http://${url}" -o "$name" &
					 : $(( tally=tally+1 ))
				fi
			fi
		done
		echo "${tally} posts found so far"
		if [ "$limit" -gt 0 ]; then
			: $(( page=page+1 ))
			[ $(( max*(page+1) )) -ge $limit ] && per=$(( limit-max*page ))
		fi
	done
	rm -f temp found
	printf "Finishing downloads... "
	wait
	cd ..
	echo "done."

	echo
	echo "Saved content from ${tally} posts to $(pwd)/${sub}"
	[ "$per" -le 0 ] && echo "Reached the limit of posts to search and could not find enough posts matching your criteria."
	[ "$before" = "null" ] && echo "Ran out of posts in the subreddit to search, could not find enough posts."
}

case $1 in
	-s|--sub) getsub "$2" ;;
	-c|--clean) clean "$2" ;;
	-i|--instagram) getinsta "$url" ;;
	-a|--album) getalbum "$url" ;;
	-t|--tumblr) gettumblr "$url" ;;
	-h|--help|'')
	echo "
Usage: scrapesub [-s subreddit] [-c subreddit] [-a URL] [-i URL] [-t URL] [-h]
       Subreddit Scraper - to download posts (eg. images) fitting certain criteria from a subreddit, and commonly linked sites

Arguments:
	-h, --help	Display this message and exit
	-s, --sub	Scrape posts from the given subreddit
	-c, --clean	Tidy reposts/failures from a subreddit dump
	-a, --album	Download all images in an Imgur album at URL
	-i, --instagram	Download images/videos from an Instagram post at URL
	-t, --tumblr	Download all images in a Tumblr post at URL
	" ;;
	*) echo "Invalid option. Aborting."; exit 1 ;;
esac
