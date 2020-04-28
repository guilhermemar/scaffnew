# scaffnew
A simple scaffold for many purposes

> Discontinued, sorry :-/

## Comandos

### repository

#### scaff repository
__Alias:__ scaff repo

Alias for scaffn repository list

#### scaff repository list
__Alias:__ scaff repo list

List all repositories

#### scaff repository add <url> [name]
__Alias:__ scaff repo add <url> [name]

Add a new repository

* __url__ : The url of repository file
* __name__ (optional) : A optional intenal name for this repository. Used de name of repository file if not informed

#### scaff repository remove <name>
__Alias:__ scaff repo remove <name>

Remove a repository

* __name__ : The repository name to be deleted

#### scaff repository packages <repository>
__Alias:__ scaff repo packages <repository>

List a packages of the repository or all repositories.

* __repository__ (optional) : Repository name to show packages, if suppressed, show packages for all repositories


### new

#### scaff new

Create scaffold from a package

* __repository__ : The package repository name
* __package__ : The package name
