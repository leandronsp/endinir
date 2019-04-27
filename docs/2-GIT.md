# What is Git?
Git is a tool which allows developers to share files on distributed machines. 

Useful links:

- [Understanding Git](https://hackernoon.com/understanding-git-fcffd87c15a3)
- [Getting started with Git basics](https://git-scm.com/book/en/v1/Getting-Started-Git-Basics)

# Installing Git

### Linux/Ubuntu
```
apt-get install git-core
```
Confirm the installation
```
git --version
```
Configure your Git settings:
```
git config --global user.name "testuser"
git config --global user.email "testuser@example.com"


```
Check the Git settings and make sure it's using your user name and email:
```
cat ~/.gitconfig
```

# Connecting to Github
[Github](http://github.com) is a website which you can store your development files and projects using `git`. 

Steps to connect to Github:

1. Create a Github account
2. Configure/Update your local Git settings:
```
git config --global user.name "your-github-username"
git config --global user.email "your-email-used-on-github"
```
Check the Git settings and make sure it's using your Github username/email:
```
cat ~/.gitconfig
```
3. Follow the steps at [Connecting to Github using SSH](https://help.github.com/en/articles/connecting-to-github-with-ssh)
