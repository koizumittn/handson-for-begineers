# Deploymentの作成とアプリケーションの更新

## さあ始めましょう。

このガイドではhello-appイメージを用いてGKEクラスタにDeploymentをデプロイし、インターネットに公開します。  
またソースコードを変更し、hello-appの新しいバージョンをデプロイします。

**目次**
1. 環境変数の設定
2. Deploymentを作成する
3. Deploymentによって作成されたオブジェクトを確認する
4. Podのスケール
5. Deploymentをインターネットに公開する
6. 公開されたhello-appへのアクセス
7. アプリケーションの更新
8. Deploymentの更新
9. 作成したリソースの削除

**所要時間**: 約 15 分

**前提条件**  
GKEクラスタ「k8s-handson」を作成済みであること  
hello-appのDockerイメージをビルド済みであること  

※作成済みでない場合は[こちらのページ](https://github.com/koizumittn/handson-for-begineers/tree/master/k8s)のステップ1〜2を実施してください。

**本チュートリアルについて**  
GKEチュートリアル「[コンテナ化されたウェブ アプリケーションのデプロイ
](https://cloud.google.com/kubernetes-engine/docs/tutorials/hello-app)」をベースとしています。

**Deploymentについて**  
Deploymentは複数の同じPodの集合です。  
ReplicaSetオブジェクトを管理することで複数のPodを実行し、エラーが発生したPodは自動的に置き換えます。

内部にPodの仕様を含むPodテンプレートを使用します。  
Podテンプレートが更新されると、自動的に新しいPodで置き換えます。

**[開始]** ボタンをクリックして次のステップに進みます。

## 環境変数の設定

※前のチュートリアルで設定済みの場合はスキップいただいて構いません。

PROJECT_ID 環境変数に Google Cloud プロジェクト IDを設定します。PROJECT_ID 変数は、コンテナ イメージをプロジェクトの Container Registry に関連付けるために使用されます。

```bash
export PROJECT_ID=$(gcloud config get-value project); echo $PROJECT_ID
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## Deploymentを作成する

次のコマンドを実行して、hello-appのDockerイメージを使用して、GKEクラスタにDeploymentをデプロイします。

```bash
kubectl create deployment hello-app --image=gcr.io/${PROJECT_ID}/hello-app:v1
```

作成した Deployment を表示するには、次のコマンドを実行します。

```bash
kubectl get deployments
```

**READY**列が「1/1」と表示されればOKです。  
「0/1」のまま変わらない場合、エラーが発生している可能性があります。  

**[次へ]** ボタンをクリックして次のステップに進みます。

## Deploymentによって作成されたオブジェクトを確認する

### Replicaset
Replicasetは同じ種類のPodの数を一定に保ちます。  
DeploymentはPodテンプレートに記載された仕様に基づいてReplicaSetオブジェクトを作成します。

次のコマンドを実行して、Deploymentによって作成されたReplicaSetオブジェクトを表示します。

```bash
kubectl get replicasets
```

**DESIRED**列は所望のPod数、**CURRENT**列は現在起動しているPod数です。
ここまでの手順を実施するとどちらも1になります。

### Pod

次のコマンドを実行して、Podを表示します。  

```bash
kubectl get pods
```

表示されたPodはReplicaSetにより作成されたものです。  
このようにDeploymentはReplicaSetを経由してPodを作成します。  

### すべてのオブジェクトを表示

次のコマンドを実行すると、すべてのオブジェクトを表示できます。

```bash
kubectl get all
```

Deployment、ReplicaSet、Podオブジェクトがそれぞれ作成されていることを確認します。

**補足**  
service/kubernetesはデフォルトで作成されているServiceオブジェクトです。  
ここでは気にせず進めて構いません。  

**[次へ]** ボタンをクリックして次のステップに進みます。

## Podのスケール
Deployment(Replicaset)によって起動されるPodの数はレプリカによって決まります。  
次のコマンドを実行して、Deploymentのレプリカを3に設定します。  

```bash
kubectl scale deployment hello-app --replicas=3
```

次のコマンドを実行して、Podの数が3つになっていることを確認します。

```bash
kubectl get all
```

このようにDeploymentを使用することで、同じ種類のPodを複数起動することができます。  

**[次へ]** ボタンをクリックして次のステップに進みます。

## Deploymentをインターネットに公開する

Deploymentをインターネットを公開する手順はPodと同じです。  
Serviceを使用します。  

次のコマンドを実行して、LoadBalancer タイプの Service を使用して hello-app Deployment をインターネットに公開します。

```bash
kubectl expose deployment hello-app --name=hello-app-deployment-service --type=LoadBalancer --port 80 --target-port 8080
```

このServiceはDeploymentによって作成されたPodをエンドポイントとしてインターネットに公開します。  

**補足**
ServiceはKubernetesクラスタ上で起動しているPodの中から、自身のエンドポイントとすべきPodを知る必要があります。  
これはDeploymentが付与する[ラベル](https://kubernetes.io/ja/docs/concepts/overview/working-with-objects/labels/)を用いて判断しています。  

(任意)シークレットウィンドウを開いて同じIPアドレスにアクセスします。  
レスポンスのホスト名が異なっていることが確認できます。  
これはServiceがバックエンドの3つのPodにリクエストを振り分けているためです。  

**[次へ]** ボタンをクリックして次のステップに進みます。

## 公開されたhello-appへのアクセス

次のコマンドを実行して、Serviceオブジェクトの情報を表示します。

```bash
kubectl get service
```

「hello-app-deployment-service」のEXTERNAL_IP アドレスをクリップボードにコピーします（例: 203.0.113.0）。

注：ロードバランサがプロビジョニングされるまでに1〜2分ほどかかることがあります。その間、pendingと表示されることがあります。少し待ってからから再度コマンドを実行します。

hello-app Pod が Serviceオブジェクト を介してインターネットに公開されたので、新しいブラウザタブを開き、クリップボードにコピーした Service の IP アドレスに移動します。

Hello, World! メッセージと Hostname フィールドが表示されます。  
クラスタ外からhello-app Podにアクセスできることを確認できました。

### ホスト名に関する補足
Hostnameフィールドには「hello-app-xxxxxxxx」のように表示されます。  
これはPod名がそのままコンテナのホスト名となっていることを表します。  

DeploymentはReplicaSetを経由して複数のPodを起動するため、  
Pod名が重複しないように、Pod名の末尾にランダムな文字列を付与しています。  

**[次へ]** ボタンをクリックして次のステップに進みます。

## アプリケーションの更新

### ソースコードの修正
hello-appのディレクトリに移動します。

```bash
cd ~/kubernetes-engine-samples/hello-app/
```

main.goを開きます。  
<walkthrough-editor-select-line filePath="main.go"></walkthrough-editor-select-line>

バージョン番号(48行目)を「2.0.0」に変更します。

### Dockerイメージのビルド
タグにv2を指定してDockerイメージをビルドします。  
次のコマンドを実行します。これには30秒〜2分ほどかかることがあります。

```bash
docker build -t gcr.io/${PROJECT_ID}/hello-app:v2 .
```

docker images コマンドを実行して、ビルドが成功したことを確認します。

```bash
docker images
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## Deploymentの更新


**[次へ]** ボタンをクリックして次のステップに進みます。

## 作成したリソースの削除

### Serviceを削除する
Service に作成した Cloud Load Balancer の割り当てを解除します。

```bash
kubectl delete service hello-app-deployment-service
```

### Deploymentを削除する
hello-app Deploymentを削除します

```bash
kubectl delete deployment hello-app
```

引き続きハンズオンを進める場合は次に進みます。
終了する場合は次のコマンドを実行してGKEクラスタを削除します。

```bash
gcloud container clusters delete k8s-handson
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## これで終わりです。

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

hello-appイメージを用いてGKEクラスタにDeploymentをデプロイし、インターネットに公開しました。  
またソースコードを変更し、hello-appの新しいバージョンをデプロイします。

ハンズオンの一覧は以下のサイトに記載されています。  

[はじめてのKubernetes 入門ハンズオン
](https://github.com/koizumittn/handson-for-begineers/tree/master/k8s)

**作業後は忘れずにクリーンアップする**: ハンズオンを終了する場合は、不要な料金の発生を避けるためにプロジェクトを削除してください。「gcloud projects delete $PROJECT_ID」を使用します。
