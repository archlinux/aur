package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
	"strings"
)

const dockerDbDir = "/var/lib/docker/image/btrfs"
const repoFile = dockerDbDir + "/repositories.json"
const cfgFile = "/etc/docker-btrfs.json"

func getImageTag() (string, string) {
	buf, err := ioutil.ReadFile(cfgFile)
	if err != nil {
		panic(err)
	}
	var dat map[string]interface{}
	err = json.Unmarshal(buf, &dat)
	if err != nil {
		panic(err)
	}
	return dat["docker_image"].(string), dat["docker_tag"].(string)
}

func getImageID(image string, tag string) string {
	buf, err := ioutil.ReadFile(repoFile)
	if err != nil {
		panic(err)
	}
	var dat map[string]interface{}
	err = json.Unmarshal(buf, &dat)
	if err != nil {
		panic(err)
	}
	repositories := dat["Repositories"].(map[string]interface{})
	imageTags := repositories[image].(map[string]interface{})
	return imageTags[image+":"+tag].(string)
}

func getDiffIDs(imgID string) []string {
	imgPath := strings.Replace(imgID, ":", "/", 1)
	buf, err := ioutil.ReadFile(dockerDbDir + "/imagedb/content/" + imgPath)
	if err != nil {
		panic(err)
	}
	var dat map[string]interface{}
	err = json.Unmarshal(buf, &dat)
	if err != nil {
		panic(err)
	}
	rootfs := dat["rootfs"].(map[string]interface{})
	diffIDsInterface := rootfs["diff_ids"].([]interface{})
	diffIDsStr := make([]string, len(diffIDsInterface))
	for i, v := range diffIDsInterface {
		diffIDsStr[i] = strings.Replace(v.(string), "sha256:", "", 1)
	}
	return diffIDsStr
}

type node struct {
	parent string
	id     string
	diff   string
	cache  string
}

func getNode(id string) node {
	var node node

	node.id = id

	buf, err := ioutil.ReadFile(dockerDbDir + "/layerdb/sha256/" + id + "/cache-id")
	if err != nil {
		panic(err)
	}
	node.cache = strings.Replace(string(buf), "sha256:", "", 1)

	buf, err = ioutil.ReadFile(dockerDbDir + "/layerdb/sha256/" + id + "/diff")
	if err != nil {
		panic(err)
	}
	node.diff = strings.Replace(string(buf), "sha256:", "", 1)

	buf, err = ioutil.ReadFile(dockerDbDir + "/layerdb/sha256/" + id + "/parent")
	if os.IsNotExist(err) {
		node.parent = ""
	} else if err != nil {
		panic(err)
	} else {
		node.parent = strings.Replace(string(buf), "sha256:", "", 1)
	}
	return node
}

func readLayerInfo() map[string]node {
	files, err := ioutil.ReadDir(dockerDbDir + "/layerdb/sha256/")
	if err != nil {
		panic(err)
	}
	nodes := make(map[string]node)
	for i := range files {
		id := files[i].Name()
		nodes[id] = getNode(id)
	}
	return nodes
}

func searchForCacheID(diffIDs []string, layers map[string]node) string {
	candidates := make([]string, 0, len(layers))
	last := diffIDs[len(diffIDs)-1]
	for i, v := range layers {
		if v.diff == last {
			sz := len(candidates)
			candidates = candidates[:sz+1]
			candidates[sz] = i
		}
	}
	candidatesCurrent := make([]string, len(candidates))
	for i, v := range candidates {
		candidatesCurrent[i] = layers[v].parent
	}
	for i := len(diffIDs) - 2; i >= 0; i-- {
		for j := 0; j < len(candidates); {
			if layers[candidatesCurrent[j]].diff == diffIDs[i] {
				candidatesCurrent[j] = layers[candidatesCurrent[j]].parent
				j++
			} else {
				oldLen := len(candidates)
				candidates[j] = candidates[oldLen-1]
				candidatesCurrent[j] = candidatesCurrent[oldLen-1]
				candidates = candidates[:oldLen-1]
				candidatesCurrent = candidatesCurrent[:oldLen-1]
			}
		}
	}
	return layers[candidates[0]].cache
}

func main() {
	image, tag := getImageTag()
	imgID := getImageID(image, tag)
	diffIDs := getDiffIDs(imgID)
	layers := readLayerInfo()
	cacheID := searchForCacheID(diffIDs, layers)
	fmt.Print(cacheID)
}
