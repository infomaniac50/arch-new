#!/bin/bash

source arch-common.sh

arch_term

curl -Ss http://pastebin.ca/raw/2404700 | tr -d "\r" > pacmrr
bash pacmrr

echo ""
echo "We are done for now."
echo "You should make your disk partitions now."
echo "Run arch-fresh.sh after you have mounted your new filesystems."
echo "Exiting..."
