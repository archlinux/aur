package main

import (
	_ "embed"
	"text/template"
)

//go:embed PKGBUILD.tmpl
var pkgbuildTemplateSource string
var pkgbuildTemplate = template.Must(
	template.New("PKGBUILD").Parse(pkgbuildTemplateSource),
)
