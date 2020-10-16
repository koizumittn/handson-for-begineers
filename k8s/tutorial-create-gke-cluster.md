# GKEクラスタの作成

## さあ始めましょう。

このガイドではGKEを使用してコンテナアプリケーションをデプロイするためのKubernetesクラスタを作成します。

**目次**

1. デフォルトプロジェクトの設定
2. ゾーンの設定
3. APIの有効化
4. GKEクラスタの作成
5. Credential の取得

**所要時間**: 約 15 分

**[開始]** ボタンをクリックして次のステップに進みます。

## デフォルトプロジェクトの設定
### プロジェクトIDの確認

すべてのプロジェクトとそのID番号を表示するために、次のコマンドを実行します。

```bash
gcloud projects list
```

### デフォルトプロジェクトの設定

今回使用するGCPプロジェクトを Cloud Shell のデフォルトプロジェクトに設定するために、次のコマンドを実行します。

「YOUR-PROJECT-ID」は前のステップで確認したプロジェクトID(例：k8s-handson-123456)に置き換えます。

```bash
gcloud config set project <YOUR-PROJECT-ID>
```  

利用するプロジェクトを環境変数として export し、後続のステップで使用できるようにします。

```bash
export PROJECT_ID=$(gcloud config get-value project); echo $PROJECT_ID
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## ゾーンの設定

GKEクラスタを起動するゾーンを Cloud Shell のデフォルトゾーンに設定します。

```bash
gcloud config set compute/zone asia-northeast1-b
```

利用するゾーンを環境変数として export し、後続のステップで使用できるようにします。

```bash
export ZONE=$(gcloud config get-value compute/zone); echo $ZONE
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## APIの有効化

GKE クラスタの作成に必要となる API を次のコマンドで有効化します。
このコマンドは1~3分ほどかかることがあります。


```bash
gcloud services enable cloudapis.googleapis.com container.googleapis.com
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## GKEクラスタの作成

「k8s-handson」という名前のGKEクラスタを作成するため、次のコマンドを実行します。
これには3~7分ほどかかることがあります。

```bash
gcloud container clusters create k8s-handson --zone $ZONE
```

作成したGKEクラスタを表示するため、次のコマンドを実行します。
GKEクラスタ「k8s-handson」のステータスが **RUNNING** になっていることを確認します

```bash
gcloud container clusters list
```
  
(任意)Cloud Consoleで確認する場合は以下のリンクをクリックします。

[Display on the Console](https://console.cloud.google.com/kubernetes/list)

**[次へ]** ボタンをクリックして次のステップに進みます。

## Credential の取得

kubectlコマンドでGKEクラスタ「k8s-handson」に接続できるようにするため、
次のコマンドを実行してCredentialを取得します

```bash
gcloud container clusters get-credentials k8s-handson --zone $ZONE --project $PROJECT_ID
```

kubectlがGKEクラスタ「k8s-handson」に接続できるかを確認するために、
クラスタのノード情報を取得するための次のコマンドを実行します。

```bash
kubectl get nodes
```

3台のワーカーノードの情報が表示されます。

**[次へ]** ボタンをクリックして次のステップに進みます。

## これで終わりです。

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

GKEクラスタの作成が完了しました。

これで、コンテナ化されたアプリケーションをGKEクラスタ上にデプロイできます。

次のハンズオン「DockerコンテナのビルドとGKEクラスタへのPodのデプロイ」に進む場合は次のコマンドを実行します。

```bash
cloudshell launch-tutorial -d k8s/tutorial-create-pod.md
```

ハンズオンの一覧は以下のサイトに記載されています。

[はじめてのKubernetes 入門ハンズオン
](https://github.com/koizumittn/handson-for-begineers/tree/master/k8s)

**作業後は忘れずにクリーンアップする**: ハンズオンを終了する場合は、不要な料金の発生を避けるためにプロジェクトを削除してください。「gcloud projects delete $PROJECT_ID」を使用します。