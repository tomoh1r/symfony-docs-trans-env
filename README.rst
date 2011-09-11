==================================
Symfony2日本語翻訳作業用リポジトリ
==================================

Symfony2のドキュメントを翻訳するための、英語・日本語のソースリポジトリの取得と、sphinxでの出力確認用の設定ファイルを入れてあります。::

   $ git clone git://github.com/jptomo/SymfonyDocsTransEnv.git symfony-docs
   $ cd symfony-docs
   $ make setting

上記のコマンドでリポジトリを取得して、サブモジュールになっている英語ソースと日本語リポジトリを取得してきます。ビルドするには、 `make html` を実行してください。::

   make html

