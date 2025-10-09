help:
    just --list

@build:
    docker compose build

@up:
    docker compose up

@run-python-workspace:
    docker compose run --rm -it python-workspace

@run-java-synthea:
    docker compose run --rm -it java-synthea

@push:
    git add .
    git commit -m "update: $(date)"
    git push
