help:
    just --list

build:
    docker compose build

up:
    docker compose up

run:
    docker compose run --rm -it python-manager
