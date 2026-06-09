#!/bin/bash -eu

source lib/utils.sh

prep_files () {
	# Create empty directory for part 1 and mv part 2 contents
	# from the data repo
	local BASEPATH=$1
	local SCRIPT_DIR REPO_ROOT SOURCE_PART2

	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
	SOURCE_PART2="${REPO_ROOT}/docs/workshop/part2/materials"

	if [[ ! -d "${SOURCE_PART2}" ]]; then
		log "No workshop files to copy. Expected to find ${SOURCE_PART2}."
		exit 1
	fi

	if [[ -d "${BASEPATH}/part1" && -d "${BASEPATH}/part2" ]]; then
		log "Files already exist - skipping."
		return
	fi

	mkdir -p "${BASEPATH}/part1"
	cp -rv "${SOURCE_PART2}/." "${BASEPATH}/part2"

	log "Workshop files ready to go!"
}
