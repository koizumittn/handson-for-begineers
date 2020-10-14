# はじめてのKubernetes 入門ハンズオン
## 概要
Kubernetesの基本的な操作方法を体感するためのハンズオンです。  
Kubernetesにアプリケーションをデプロイする基本的な手順を理解することが目標です。

# 環境
GCP(Google Cloud Platform)を使用します。
[こちら](https://www.apps-gcp.com/gcp-startup/)の手順を参考にGCPプロジェクトを作成してください。

※GCPの無料トライアルをご利用いただかない場合、GKEクラスタの使用料金が発生します。予めご了承いただいた上でハンズオンを進めてください。

それではステップ1から順番に進めていきましょう！  の

## 目次
|ステップ|タイトル|Cloud Shellで起動|手順|
| --- | --- | --- | --- |
| 1 | GKEクラスタの作成 | [![GKEクラスタの作成](https://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/home/dashboard?cloudshell=true&cloudshell_git_repo=https://github.com/koizumittn/handson-for-begineers&cloudshell_tutorial=k8s/create-gke-cluster.md) | [こちら](https://github.com/koizumittn/handson-for-begineers/blob/master/k8s/create-gke-cluster.md) |
| 2 | DockerコンテナのビルドとGKEクラスタへのPodのデプロイ | [![GKEクラスタの作成](https://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/home/dashboard?cloudshell=true&cloudshell_git_repo=https://github.com/koizumittn/handson-for-begineers&cloudshell_tutorial=k8s/hello-app.md) | [こちら](https://github.com/koizumittn/handson-for-begineers/blob/master/k8s/hello-app.md) |

## FAQ
Q. Cloud Shellとは何ですか？

A. [Cloud Shell](https://cloud.google.com/shell?hl=ja) は、GCPで提供されるUbuntuベースの仮想マシンです。無料で提供され、git、gcloud、kubectlなどの開発用ツールがプリセットされている他、コードエディタ、永続ディスク ストレージ、およびウェブ プレビュー機能が組み込まれており、GCPでの開発タスクを簡単に始めることができます。

Q. このページの「OPEN IN GOOGLE CLOUD SHELL」をクリックすると「この git リポジトリは Google によって正式に管理されておらず、デフォルトでは信頼されません。」と表示されますが、どうすれば良いですか？

A. 「信頼する」にチェックし、「確認」ボタンをクリックしてください。

![リポジトリの信頼](https://user-images.githubusercontent.com/22129880/95879023-dc845f80-0db0-11eb-93b7-1632d91952b6.png)

Q. 手順を進めると「Cloud Shellの承認」と表示されたのですが、どうすれば良いですか？

A. 「承認」ボタンをクリックし、後続の手順に進んでください。

![API呼び出しの承認](https://user-images.githubusercontent.com/22129880/95879400-47ce3180-0db1-11eb-9661-b2c916116ca5.png)

Q. このページの「OPEN IN GOOGLE CLOUD SHELL」をクリックすると「You have already cloned this repo into directory〜」と表示されますが、どうすれば良いですか？

A. 初回起動時にこのGitリポジトリがCloud Shellにクローンされるため、2回目以降は既に存在している状態になります。デフォルトの「1」を入力し、新たにGitリポジトリをクローンせずディレクトリの移動のみ行います。

![You have already cloned this repo into directory](https://user-images.githubusercontent.com/22129880/96035891-a0c7c380-0e9e-11eb-96ab-84f8f3023f7e.png)