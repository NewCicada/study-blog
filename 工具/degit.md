# degit -- 简单的项目脚手架

* degit 会对 git 仓库进行复制。当你运行 degit something-user/some-repo 时，它会在 https://github.com/some-user/some-repo 上找到最新的提交，并下载相关的 tar 文件到～/.degit/some-user/some-repo/commithash.tar.gz。(这比使用 git clone 要快得多，因为你不会下载整个 git 历史记录）

需要 Node 8 或以上版本。

## 安装
```shell
npm install -g degit
```

# 用法
## 基本

* degit 最简单的用法是从 GitHub 下载一个 repo 的 master 分支到当前工作目录：
```shell
degit user/repo

# these commands are equivalent
degit github:user/repo
degit git@github.com:user/repo
degit https://github.com/user/repo
```
* 或者你可以从 GitLab 和 BitBucket 下载：
```shell
# download from GitLab
degit gitlab:user/repo
degit git@gitlab.com:user/repo
degit https://gitlab.com/user/repo

# download from BitBucket
degit bitbucket:user/repo
degit git@bitbucket.org:user/repo
degit https://bitbucket.org/user/repo

# download from Sourcehut
degit git.sr.ht/user/repo
degit git@git.sr.ht:user/repo
degit https://git.sr.ht/user/repo
```
## 指定标签、分支或提交
* 默认分支是 master.
```shell
degit user/repo#dev       # branch
degit user/repo#v1.2.3    # release tag
degit user/repo#1234abcd  # commit hash
```