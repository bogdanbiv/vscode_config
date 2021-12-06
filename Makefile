# main launch point
.PHONY: code
code:
	x11docker localhost/ubuntu-example:latest --home=/tmp/vscode --homedir=/tmp/vscode2 --share=/tmp/vscode2:rw --user=RETAIN -- \
		code --verbose --no-sandbox --user-data-dir=/home/appuser/.vscode
