==================================
Symfony2日本語翻訳作業用リポジトリ
==================================

Symfony2のドキュメントを翻訳するための、英語・日本語のソースリポジトリの取得と、sphinxでの出力確認用の設定ファイルを入れてあります。::

   $ git clone git@github.com:jptomo/SymfonyDosTransEnv.git symfony-docs
   $ cd symfony-docs
   $ git submodule update --init --recursive
   $ cp conf.py source-en
   $ cp conf.py source-ja
   $ mkdir -p source-en/_exts
   $ mkdir -p source-ja/_exts
   $ cp sphinx-php/configurationblock.py source-en/_exts
   $ cp sphinx-php/configurationblock.py source-ja/_exts
   $ cp -r _static source-en
   $ cp -r _static source-ja

上記のコマンドでリポジトリを取得して、サブモジュールになっている英語ソースと日本語リポジトリを取得してきます。ビルドするには、 `make html` を実行してください。::

   make html

