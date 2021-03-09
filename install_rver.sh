#!/bin/bash

rver=$1

bash -c "$(curl -L https://rstd.io/r-install)" << EOF
$rver
y
EOF


