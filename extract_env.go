package main

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"
	"log"
	"os"
	"regexp"
	"strings"
)

type EnvField struct {
	Name        string
	Default     string
	Description string
	Example     string
}

func main() {
	filename := "conf/settings.go" // ← 改为你实际路径

	fset := token.NewFileSet()
	node, err := parser.ParseFile(fset, filename, nil, parser.AllErrors)
	if err != nil {
		log.Fatalf("failed to parse file: %v", err)
	}

	var fields []EnvField
	extractFromNode(node, "", &fields)

	f, err := os.Create(".env.example")
	if err != nil {
		log.Fatalf("failed to create .env.example: %v", err)
	}
	defer f.Close()

	for _, field := range fields {
		if field.Description != "" {
			fmt.Fprintf(f, "## env-description: %s\n", field.Description)
		}
		if field.Default != "" {
			fmt.Fprintf(f, "## env-default: %s\n", field.Default)
		}
		if field.Example != "" {
			fmt.Fprintf(f, "## eg: %s\n", field.Example)
		}
		fmt.Fprintf(f, "#%s=\"\"\n\n", field.Name)
	}
}

func extractFromNode(node ast.Node, parentPrefix string, fields *[]EnvField) {
	ast.Inspect(node, func(n ast.Node) bool {
		decl, ok := n.(*ast.GenDecl)
		if !ok || decl.Tok != token.TYPE {
			return true
		}

		for _, spec := range decl.Specs {
			typeSpec, ok := spec.(*ast.TypeSpec)
			if !ok {
				continue
			}

			if structType, ok := typeSpec.Type.(*ast.StructType); ok {
				extractFromStruct(structType, parentPrefix, fields)
			}
		}
		return false
	})
}

func extractFromStruct(st *ast.StructType, prefix string, fields *[]EnvField) {
	for _, field := range st.Fields.List {
		tag := ""
		if field.Tag != nil {
			tag = strings.Trim(field.Tag.Value, "`")
		}
		env := getTagValue(tag, "env")
		envDefault := getTagValue(tag, "env-default")
		envDesc := getTagValue(tag, "env-description")
		envPrefix := getTagValue(tag, "env-prefix")
		fullPrefix := prefix + envPrefix

		if env != "" {
			description, example := splitDescriptionAndExample(envDesc)

			*fields = append(*fields, EnvField{
				Name:        fullPrefix + env,
				Default:     envDefault,
				Description: description,
				Example:     example,
			})
			continue
		}

		if structType, ok := field.Type.(*ast.StructType); ok {
			extractFromStruct(structType, fullPrefix, fields)
		}
	}
}

func getTagValue(tag, key string) string {
	re := regexp.MustCompile(fmt.Sprintf(`%s:"([^"]+)"`, key))
	match := re.FindStringSubmatch(tag)
	if len(match) > 1 {
		return match[1]
	}
	return ""
}

func splitDescriptionAndExample(desc string) (string, string) {
	if strings.Contains(desc, "eg:") {
		parts := strings.SplitN(desc, "eg:", 2)
		return strings.TrimSpace(parts[0]), strings.TrimSpace(parts[1])
	}
	return strings.TrimSpace(desc), ""
}
