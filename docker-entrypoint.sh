#!/usr/bin/env bash

if [ $1 == "thumbor" ]; then
	thumbor-config >/etc/thumbor.conf
	egrep '^#[A-Z_]+ = .*' /etc/thumbor.conf | sed 's/^#\([A-Z_]*\).*$/\1/' \
		| while read x; do
			if [ "${!x+set}" = set ]; then
				sed -i "s/#${x}.*/${x} = ${!x}/g" /etc/thumbor.conf
			fi
		done
fi

exec "$@"
