package main

import (
	"encoding/json"
	"fmt"
	"os"
	"strings"
	"io/ioutil"
)

const DOCKER_DB_DIR = "/var/lib/docker/image/btrfs"
const REPO_FILE = DOCKER_DB_DIR + "/repositories.json"
const CFG_FILE = "/etc/docker-btrfs.json"

func getImageTag() (string, string) {
	buf, err := ioutil.ReadFile(CFG_FILE)
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

func getImageId(image string, tag string) string {
	buf, err := ioutil.ReadFile(REPO_FILE)
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

func getDiffIds(imgId string) []string {
	imgPath := strings.Replace(imgId, ":", "/", 1)
	buf, err := ioutil.ReadFile(DOCKER_DB_DIR + "/imagedb/content/" + imgPath)
	if err != nil {
		panic(err)
	}
	var dat map[string]interface{}
	err = json.Unmarshal(buf, &dat)
	if err != nil {
		panic(err)
	}
	rootfs := dat["rootfs"].(map[string]interface{})
	diffIdsInterface := rootfs["diff_ids"].([]interface{})
	diffIdsStr := make([]string, len(diffIdsInterface))
	for i, v := range diffIdsInterface {
		diffIdsStr[i] = strings.Replace(v.(string), "sha256:", "", 1)
	}
	return diffIdsStr
}

type Node struct {
	parent string
	id string
	diff string
	cache string
}

func getNode(id string) Node {
	var node Node

	node.id = id

	buf, err := ioutil.ReadFile(DOCKER_DB_DIR + "/layerdb/sha256/" + id + "/cache-id")
	if err != nil {
		panic(err)
	}
	node.cache = strings.Replace(string(buf), "sha256:", "", 1)

	buf, err = ioutil.ReadFile(DOCKER_DB_DIR + "/layerdb/sha256/" + id + "/diff")
	if err != nil {
		panic(err)
	}
	node.diff = strings.Replace(string(buf), "sha256:", "", 1)

	buf, err = ioutil.ReadFile(DOCKER_DB_DIR + "/layerdb/sha256/" + id + "/parent")
	if os.IsNotExist(err) {
		node.parent = ""
	} else if err != nil {
		panic(err)
	} else {
		node.parent = strings.Replace(string(buf), "sha256:", "", 1)
	}
	return node
}

func readLayerInfo() map[string]Node {
	files, err := ioutil.ReadDir(DOCKER_DB_DIR + "/layerdb/sha256/")
    if err != nil {
        panic(err)
	}
	nodes := make(map[string]Node)
	for i, _ := range files {
		id := files[i].Name()
		nodes[id] = getNode(id)
	}
	return nodes
}

func searchForCacheId(diffIds []string, layers map[string]Node) string {
	candidates := make([]string, 0, len(layers))
	last := diffIds[len(diffIds)-1]
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
	for i := len(diffIds)-2; i>=0; i-- {
		for j := 0; j < len(candidates); {
			if layers[candidatesCurrent[j]].diff == diffIds[i] {
				candidatesCurrent[j] = layers[candidatesCurrent[j]].parent
				j++;
			} else {
				oldLen := len(candidates)
				candidates[j] = candidates[oldLen-1]
				candidatesCurrent[j] = candidatesCurrent[oldLen-1]
				candidates = candidates[:oldLen-1]
				candidatesCurrent = candidatesCurrent[:oldLen - 1]
			}
		}
	}
	return candidates[0]
}

func main() {
	image, tag := getImageTag()
	imgId := getImageId(image, tag)
	diffIds := getDiffIds(imgId)
	layers := readLayerInfo()
	cacheId := searchForCacheId(diffIds, layers)
	fmt.Print(cacheId)
}
