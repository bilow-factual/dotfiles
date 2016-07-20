cp -r vim ~/.vim

cat bash_profile >> ~/.bash_profile
cp git-prompt.sh ~/.git-prompt.sh

ln -s ~/.vim/vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

