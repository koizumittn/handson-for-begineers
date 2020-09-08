# ステップ8：グループ化
このステップでは**GROUP BY句**を用いたデータのグループ化について学びます。  

## グループ化
GROUP BY句を使用すると指定したカラムの値が同じレコード同士をグループとしてまとめます。(グループ化)  
そして集計関数を使用してグループごとのデータを集計することができます。

```sql
SELECT 集計関数(カラム名) FROM テーブル名 GROUP BY グループ化するカラム名;
```
それでは実際にGROUP BY句を含むSQLを実行してみましょう。  

## ハンズオン
shopテーブルにおける登録店舗のうち、都道府県(locationカラム)別に平均売上額(salesカラム)を算出します。  

**[8-1]都道府県別平均売上額の算出**

```sql
SELECT location, AVG(sales) FROM shop GROUP BY location;
```

![GROUP BY](https://user-images.githubusercontent.com/22129880/92444456-e1705500-f1ed-11ea-97e0-e68c725c280b.png)

画像のように都道府県ごとの平均売上額が計算されていることがわかると思います。  
また集計関数の結果のみ表示すると、どの都道府県の値かがわからなくなってしまうため、  
locationカラムも合わせて表示するようにしています。  

## 補足
グループごとの集計結果を元にソートすることも可能です。  

**[8-2]平均売上額の高い順に都道府県をソート**

```sql
SELECT location, AVG(sales) FROM shop GROUP BY location ORDER BY AVG(sales) DESC;
```

この時、以下のように集計関数にAS句で別名を付けるとORDER BY句でも使用でき、扱いやすくなります。

**[8-3]平均売上額の高い順に都道府県をソート(AS句を使用)**

```sql
SELECT location AS 都道府県, AVG(sales) AS 平均売上額 FROM shop GROUP BY location ORDER BY 平均売上額 DESC;
```

## 練習問題
1. visitテーブルより評価(rankカラム、1〜5の値)ごとの件数を求めましょう。  
2. userテーブルより男性、女性それぞれの年齢(ageカラム)から最大値を求めましょう。  

回答は[こちら](008-group-answer.md)  

前のステップ：[集計関数](007-aggregation.md)  
次のステップ：[テーブルの結合](009-join.md)  
[目次に戻る](README.md)
