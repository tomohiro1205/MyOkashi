//
//  safariView.swift
//  MyOkashi
//
//  Created by 木村朋広 on 2024/02/15.
//

import SwiftUI
import SafariServices

// SFSafariViewControllerを起動する構造体
struct SafariView: UIViewControllerRepresentable {
    // 表示するホームページのURLを受け取る変数
    let url: URL

    // 表示するViewを生成する時に実行
    func makeUIViewController(context: Context) -> SFSafariViewController {
        // Safariを起動
        return SFSafariViewController(url: url)
    }

    // viewが更新された時に実行
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        //処理なし
    }
} // SafariViewここまで

