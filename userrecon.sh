#!/bin/bash

# UserRecon v1.0

# Author: @thelinuxchoice

# https://github.com/thelinuxchoice/usercheck

trap 'printf "\n";partial;exit 1' 2

banner() {

printf "                                                   \e[1;92m.-\"\"\"\"-. \e[0m\n"

printf "                                                  \e[1;92m/        \ \e[0m\n"

printf "\e[1;77m  _   _               ____                       \e[0m\e[1;92m/_        _\ \e[0m\n"

printf "\e[1;77m | | | |___  ___ _ __|  _ \ ___  ___ ___  _ __  \e[0m\e[1;92m// \      / \\ \e[0m\n"

printf "\e[1;77m | | | / __|/ _ \ '__| |_) / _ \/ __/ _ \| '_ \ \e[0m\e[1;92m|\__\    /__/| \e[0m\n"

printf "\e[1;77m | |_| \__ \  __/ |  |  _ <  __/ (_| (_) | | | | \e[0m\e[1;92m\    ||    / \e[0m\n"

printf "\e[1;77m  \___/|___/\___|_|  |_| \_\___|\___\___/|_| |_|  \e[0m\e[1;92m\        / \e[0m\n"

printf "                   \e[1;92mv1.0, Author: @thelinuxchoice\e[0m   \e[1;92m\  __  / \e[0m\n"

printf "                                                    \e[1;92m'.__.' \e[0m\n"

                                                

}

partial() {

if [[ -e $username.txt ]]; then

printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s.txt\n" $username

fi

}

scanner() {

read -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] Input Username:\e[0m ' username

if [[ -e $username.txt ]]; then

printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Removing previous file:\e[0m\e[1;77m %s.txt" $username

rm -rf $username.txt

fi

printf "\n"

printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking username\e[0m\e[1;77m %s\e[0m\e[1;92m on: \e[0m\n" $username

## INSTAGRAM

check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"

if [[ $check_insta == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.instagram.com/%s\n" $username

printf "https://www.instagram.com/%s\n" $username > $username.txt

elif [[ $check_insta == *'0'* ]]; then

printf "\e[1;93mNot Found!\e[0m\n"

fi

## TELEGRAM

check_telegram=$(curl -s -H "Accept-Language: en" "https://www.t.me/$username" -L | grep -o 'The link you followed may be broken'; echo $?)

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"

if [[ $check_telegram == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.t.me/%s\n" $username

printf "https://www.t.me/%s\n" $username > $username.txt

elif [[ $check_telegram== *'0'* ]]; then

printf "\e[1;93mNot Found!\e[0m\n"

fi

fi
partial
}
banner
scanner

