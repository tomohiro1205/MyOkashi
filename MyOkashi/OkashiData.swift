//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 木村朋広 on 2024/02/14.
//


import SwiftUI

// お菓子データ検索用クラス
@Observable class OkashiData {
    // web API検索用メソッド　第一引数：keyword 検索したいワード
    func searchOkashi(keyword: String) {
        //デバッグエリアに出力
        print("searchOkashiメソッドで受け取った値：\(keyword)")

        // Takは非同期で処理を実行できる
        Task {
            // ここから先は非同期で処理される
            // 非同期でお菓子を検索する
            await search(keyword: keyword)
        } // Task ここまで
    } // searchOkashi ここまで

    // 非同期でお菓子データおw取得
    private func search(keyword: String) async {
        // お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else {
            return
        }

        // リクエストURLの組み立て
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        //デバッグエリアに出力
        print(req_url)
    } //search ここまで
} // OkashiData ここまで
