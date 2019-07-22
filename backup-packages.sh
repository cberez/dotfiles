#!/bin/bash

pacman -Qe | cut -f1 -d ' ' > "$(dirname $0)"/packman.packages
