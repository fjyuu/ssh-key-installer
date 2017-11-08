set -eu

if [ $# -ne 1 ]; then
    echo "Error: required URL for public key"
    echo "Usage: $0 [URL]"
    exit 1
fi

if type curl > /dev/null 2>&1; then
    GETTER="curl -L"
elif type wget > /dev/null 2>&1; then
    GETTER="wget -O -"
else
    echo "Error: required `curl` or `wget` command"
    exit 1
fi

mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh
$GETTER $1 >> $HOME/.ssh/authorized_keys
chmod 600 $HOME/.ssh/authorized_keys
