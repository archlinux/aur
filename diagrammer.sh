#!/bin/sh

java -cp /usr/share/scala/diagrammer/diagrammer.jar dotvisualizer.FirrtlDiagrammer ${@:1}
