# langdock

langdock is a languages's version manager, powered with
[Docker](https://github.com/docker), using principally the
[Dockerhub](https://hub.docker.com/)

langdock is inspired in [rbenv](https://github.com/rbenv/rbenv),
[goenv](https://github.com/syndbg/goenv) and [pyenv](https://github.com/pyenv/pyenv)

## Contents

* [Install](#install)
  * [Local](#local)
* [Use](#use)
* [Add repositories](#add-repositories)
* [Environment variables](#environment-variables)
* [Install a new language version](#install-language-version)
  * [Manually](#manually)
  * [Using .<language>-version file](#using-language-version-file)

## Install

### Local

1. Clone langdock into ~/.langdock
```bash
$ git clone git@github.com:lucasdc6/langdock.git ~/.langdock
```

2. Add the envoiroment variable LANGDOCKPATH and the directory $LANGDOCKPATH/bin to `$PATH`
```bash
$ echo 'export LANGDOCKPATH=$HOME/.langdock' >> ~/.bash_profile
$ echo 'export PATH="$HOME/.langdock/bin:$PATH"' >> ~/.bash_profile
```

3. Add the eval sentence to the bashrc
```bash
$ echo 'eval "$(langdock init -)' >> ~/.bash_profile
```
*Ubuntu desktop note:* Modify your `~/.bashrc` instead of `~/.bash_profile`

*Zsh note:* Modify ~/.zshrc

4. Restart your shell so that PATH changes take effect.


## Use

Availables scripts commands:
  * Set a global language version (shell restart is needed)
  * Set a local language version (shell restart isn't needed)
  * Install docker language images
  * List installed versions
  * List availables versions on docker repositories

Manage availables repositories:
  * List repositories
  * Add repository
  * Delete repository

The availables repositories is stored in a file in `etc` directory

Repositories file use complete docker repositories name.

## Add repositories

Add a repository
```bash
  $ langdock repositories --add <COMPLETE_REPOSITORY_NAME>
```

Eg:
Add the oficial php repository (added by default)

```bash
  $ langdock repositories --add php
```

## Environment variables

The script *doesn't* install binaries!
The script pull docker images and reference those images via files and 
envoiroment varialbes, used by the `commands` (see 'commands' directory)

Variable | Description
---------|------------
`LANGDOCK_DEBUG` | Enable debug mode
`LANGDOCKPATH` | Root path to repository

## Version files

### Global version

- File modified by the command `<langdock> global <version>`
- Stored at `$LANGDOCKPATH/etc/<language-name>/version`
- Low precedence

### Local version
- File modified by the command `<langdock> local <version>`
- Stored in the command's context execution (`.<language-name>-version`)
- Medium precedence

### Shell version (Comming soon!)
- Via envoiroment variables modified by the command `<langdock> shell <version>`
- High precedence

## Install language version

### Manual

Add a new language version:

1. Firts, search the *complete* docker image name (repository+tag)

   Show all availables docker images in known repositories:

   ```bash
    <langdock> install --list
    # docker image's list
    ```
2. Once identified the docker image, send it as argument to `<langdock> install`
   Eg, we need the php 7.2.0 from oficial repository

   ```bash
    langdock install php:7.2.0-cli
   ```

### Using .language-version file

If you know the php version needed for the project, you can create a file named
`.<language>-version` and put the version (only the number).

This make easiest to export the project.

Once created the file, run the follow:
   ```bash
    <langdock> install
   ```
This show you a selectable menu with all docker images that match the version
specified
