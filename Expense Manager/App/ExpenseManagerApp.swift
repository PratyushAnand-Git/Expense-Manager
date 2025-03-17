//
//  ExpenseManagerApp.swift
//  Expense Manager
//
//  Created by student on 17/03/25.
//
import SwiftUI
import SwiftData

@main
struct ExpenseManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ExpenseManagerTabView() // Set TabView as the entry point
                .modelContainer(for: Expense.self)
        }
    }
}
