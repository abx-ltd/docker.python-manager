help:
    just --list

@build:
    docker compose build

@up:
    docker compose up

# Run the workspace container
@run:
    docker compose run --rm -it python-workspace

# Run data generator
@run-java-synthea:
    docker compose run --rm -it java-synthea

@push:
    git add .
    git commit -m "update: $(date)"
    git push
