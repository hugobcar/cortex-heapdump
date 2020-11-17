#!/bin/bash

# kubectl -n cortex port-forward pod/cortex-ingester-1 8080:8080

while true; do
	curl http://127.0.0.1:8080/debug/pprof/heap > /lixo/heap/heap-`date +%s`.pprof

	kubectl -n cortex get pods | grep -w 'cortex-ingester-1' | grep -v Running

	if [ $? -ne 1 ]; then
		echo "Ingester 1 is not running. Existing..."

		exit 0
	fi
done
