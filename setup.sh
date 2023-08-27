#!/bin/bash


function die() {
    echo "${@}"
    exit 1
}

function clone_repo() {
    git clone --recursive https://github.com/fernandoflorez/v.git \
        "${HOME}/.vim" || die "Could not clone repo"
}

function install() {
    if [ ! -e "${HOME}/.vim" ]; then
        clone_repo
    fi
}

install
