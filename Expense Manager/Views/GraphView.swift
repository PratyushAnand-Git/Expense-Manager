//
//  GraphView.swift
//  Expense Manager
//
//  Created by student on 17/03/25.
//
import SwiftUI
import Charts
import SwiftData

struct GraphView: View {
    @Query var expenses: [Expense] // Fetch expenses using SwiftData Query

    var body: some View {
        VStack {
            Text("Expense History")
                .font(.title)
                .padding()

            if expenses.isEmpty {
                Text("No expense history available.")
                    .font(.body)
                    .foregroundColor(.gray)
            } else {
                Chart(expenses) { expense in
                    LineMark(
                        x: .value("Date", expense.date, unit: .day),
                        y: .value("Amount", expense.amount)
                    )
                    .foregroundStyle(Color.orange.gradient)
                }
                .chartXAxis {
                    AxisMarks(format: .dateTime.day().month())
                }
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
                .frame(height: 300)
                .padding()
            }
        }
        .navigationTitle("Expense History")
        .padding()
    }
}

//struct GraphView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Attempt to create the model container
//        let container: ModelContainer
//        do {
//            container = try ModelContainer(for: Expense.self)
//        } catch {
//            // Handle failure gracefully
//            fatalError("Preview failed to create model container: \(error.localizedDescription)")
//        }
//
//        // Add sample data to the context
//        let context = ModelContext(container)
//        context.insert(Expense(name: "Groceries", amount: 150, date: Date()))
//        context.insert(Expense(name: "Transport", amount: 80, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!))
//        context.insert(Expense(name: "Dining", amount: 200, date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!))
//
//        // Render the GraphView with mock data
//        return GraphView()
//            .modelContainer(container)
//    }
//}
// 
