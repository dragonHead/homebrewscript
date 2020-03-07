#!/bin/zsh

HOME_DIR=$(cd $(dirname $0) && pwd)
FILE_NAME=$(basename $0 .sh)

LOG_DIR=${HOME_DIR}/log
LOG_FILE=${LOG_DIR}/${FILE_NAME}_`date +%Y%m%d%H%M%S`.log
exec > >(tee ${LOG_FILE}) 2>&1

echo "Create log directory..."
mkdir -p ${LOG_DIR}

export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

echo export NVM_DIR=\"'${HOME}'/.nvm\" >> $HOME/.zshrc
echo "[ -s \${NVM_DIR}/nvm.sh ] && \. \${NVM_DIR}/nvm.sh" >> $HOME/.zshrc

exit;