#!/bin/sh
ln -s /usr/share/openmalaria/scenario_current.xsd "$(pwd)/scenario_current.xsd"
ln -s /usr/share/openmalaria/densities.csv "$(pwd)/densities.csv"
ln -s /usr/share/openmalaria/autoRegressionParameters.csv "$(pwd)/autoRegressionParameters.csv"
/usr/bin/openMalaria "$@"
unlink scenario_current.xsd
unlink densities.csv
unlink autoRegressionParameters.csv
