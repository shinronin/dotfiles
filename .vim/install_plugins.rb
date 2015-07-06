#!/usr/bin/env ruby

github_base_url = 'git@github.com:'
cmd = 'git clone '
bundle_dir = "/Users/#{ENV['USER']}/.vim/bundle"

repos = %w{
  afshinm/npm.vim
  ekalinin/Dockerfile.vim
  slim-template/vim-slim
  jistr/vim-nerdtree-tabs
  editorconfig/editorconfig-vim
  digitaltoad/vim-jade
  majutsushi/tagbar
  rodjek/vim-puppet
  thejchap/vim-go
  mileszs/ack.vim
  peterhoeg/vim-qml
  kien/ctrlp.vim
  scrooloose/nerdcommenter
  scrooloose/nerdtree
  ervandew/supertab
  tomtom/tlib_vim
  MarcWeber/vim-addon-mw-utils
  mustache/vim-mustache-handlebars
  garbas/vim-snipmate
  bling/vim-airline
  tpope/vim-bundler
  tpope/vim-fugitive
  groenewege/vim-less
  tpope/vim-rails
  derekwyatt/vim-scala
  tpope/vim-sensible
  honza/vim-snippets
  tpope/vim-surround
  bronson/vim-trailing-whitespace
  kchmck/vim-coffee-script
  b4winckler/vim-objc
}

Dir.mkdir(bundle_dir) unless Dir.exists?(bundle_dir)
Dir.chdir(bundle_dir)

filtered_repos = repos.reject { |repo| Dir.exists?(repo.split('/')[1]) }

long_command = filtered_repos.each_with_index.inject('') do |string, (repo, i)|
  is_end = i == filtered_repos.length - 1
  string + cmd + github_base_url + repo + (!is_end ? ' && ' : '')
end

exec long_command if !long_command.empty?
