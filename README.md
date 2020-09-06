dotfiles
========

homesick dotfiles

Get Started from clean-installed macosx
=======

```bash
brew install rbenv ruby-build
eval "$(rbenv init -)"
rbenv install 2.5.5
rbenv use 2.5.5
gem install homesick
homesick init
homesick clone http://github.com/iwag/dotfiles
homesick link
```
