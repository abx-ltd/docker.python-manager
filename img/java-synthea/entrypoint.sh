#!/bin/bash -e

echo "=== ENTRY ==="

[[ -z "$WORKSPACE_DIR" ]] && { echo "=== WORKSPACE_DIR is empty. Exit." ; exit 1; }
[[ -z "$DATASET_DIR" ]] && { echo "=== DATASET_DIR is empty. Exit." ; exit 1; }
[[ -z "$DATASET_NAME" ]] && { echo "=== DATASET_NAME is empty. Exit." ; exit 1; }


OUT_DIR="${DATASET_DIR}/${DATASET_NAME}"
RUN_CMD="java -jar /app/synthea/synthea-with-dependencies.jar\
 -c /app/synthea/synthea.properties\
 --exporter.baseDirectory ${OUT_DIR}\
 $@"

mkdir -p ${WORKSPACE_DIR} ${DATASET_DIR}

echo "= Running Synthea Generator for [${POPULATION_SIZE}] items..."
echo "= Variables:"
echo "=     - OUTPUT_DIR : ${OUT_DIR}"
echo "= Run Command:"
echo "=     ${RUN_CMD}"
echo "=== BEGIN ==="

${RUN_CMD}
