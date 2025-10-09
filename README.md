# NCS Workspace Containers

## Overview

The workspace containers allow user to start a development workspace on a remote Docker Server.

## SSH Agent Forwarding

`[Your workstation] -- forward ssh agent --> [Docker Server] -- mount agent socket --> [Docker Container]`

### Start SSH Agent on your workstation

- Bash shell: `eval (ssh-agent -s)`
- Fish shell: `eval (ssh-agent -c)`

More info: `man ssh-agent`

For fish shell, to permanently start ssh-agent upon shell startup:

```
# ~/.config/fish/config.fish

# Start ssh-agent if not already running
if not set -q SSH_AUTH_SOCK
    # Start the agent process
    eval (ssh-agent -c)

    # Add your ssh keys
    ssh-add ~/.ssh/id_ed25519 ^/dev/null
end
```

### Alias github server name

We may want to setup an alias for the github account, in case the user have multiple github accounts.

Edit `~/.ssh/config`:

```
Host gh_abx
    HostName github.com
    User git
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_rsa  # or any other key file that you use. E.g. `~/.ssh/id_ed25519`
```

### How to test SSH connection to github

`ssh -T git@github.com` or `ssh -T gh_abx`

### Forward SSH Agent to the remote Docker Server

Run: `ssh -A user@remote-host`

To permanently enable agent-forwarding, edit your local ~/.ssh/config:

```ssh
Host myserver
  HostName 203.0.113.42
  User david
  ForwardAgent yes
```

To test if the keys is forwarded correctly, run: `ssh-add -l`

## Mount SSH Agent socket into the Docker Container
Make sure the following lines added to the docker-compose.yml

```yaml
    environment:
      - SSH_AUTH_SOCK=/ssh-agent
    volumes:
      - $SSH_AUTH_SOCK:/ssh-agent
```
