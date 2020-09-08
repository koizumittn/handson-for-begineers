# ステップ9：テーブルの結合
このステップでは**JOIN句**を用いて複数のテーブルを結合する方法について学びます。  

## テーブルの結合
visitテーブルの中身をみてみましょう。件数が多いためLIMIT句を用いて5レコードを表示します。  

**[9-1]visitテーブルのデータを5件表示**
```sql
SELECT * FROM visit LIMIT 5;
```

![visitテーブル](https://user-images.githubusercontent.com/22129880/92480114-6f186880-f21f-11ea-9b52-9f9e5b6bf9d4.png)　　

ここでshop_idおよびuser_idのカラムに着目してみましょう。  
shop_idはユーザーが訪れたラーメン店のID、  
user_idはそのユーザーのIDです。  

IDを見ただけでは店舗やユーザが分かりにくいですよね？  
visitテーブルのデータにラーメン店の名前やユーザーの氏名を表示させることはできないでしょうか？  
それらのデータはshopテーブルやuserテーブルに含まれています。  
このような時に行うのが**テーブルの結合**であり、**JOIN句**を使用します。  

## クロス結合
試しにvisitテーブルとuserテーブルを結合してみましょう。  
テーブルを結合するには,(カンマ)で区切って記述するか**JOIN句**を使用します。  
以下の２つのSQLは同じ意味です。  

**[9-2]visitテーブルとuserテーブルをクロス結合する**
```sql
SELECT * FROM visit, user;  
SELECT * FROM visit JOIN user;  
```

このSQLを実行すると以下の画像のような結果が得られます。  

![visitテーブルとuserテーブルの外部結合](https://user-images.githubusercontent.com/22129880/92470432-5e60f600-f211-11ea-8348-3bf7cb336eac.png)  

どのようにvisitテーブルとuserテーブルは結合されたでしょうか？  
まず、１つのレコードにvisitテーブルのカラムとuserテーブルのカラムの両方が含まれていることがわかりますね。  
続いて、visitテーブルのid = 1のレコードが複数あり、それぞれにuserテーブルのレコード(id = 1, 2, ・・・)が結合されています。  

userテーブルの登録数は20ですので、１つのvisitレコードに結合されるuserデータも20個です。  
visitテーブルの登録数は100ですので、結合結果のトータルでは**100 x 20 = 2000レコード**もの巨大なテーブルとなっています。  

このように２つのテーブルのレコード同士をすべて結合することを**クロス結合**とよびます。  
(関係代数では**直積**とよばれます)  

しかし、今回のやりたいこととはマッチしていません。  
visit id = 1のレコードではuser_idカラムの値は6ですので、ID=6のユーザ情報のみわかれば十分のはずです。  
このようにクロス結合はあまり使われず、特定の条件を満たすレコードのみ結合する方法が必要です。  

## 内部結合
2つのテーブルを比較し、結合条件に一致した行だけを返す結合を**内部結合**と呼びます。  
結合条件は**ON句**に記述します。  

```sql
SELECT * FROM テーブル1 JOIN テーブル2 ON 結合条件;
```

上記の例ではvisitテーブルとuserテーブルを結合してできたレコードのうち、  
**visitテーブルのuser_idカラムの値とuserテーブルのidカラムの値が一致するレコードのみ必要です。**  
以下の図のようになります。  

![抽出したいレコード](https://user-images.githubusercontent.com/22129880/92473757-fb259280-f215-11ea-82e6-c51918ee8c08.png)  

それでは、これを結合条件としてON句に記述します。  
結合条件でカラムを指定する時は、どのテーブルのカラムかを特定するため、  
**テーブル名.カラム名**の形式で記述します。  

**[9-3]visitテーブルとuserテーブルを内部結合する**
```sql
SELECT * FROM visit JOIN user ON visit.user_id = user.id;  
```

![内部結合](https://user-images.githubusercontent.com/22129880/92474553-ff9e7b00-f216-11ea-9d2a-4de7c72560dd.png)  

これでvisitテーブルとuserテーブルを結合し、必要なレコードのみ抽出することができました。  

## テーブル結合時の列の選択
visitテーブルとuserテーブルの結合の目的がユーザの氏名を取得することでした。  
上の例では両テーブルのすべてのカラムが含まれていたため、必要なカラムのみに絞り込みましょう。  

カラムの絞り込みはステップ4の通りSELECT句の後ろにカラム名を記述します。  
しかし、結合時はどのテーブルのカラムかを明確にするため、結合条件と同様に**デーブル名.カラム名**の形式で指定します。  

**[9-4]visitテーブルとuserテーブルを内部結合し、必要なカラムに絞り込む**
```sql
SELECT visit.id, visit.shop_id, user.name, visit.rank FROM visit JOIN user ON visit.user_id = user.id;  
```

![テーブル結合時のカラム指定](https://user-images.githubusercontent.com/22129880/92475577-961f6c00-f218-11ea-8013-1c0667cc9a8a.png)


## 3つのテーブルを結合
上記にshopテーブルのデータも結合し、ユーザーが訪れたラーメン店の店舗名を取得・表示させましょう。  
要領は同じく、JOIN句とON句を使用し3つめのテーブルとしてshopテーブルを結合します。

**[9-5]visitテーブルにuserテーブルとshopテーブルを結合し、ユーザー氏名・ラーメン店名を抽出する**
```sql
SELECT visit.id,  shop.name, user.name, visit.rank FROM visit JOIN user ON visit.user_id = user.id JOIN shop ON visit.shop_id = shop.id; 
```

![3つのテーブルを結合](https://user-images.githubusercontent.com/22129880/92476473-f95dce00-f219-11ea-8e38-378637670628.png)

## 外部結合
内部結合の結果(条件に一致するレコード)に加えて、元のテーブルや結合するテーブルのレコードをすべて表示させるやり方が外部結合です。  
ここでは名前の紹介のみに留めるため、興味のある方はご自身で調べて見てください。  

|外部結合の種類|概要|
| --- | --- |
| LEFT JOIN | 結合条件に一致するものに加え、左側(=FROM句で指定したテーブル)に存在するレコードも合わせて表示 |
| RIGHT JOIN | 結合条件に一致するものに加え、右側(=JOIN句で指定したテーブル)に存在するレコードも合わせて表示 |
| FULL JOIN | 上記の両方を表示 |

## 補足
### SQL文を改行する
SQLはセミコロンで文末を判定するため、途中で改行することができます。  
長いSQL文は改行やインデントを活用して見やすくしましょう。  

**[9-5a]SQL文を改行して見やすくする**
```sql
SELECT
    visit.id,
    shop.name,
    user.name,
    visit.rank
FROM
    visit
JOIN
    user
ON
    visit.user_id = user.id
JOIN
    shop
ON
    visit.shop_id = shop.id;
```

### テーブル結合時のカラムにAS句で別名を付ける
テーブル結合時にもやはりAS句でわかりやすい別名を付けることがおすすめです。  
[9-5]の例では「name」というカラムが2つできてしまっていますので、  
別名を使用して誤解を生まないようにしましょう。  

**[9-5b]AS句で別名を付けて見やすくする**
```sql
SELECT
    visit.id AS 訪問ID,
    shop.name AS 店舗名,
    user.name AS ユーザー氏名,
    visit.rank AS 評価
FROM
    visit
JOIN
    user
ON
    visit.user_id = user.id
JOIN
    shop
ON
    visit.shop_id = shop.id;
```

![テーブル結合時のAS句](https://user-images.githubusercontent.com/22129880/92478115-acc7c200-f21c-11ea-8e2b-6535eeaf1a1a.png)

## 練習問題
1. visitテーブルから最もユーザーの訪問数が多い店舗を求めましょう。  
※ここではテーブルの結合は不要です。  
2. 1で求めた店舗に訪問したユーザの氏名と年齢を表示させてみましょう。  

回答は[こちら](009-join-answer.md)  

以上でハンズオンは終了です。  
お疲れ様でした！  

前のステップ：[グループ化](008-group.md)  
[目次に戻る](README.md)
