#!/bin/bash -e
echo "=== ENTRY ==="

[[ -z "$WORKSPACE_DIR" ]] && { echo "=== WORKSPACE_DIR is empty. Exit." ; exit 1; }
[[ -z "$TARGET_ENV" ]] && { echo "=== TARGET_ENV is empty. Exit." ; exit 1; }


mkdir -p ${WORKSPACE_DIR}

# Optional: Print debug info
echo "= Starting container with command: $@"
echo "= Variables:"
echo "=  - WORKSPACE_DIR : ${WORKSPACE_DIR}"
echo "=  - TARGET_ENV    : ${TARGET_ENV}"

echo "=== START VSCODE ==="

nohup code-server ${WORKSPACE_DIR} >/root/code-server.log

echo "=== BEGIN ==="

# If you want to run a default command when none is passed
if [ $# -eq 0 ]; then
  echo "No command provided. Running default..."
  exec bash -c "echo Running default task in ${TARGET_ENV}"
else
  # Run whatever command was passed to the container
  exec bash -c "$@"
fi
