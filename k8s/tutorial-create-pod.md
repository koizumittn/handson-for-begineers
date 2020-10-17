# DockerコンテナのビルドとGKEクラスタへのPodのデプロイ

## さあ始めましょう。

このガイドではGoogleが提供するhello-appというシンプルなサンプルアプリケーションのDockerコンテナをビルドし、GKEクラスタにPodとしてデプロイします。

**目次**
1. サンプルアプリケーションhello-appのクローン
2. Dockerコンテナイメージのビルド
3. コンテナをローカル(Cloud Shell)に実行する
4. Docker イメージを Container Registry に push する
5. サンプルアプリを GKE にデプロイする
6. サンプルアプリをインターネットに公開する
7. 作成したリソースの削除

**所要時間**: 約 15 分

**前提条件**  
GKEクラスタ「k8s-handson」を作成済みであること  
※作成済みでない場合は[こちらのページ](https://github.com/koizumittn/handson-for-begineers/tree/master/k8s)のステップ1「GKEクラスタの作成」を実施してください。

**本チュートリアルについて**  
GKEチュートリアル「[コンテナ化されたウェブ アプリケーションのデプロイ
](https://cloud.google.com/kubernetes-engine/docs/tutorials/hello-app)」をベースとしています。

**hello-appについて**  
hello-appはGoで作成されたウェブサーバーで、ポート8080のすべてのリクエストに対して「Hello, World!」というメッセージを返します。

hello-app を Kubernetesクラスタ にデプロイする前に、hello-app ソースコードを Docker イメージとしてパッケージ化する必要があります。

Docker イメージを作成するには、ソースコードと Dockerfile が必要です。Dockerfile には、イメージの作成方法に関する手順が含まれています。

**[開始]** ボタンをクリックして次のステップに進みます。

## サンプルアプリケーションhello-appのクローン

Cloud Shellのホームディレクトリに移動します。

```bash
cd
```

次のコマンドを実行して、hello-app ソースコードと Dockerfile をダウンロードします。

```bash
git clone https://github.com/GoogleCloudPlatform/kubernetes-engine-samples
```

hello-appのディレクトリに移動します。

```bash
cd kubernetes-engine-samples/hello-app
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## Dockerコンテナイメージのビルド

PROJECT_ID 環境変数に Google Cloud プロジェクト IDを設定します。PROJECT_ID 変数は、コンテナ イメージをプロジェクトの Container Registry に関連付けるために使用されます。

```bash
export PROJECT_ID=$(gcloud config get-value project); echo $PROJECT_ID
```

Dockerイメージをビルドします。30秒〜2分ほどかかることがあります。

```bash
docker build -t gcr.io/${PROJECT_ID}/hello-app:v1 .
```

このコマンドを実行すると、Docker は現在のディレクトリにある Dockerfile を使用してイメージをビルドし、gcr.io/my-project/hello-app:v1 などの名前を使用してタグ付けします。gcr.io 接頭辞は、イメージがホストされる Container Registry を表します。このコマンドを実行してもイメージはまだアップロードされません。

docker images コマンドを実行して、ビルドが成功したことを確認します。

```bash
docker images
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## コンテナをローカル(Cloud Shell)に実行する

ビルドしたDockerイメージによるコンテナをKubernetesクラスタにデプロイする前に、
ローカルに起動して動作をテストします。

次のコマンドを実行して、ローカル Docker エンジンを使用してコンテナを起動します。

```bash
docker run --rm -p 8080:8080 gcr.io/${PROJECT_ID}/hello-app:v1
```

これによりhello-appのDockerコンテナが起動し、ローカル(Cloud Shell)の8080番ポートへのリクエストをhello-appの8080番ポートへ転送されるようになります。

[ウェブでプレビュー] ボタン <walkthrough-web-preview-icon></walkthrough-web-preview-icon> をクリックして、ポート番号 8080 を選択します。  
新しいブラウザウィンドウが開き、「Hello, world!」と表示されればOKです。

正常なレスポンスを確認したら、docker run コマンドを実行中のタブで Ctrl+C キーを押してコンテナをシャットダウンします。

**[次へ]** ボタンをクリックして次のステップに進みます。

## Docker イメージを Container Registry に push する

次のコマンドを実行して、Docker コマンドライン ツールから [Container Registry](https://cloud.google.com/container-registry?hl=ja) への認証を構成します。

```bash
gcloud auth configure-docker
```

次のコマンドを実行して、ビルドした Docker イメージを Container Registry に push します。

```bash
docker push gcr.io/${PROJECT_ID}/hello-app:v1
```

これにより、Container RegistyにpushされたDockerイメージを使用して、KubernetesクラスタにDockerコンテナをデプロイできるようになります。

**[次へ]** ボタンをクリックして次のステップに進みます。

## サンプルアプリを GKE にデプロイする

次のコマンドを実行して、Container RegistyにpushされたDockerイメージを使用して、GKEクラスタにPodをデプロイします。

```bash
kubectl run hello-app --image=gcr.io/${PROJECT_ID}/hello-app:v1
```

作成した Pod を表示するには、次のコマンドを実行します。

```bash
kubectl get pods
```

「SATUS」列が**Running**となっていればPodが正常に起動しています。  

「-o wide」オプションを付けるとPodに割り当てられたIPアドレスなど、より多くの情報を表示できます。

```bash
kubectl get pods -o wide
```

kubectl describeコマンドを使用すると、Podの詳細な仕様やステータスを表示できます。

```bash
kubectl describe pods hello-app
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## hello-appをインターネットに公開する

### Serviceオブジェクトについて

Pod には個別に割り当てられた IP アドレスがありますが、これらの IP にはクラスタ内からしかアクセスできません。
クラスタ外からPodにアクセスするためにServiceオブジェクトを使用します。

GKEではServiceタイプを**LoadBalancer**に指定することで、[Cloud Load Balancing(負荷分散のマネージドサービス)](https://cloud.google.com/load-balancing?hl=ja) の機能を利用して、
インターネット経由で到達可能なIPアドレスを生成し、Podにトラフィックを転送できるようになります。

### Serviceオブジェクトの作成

次のコマンドを実行して、LoadBalancer タイプの Service を使用して hello-app Pod をインターネットに公開します。

```bash
kubectl expose pod hello-app --name=hello-app-service --type=LoadBalancer --port 80 --target-port 8080
```

kubectl exposeコマンドは指定したKubernetesオブジェクトに対応するServiceオブジェクトを作成します。

ここで、--port フラグはロードバランサ上で構成されたポート番号を指定し、--target-port フラグは hello-app コンテナがリッスンするポート番号を指定します。

つまりロードバランサの80番ポートにリクエストを送ると、hello-appコンテナの8080番ポートに転送され、hello-appからのレスポンスを得ることができます。

**[次へ]** ボタンをクリックして次のステップに進みます。

## 公開されたhello-appへのアクセス

次のコマンドを実行して、Serviceオブジェクト「hello-app-service」の情報を表示します。

```bash
kubectl get service
```

「hello-app-service」のEXTERNAL_IP アドレスをクリップボードにコピーします（例: 203.0.113.0）。

注：ロードバランサがプロビジョニングされるまでに1〜2分ほどかかることがあります。その間、pendingと表示されることがあります。少し待ってからから再度コマンドを実行します。

hello-app Pod が Serviceオブジェクト を介してインターネットに公開されたので、新しいブラウザタブを開き、クリップボードにコピーした Service の IP アドレスに移動します。

Hello, World! メッセージと Hostname フィールドが表示されます。  
クラスタ外からhello-app Podにアクセスできることを確認できました。

### ホスト名に関する補足
Hostnameフィールドには「hello-app」と表示されます。  
これはコンテナのホスト名が出力されており、Pod名がそのままコンテナのホスト名となっていることを表します。

ローカル(Cloud Shell)でコンテナを起動した際はHostnameフィールドは「0776c4b14045」のようなIDが表示されていました。  
これはDockerによってランダムに割り当てられたIDがコンテナのホスト名となっています。

**[次へ]** ボタンをクリックして次のステップに進みます。

## 作成したリソースの削除

### Serviceを削除する
Service に作成した Cloud Load Balancer の割り当てを解除します。

```bash
kubectl delete service hello-app-service
```

### Podを削除する
hello-app Podを削除します

```bash
kubectl delete pod hello-app
```

引き続きハンズオンを進める場合は次に進みます。
終了する場合は次のコマンドを実行してGKEクラスタを削除します。

```bash
gcloud container clusters delete k8s-handson
```

**[次へ]** ボタンをクリックして次のステップに進みます。

## これで終わりです。

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

ローカルでビルドしたhello-appのDockerイメージをContainer Registryにpushし、GKEクラスタへのデプロイ・インターネット公開が完了しました。

次のハンズオン「Deploymentの作成とアプリケーションの更新」に進む場合は次のコマンドを実行します。

```bash
cloudshell launch-tutorial -d ~/cloudshell_open/handson-for-begineers/k8s/tutorial-create-deployment.md
```


ハンズオンの一覧は以下のサイトに記載されています。  
ハンズオンを続ける場合は「Deploymentの作成とアプリケーションの更新」に進みます。

[はじめてのKubernetes 入門ハンズオン](https://github.com/koizumittn/handson-for-begineers/tree/master/k8s)

**作業後は忘れずにクリーンアップする**: ハンズオンを終了する場合は、不要な料金の発生を避けるためにプロジェクトを削除してください。「gcloud projects delete $PROJECT_ID」を使用します。
