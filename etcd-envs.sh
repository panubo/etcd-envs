#!/usr/bin/env bash

# No error handling so exit if anything fails
set -e

# Set output file
OUTFILE="${2-/output/environment}"

# Truncate output file
echo -n > "${OUTFILE}"

# List directory, filter subdirectories and loop
etcdctl ls -p "${1}" | grep -v "/$" | while read line; do
	key="$(basename "${line}")"
	value="$(etcdctl get "${line}")"
	echo "${key}=${value}" | tee -a "${OUTFILE}"
done
