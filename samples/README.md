# Google Custom Search の調査


## Custom Search Element

- 使うAPIの名前は Custom Search Element
- 過去に何度か名前が変わっていて、過去のものは非推奨になってたり廃止されていたりする
- 公式マニュアル https://developers.google.com/custom-search/docs/element


## 設置手順

- まず、ここから https://www.google.com/cse/all カスタム検索IDを作る
  - 後で表示や検索結果調整のために使う、以後コントロールパネル（コンパネ）と呼ぶ
- 後はHTMLにコードを貼り付けて置くだけ
  - 例 http://googlecustomsearch.appspot.com/elementv2/full-width_v2.html
  - 作ったドメイン以下に配置しなくてもいい、というかローカルでも良い
  - ちなみに、自分で初期設定のまま作ったIDを設置すると検索結果がオーバーレイ表示になるが、それは コンパネ＞検索機能＞レイアウト から変更できる


## 特定のディレクトリ以下を検索対象にできるか？

as_sitesearch 属性で設定する。

```
<gcse:search as_sitesearch="kray.jp/blog/"></gcse:search>
```

しかし、このオプションはマニュアル上だと `Restrict results to pages from a specific site.` としか書いおらず、
記述例もドメインまでしか書いてない。

ディレクトリまで含むのが仕様なのかが不明。


## 見た目の自由度について

対応パターンの例

- CSSで修正
  - 検索結果HTML要素のIDが `___gcse_0` なので、それ以下を修正する
- コンパネから修正
  - 検索結果データに関する設定はここで行う。サムネイルON/OFFやソート順など
- フルカスタマイズ
  - 出来るみたい.. たが、ビジネスアカウントが必要で、システムからXMLを生成しないといけないよう
  - ということで、これ以後調査していない
  - マニュアル https://developers.google.com/custom-search/docs/snippets


## 検索結果のハイライト

bタグを付与してくれているので、それをCSSで修正する


## 検索順位

ソート順のこと？

- sorty_by 属性を設定するとできる、デフォルトは "Relevance"(妥当順？)
  - デフォルトで設定可能なのは、その他に Date 順のみ
  - ・・・と書いてあるが実際に設定してもその順にならない、要調査
- ただし、それ以外の項目でソートさせたい場合は、こちらで何かを出力して API 側に知らせる必要があるらしい
  - ここで一旦調査は保留にしている
  - 項目の追加は、コンパネ＞検索機能＞詳細設定＞検索結果の並び替え からできる
  - マニュアル Sort results https://support.google.com/customsearch/answer/2549537


## サムネイル

- デフォルト出力される
- 非表示にする場合は コンパネ＞デザイン＞サムネイル から


## ページネーション

- 出力形式にもよるが、デフォルトで出力される
- ページ番号を押したら `Uncaught google.ads.search.Ads: browserClass_ is not defined` とでてしまう


## 気になる点

- 検索結果に広告が出るとのことだが
  - コンパネ＞設定＞エディションに「無料ですが広告が表示されます。」と出ている
  - しかし、実際は出ていない。この点が不明。あまり調査していない


## デモ

demo.html