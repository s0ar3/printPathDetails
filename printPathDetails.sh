#!/usr/bin/bash

IFS=":"

main() {
    for directory in ${PATH}; do
        [[ -z "${directory}" ]] && { directory="."; }
        
        if [[ ! -e "${directory}" ]]; then
            printf "\e[1m%s\e[0m\n \e[31m%s\e[0m\n\n" "${directory}" "doesn't exists"
        elif [[ ! -d "${directory}" ]]; then
            printf "\e[1m%s\e[0m\n \e[32m%s\e[0m\n\n" "${directory}" "not a directory"
        else
            printf "\e[1m%s\e[0m\n" "${directory}"
            printf "%s\n\n" "$(ls -ld "${directory}")"
        fi
    done
}

printf "\n\e[1;33m%37s\e[0m\n" "PATH Components Attributes"
printf "%50s\n\n" " " | tr ' ' '='
main
printf "%50s\n" " " | tr ' ' '='