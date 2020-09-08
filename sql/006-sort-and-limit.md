# ステップ6：並び替えと制限
このステップでは**ORDER BY句**による並び替えと**LIMIT句**による制限を学びます。  

## ORDER BY句による並び替え
ORDER BY句を使用すると、特定のカラムの値に基づいて、レコードの表示順を並び替えることができます。  
並び順は昇順、降順を選択でき、それぞれASC句、DESC句を使用します。  
ASC句、DESC句のどちらも記載しなかった場合は昇順になります。  


```sql
SELECT * FROM テーブル名 ORDER BY カラム名 ASC;
SELECT * FROM テーブル名 ORDER BY カラム名 DESC;
```

それでは実際にレコードを並び替えるSQLを実行してみましょう。  

## ハンズオン
shopテーブルのレコードを月間売上高(salesカラム)が高い順に表示します。  
降順となるためDESC句を付与します。

**[6-1]shopテーブルのレコードを月間売上高(salesカラム)が高い順に並び替える**
```sql
SELECT name, sales FROM shop ORDER BY sales DESC; 
```

以下のように指定したカラムのデータを得られます。  
![ORDER BY句](https://user-images.githubusercontent.com/22129880/92437609-4de55700-f1e2-11ea-8bea-069ce1ef80f6.png)

画像のようにsalesカラムの値が大きい順にレコードが並び替えられていることがわかると思います。  

## LIMIT句によるレコード数の制限
**LIMIT句**を使用すると取得するレコード数を制限することができます。  

```sql
SELECT * FROM テーブル名 LIMIT 制限するレコード数;
```

以下の例ではvisitテーブルより先頭から10行のレコードを取得します。  

**[6-2]visitテーブルの先頭10レコードを抽出する**  
```sql
SELECT * FROM visit LIMIT 10;
```

また、 **OFFSET句**と組み合わせると、  
制限したレコード数を先頭からではなく、任意の位置から取得することができます。

```sql
SELECT * FROM テーブル名 LIMIT 制限するレコード数 OFFSET 開始位置;
```

**[6-3]visitテーブルの51番目のレコードから10レコードを抽出する**
```sql
SELECT * FROM visit LIMIT 10 OFFSET 50;
```

## 練習問題
1. userテーブルのデータを年齢(ageカラムの値)が低い順にソートして取得してみましょう。  
2. shopテーブルより売上(salesカラムの値)が高い順にソートし、上位5店舗のレコードのみ抽出してみましょう。  

回答は[こちら](006-sort-and-limit-answer.md)  

前のステップ：[条件に一致する行を抽出する](005-where.md)  
次のステップ：[集計関数](007-aggregation.md)  
[目次に戻る](README.md)
