//
//  ContentView.swift
//  MyOkashi
//
//  Created by 木村朋広 on 2024/02/14.
//

import SwiftUI

struct ContentView: View {
    //OkashiDataを参照する変数
    var OkashiDataList = OkashiData()
    // 入力された文字列を保持する状態変数
    @State var inputText = ""
    // SafariViewの表示の有無を管理する変数
    @State var isShowSafari = false

    var body: some View {
        //垂直にレイアウト（縦方向にレイアウト）
        VStack {
            // 文字を受け取るTextFieldを表示する
            TextField("キーワード", text: $inputText,
                      prompt: Text("キーワードを入力してください"))
            .onSubmit {
                // 入力完了直後に検索する
                OkashiDataList.searchOkashi(keyword: inputText)
            } // .onSubmit ここまで
            // キーボードの改行を検索に変更する
            .submitLabel(.search)
            //上下左右に空白を空ける
            .padding()

            // リスト表示する
            List(OkashiDataList.OkashiList) { Okashi in
                // １つ１つの要素を取り出す
                // ボタンを用意する
                Button {
                    // 選択したリンクを保存する
                    OkashiDataList.OkashiLink = Okashi.link
                    // SafariViewを表示する
                    isShowSafari.toggle()
                } label: {
                    // listの表示内容を生成する
                    // 水平にレイアウト（横方向にレイアウト）
                    HStack {
                        // 画像を読み込み、表示する
                        AsyncImage(url: Okashi.image) { image in
                            // 画像を表示する
                            image
                            // リサイズする
                                .resizable()
                            // アスペクト比（縦横比）を維持してエリア内に収まるようにする
                                .scaledToFit()
                            // 高さ40
                                .frame(height: 40)
                        } placeholder: {
                            // 読み込み中はインジケーターを表示する
                            ProgressView()
                        }
                        //テキスト表示する
                        Text(Okashi.name)
                    } //HStackここまで
                } //buttonここまで
            } // listここまで
            .sheet(isPresented: $isShowSafari, content: {
                // SafariViewを表示する
                SafariView(url: OkashiDataList.OkashiLink!)
              // 画面下部がセーフエリア外までいっぱいになるように指定
                    .ignoresSafeArea(edges:[.bottom])
            })
        } //VStack ここまで
    } // body ここまで
} // ContentView ここまで

#Preview {
    ContentView()
}
