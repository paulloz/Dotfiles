#!/bin/bash

BASEDIR="$(cd "$(dirname "$BASH_SOURCE")"; pwd -P)"

function commandExist {
    if [[ -n "$(command -v $1)" ]]
    then
        return 0
    fi
    return 1
}

function exitIfCommandDoesNotExist {
    if !(commandExist $1);
    then
        >&2 echo "Error: command not found: $1"
        exit 1
    fi
}

exitIfCommandDoesNotExist "wget"
exitIfCommandDoesNotExist "git"

# Configure git
echo "Configure git..."
echo "    Link .gitconfig"
ln -f -s "$BASEDIR/git/.gitconfig" "$HOME"
echo "    Link .gitignore_global"
ln -f -s "$BASEDIR/git/.gitignore_global" "$HOME"
if !(commandExist "diff-so-fancy");
then
    echo "    Downloade diff-so-fancy"
    mkdir -p "$HOME/.local/bin/"
    wget -P "$HOME/.local/bin/" "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy" &> /dev/null
    chmod +x "$HOME/.local/bin/diff-so-fancy"
fi
echo ""

# Configure htop
if [[ -d "$HOME/.config/htop" ]];
then
    echo "Configure htop..."
    echo "    Link htoprc"
    ln -f -s "$BASEDIR/htop/htoprc" "$HOME/.config/htop/htoprc"
    echo ""
fi

# Configure vim
echo "Configure vim..."
echo "    Link .vimrc"
ln -f -s "$BASEDIR/vim/.vimrc" "$HOME"
echo "    Install theme"
if [[ !(-d "$HOME/.vim/pack/themes/opt/solarized8") ]];
then
    mkdir -p "$HOME/.vim/pack/themes/opt/"
    git clone git@github.com:lifepillar/vim-solarized8.git "$HOME/.vim/pack/themes/opt/"
fi
echo "    Configure nvim"
mkdir -p "$HOME/.config/nvim/"
ln -f -s "$BASEDIR/vim/init.vim" "$HOME/.config/nvim/"
echo ""

# Configure zsh
echo "Configure zsh..."
if ! [[ -d "$HOME/.oh-my-zsh" ]];
then
    echo "    Install oh-my-zsh"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi
echo "    Link .zshrc"
ln -f -s "$BASEDIR/zsh/.zshrc" "$HOME"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if ! [[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]];
then
    echo "    Download zsh-autosuggestions"
    git clone "https://github.com/zsh-users/zsh-autosuggestions" "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi
if ! [[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]];
then
    echo "    Download zsh-syntax-highlighting"
    git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi
echo ""

echo "Done."
while true;
do
    read -p "Start zsh? " yn
    case $yn in
        [Yy]* ) exec zsh;;
        [Nn]* ) exit 0;;
    esac
done
