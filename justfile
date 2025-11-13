SSH_HOST := "ncs-01"
REMOTE_WORKSPACE := "/home/albert.le/ncs/docker.python-manager/"

@help:
    just --list

@build:
    docker compose build

@up:
    docker compose up

# Run the workspace container
@run:
    docker compose run --rm -it python-workspace

@run-remote:
    ssh -tt {{SSH_HOST}} "cd {{REMOTE_WORKSPACE}} && git pull && just run"

# Run data generator
@run-java-synthea:
    docker compose run --rm -it java-synthea

@push:
    git add .
    git commit -m "update: $(date)"
    git push
