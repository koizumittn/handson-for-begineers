# GKEクラスタの作成

## さあ始めましょう。

このガイドではGKEを使用してコンテナアプリケーションをデプロイするためのKubernetesクラスタを作成します。

**目次**

1. デフォルトプロジェクトの設定
2. ゾーンの設定
3. APIの有効化
4. GKEクラスタの作成
5. Credential の取得

**所要時間**: 約 10 分

**[続行]** ボタンをクリックして次のステップに進みます。

## デフォルトプロジェクトの設定
### プロジェクトIDの確認

すべてのプロジェクトとそのID番号を表示するために、次のコマンドを実行します。

```bash
gcloud projects list
```

### デフォルトプロジェクトの設定

今回使用するGCPプロジェクトを Cloud Shell のデフォルトプロジェクトに設定するために、次のコマンドを実行します。
<YOUR-PROJECT-ID>は前のステップで確認したプロジェクトIDに置き換えます。

```bash
gcloud config set project <YOUR-PROJECT-ID>
```  

利用するプロジェクトを環境変数として export し、後続のステップで使用できるようにします。

```bash
export PROJECT_ID=$(gcloud config get-value project); echo $PROJECT_ID
```

## ゾーンの設定

今回はチュートリアルのためシングルゾーンクラスタを作成します。
今回使用するゾーンを Cloud Shell のデフォルトゾーンに設定します。

```bash
gcloud config set compute/zone asia-northeast1-b
```

利用するゾーンを環境変数として export し、後続のステップで使用できるようにします。

```bash
export ZONE=$(gcloud config get-value compute/zone); echo $ZONE
```

## APIの有効化

GKE クラスタの作成に必要となる API を次のコマンドで有効化します。
このコマンドは1~3分ほどかかることがあります。


```bash
gcloud services enable cloudapis.googleapis.com container.googleapis.com
```

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
  
コンソールで確認する場合は以下をクリックします。

[Display on the Console](https://console.cloud.google.com/kubernetes/list?cloudshell=true)

## Credential の取得

kubectlコマンドでGKEクラスタ「k8s-handson」に接続できるようにするため、
次のコマンドを実行してCredentialを取得します

```bash
gcloud container clusters get-credentials k8s-handson --zone $ZONE --project $PROJECT_ID
```

kubectlがGKEクラスタ「k8s-handson」に接続できるかを確認するために、
クラスタのノードを取得するための次のコマンドを実行します。

```bash
kubectl get nodes
```

## これで終わりです。

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

GKEクラスタの作成が完了しました。

これで、コンテナ化されたアプリケーションをGKEクラスタ上にデプロイできます。

次のハンズオン「コンテナ化されたウェブアプリケーションのデプロイ」に進む場合は次のコマンドを実行します。

```bash
cloudshell launch-tutorial -d k8s/hello-app.md
```

ハンズオンの一覧は以下のサイトに記載されています。

[はじめてのKubernetes 入門ハンズオン
](https://github.com/koizumittn/handson-for-begineers/tree/master/k8s)

**作業後は忘れずにクリーンアップする**: ハンズオンを終了する場合は、不要な料金の発生を避けるためにプロジェクトを削除してください。「gcloud projects delete <PROJECT-ID>」を使用します。