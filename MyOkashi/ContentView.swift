//
//  ContentView.swift
//  MyOkashi
//
//  Created by 木村朋広 on 2024/02/14.
//

import SwiftUI

struct ContentView: View {
    //OkashiDataを参照する変数
    var okashiDataList = OkashiData()
    // 入力された文字列を保持する状態変数
    @State var inputText = ""

    var body: some View {
        //垂直にレイアウト（縦方向にレイアウト）
        VStack {
            // 文字を受け取るTextFieldを表示する
            TextField("キーワード", text: $inputText,
                      prompt: Text("キーワードを入力してください"))
            .onSubmit {
                // 入力完了直後に検索する
                okashiDataList.searchOkashi(keyword: inputText)
            } // .onSubmit ここまで
            // キーボードの改行を検索に変更する
            .submitLabel(.search)
            //上下左右に空白を空ける
            .padding()
        } //VStack ここまで
    } // body ここまで
} // ContentView ここまで

#Preview {
    ContentView()
}
