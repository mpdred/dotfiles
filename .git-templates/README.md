# Create a symbolic link
```shell
ln -sv $(pwd) ~/$(basename `pwd`)
```
> '/home/user/.git-templates' -> '/home/user/src/github.com/mpdred/dotfiles/.git-templates'




# Global .gitignore
Ignore files in all the git repositories:
```shell
git config --global core.excludesFile '~/.git-templates/.gitignore'
```
See [`core.excludesFile` @ git docs](https://github.com/git/git/blob/6675f501f6b987dbdb0dbeb1d2efeb5a27fc41a7/Documentation/config.txt#L595-L602)




# Global hooks
Enable git hooks for existing and future git repositories:
```shell
git config --global core.hooksPath "~/.git-templates/hooks"
```

See [`core.hooksPath` @ git docs](https://github.com/git/git/blob/6675f501f6b987dbdb0dbeb1d2efeb5a27fc41a7/Documentation/config.txt#L621-L636)




# Autocorrect
```shell
git config --global help.autocorrect -1
```

> $ git saatus
> WARNING: You called a Git command named 'saatus', which does not exist.
> Continuing under the assumption that you meant 'status'.

See [`help.autoCorrect` @ git docs](https://github.com/git/git/blob/6675f501f6b987dbdb0dbeb1d2efeb5a27fc41a7/Documentation/config.txt#L1623-L1630)
