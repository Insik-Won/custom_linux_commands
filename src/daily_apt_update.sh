#!/usr/bin/env bash

apt_check_file="/var/cache/apt/pkgcache.bin"

now_days=$(( $(date +%s) / (60*60*24) ))
file_modify_days=$(( $(date -r "${apt_check_file}" +%s) / (60*60*24) ))

if (( "${now_days}" - "${file_modify_days}" > 0 )); then
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt autoremove -y	
fi
