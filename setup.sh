#!/bin/bash


function die() {
    echo "${@}"
    exit 1
}

function clone_repo() {
    git clone --recursive https://github.com/fernandoflorez/v.git \
        "${HOME}/.v" || die "Could not clone repo"
}

function link_files() {
    ln -s "${HOME}/.v/vimrc" "${HOME}/.vimrc" || die "Could not create links"
}

function install() {
    if [ ! -e "${HOME}/.v" ]; then
        clone_repo
    fi
    link_files
}

install
