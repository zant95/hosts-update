#!/bin/sh

# Author:     Héctor Molinero Fernández <hector@molinero.xyz>
# Repository: https://github.com/hectorm/hblock
# License:    MIT, https://opensource.org/licenses/MIT

set -eu
export LC_ALL=C

main() {
	hblock="./hblock"
	hosts="${1:?}"

	$hblock -qO- \
		--sources "file://$hosts" \
		--header '' \
		--footer '' \
		--template 'address=\/\1\/\2' \
		--comment '#'
}

main "$@"
